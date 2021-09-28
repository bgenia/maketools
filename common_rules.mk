# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    common_rules.mk                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/28 04:11:03 by bgenia            #+#    #+#              #
#    Updated: 2021/09/28 06:06:51 by bgenia           ###   ########.fr        #
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

# Default targets

all bonus: $(BINS)

bonus: CPPFLAGS += -DBONUS

# Binary target

$(_MKT_BINS_LIB_STATIC):
	$(AR) -rcs $@ $^

$(_MKT_BINS_LIB_SHARED):
	$(CC) -shared $^ -o $@

$(_MKT_BINS_LIB_DYLIB):
	$(CC) -dynamiclib $^ -o $@

$(_MKT_BINS_EXECUTABLE):
ifdef LIBS
	$(MAKE) $(LIBS)
endif
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

# Object target

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(_MKT_OBJ_DIRS)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

# Object folder target

$(_MKT_OBJ_DIRS):
	mkdir -p $@

endif
