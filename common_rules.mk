# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    common_rules.mk                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bgenia <bgenia@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/09/28 04:11:03 by bgenia            #+#    #+#              #
#    Updated: 2021/09/28 05:41:53 by bgenia           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ifndef _MKT_COMMON_RULES_MK_
_MKT_COMMON_RULES_MK_ := 1

ifndef _MKT_COMMON_CONFIG_MK_

$(error maketools/common_rules requires maketools/common_config to work)

endif

# Utility variables

OBJ_DIRS = $(sort $(dir $(foreach obj_var,$(filter OBJ%,$(.VARIABLES)),$($(obj_var)))))

# Default targets

all bonus: $(BINS)

bonus: CPPFLAGS += -DBONUS

# Binary target

$(BINS):
ifdef LIBS
	$(MAKE) $(LIBS)
endif
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

# Object target

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIRS)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

# Object folder target

$(OBJ_DIRS):
	mkdir -p $@

endif
