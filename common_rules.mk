# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    common_rules.mk                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/28 04:11:03 by bgenia            #+#    #+#              #
#    Updated: 2022/04/26 13:19:32 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifndef _MKT_COMMON_RULES_MK_
_MKT_COMMON_RULES_MK_ := 1

ifndef _MKT_COMMON_CONFIG_MK_
    $(error maketools/common_rules requires maketools/common_config to work)
endif

# Utility variables

_MKT_OBJ_DIRS = $(sort $(dir $(foreach obj_var,$(filter OBJ%,$(.VARIABLES)),$($(obj_var)))))

_MKT_BINS_LIB_STATIC = $(filter lib%.a,$(BINS))
_MKT_BINS_LIB_SHARED = $(filter lib%.so,$(BINS))
_MKT_BINS_LIB_DYLIB = $(filter lib%.dylib,$(BINS))
_MKT_BINS_EXECUTABLE = $(filter-out $(_MKT_BINS_LIB_STATIC) $(_MKT_BINS_LIB_SHARED) $(_MKT_BINS_LIB_DYLIB),$(BINS))

# Binary target

.LANGUAGE ?= C

ifeq ($(.LANGUAGE),C)
    _MKT_COMPILE = $(COMPILE.c)
    _MKT_LINK = $(LINK.o)
endif

ifeq ($(.LANGUAGE),CXX)
    _MKT_COMPILE = $(COMPILE.cc)
    _MKT_LINK = $(CXX) $(LDFLAGS)
endif

$(BINS): $(LIBS)

$(_MKT_BINS_LIB_STATIC):
	$(AR) -rcs $@ $^

$(_MKT_BINS_LIB_SHARED):
	$(_MKT_LINK) -shared $^ -o $@

$(_MKT_BINS_LIB_DYLIB):
	$(_MKT_LINK) -dynamiclib $^ -o $@

$(_MKT_BINS_EXECUTABLE):
	$(_MKT_LINK) $^ $(LDLIBS) -o $@

# Object target

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(_MKT_OBJ_DIRS)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

# Object folder target

$(_MKT_OBJ_DIRS):
	mkdir -p $@

# Clean utility target

.PHONY: clean

clean:
	$(RM) -r $(OBJ_DIR)/*

# Fclean utility target

.PHONY: fclean

fclean: clean
	$(RM) -r $(BINS)

# Re utility target

.PHONY: re

re: fclean
	$(MAKE)

# Libs utility target

.PHONY: libs

libs: $(LIBS)

# Cleanlibs utility target

.PHONY: cleanlibs

cleanlibs: $(foreach lib,$(LIBS),$(lib)@clean)

# Fcleanlibs utility target

.PHONY: fcleanlibs

fcleanlibs: $(foreach lib,$(LIBS),$(lib)@fclean)

# Relibs utility target

.PHONY: relibs

relibs: $(foreach lib,$(LIBS),$(lib)@re)

endif
