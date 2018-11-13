# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: popanase <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/09 14:26:53 by popanase          #+#    #+#              #
#    Updated: 2018/03/19 18:33:40 by popanase         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

SRC = ft_printf.c ft_conver_x.c ft_conver_o.c ft_conver_s.c ft_conver_c.c \
	  ft_conver_id.c ft_conver_u.c ft_conver_per.c ft_conver_p.c ft_conver_lc.c \
	  ft_conver_ls.c ft_conver_inv.c ft_readformat.c ft_helper_lc_ls.c

OBJ = $(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	make -C libft
	cp libft/libft.a ./$(NAME)
	ar rc $@ $^
	
%.o: %.c
	gcc -Wall -Wextra -Werror -c $<

clean: 
	make clean -C libft
	rm -f $(OBJ)

fclean: clean 
	make fclean -C libft
	rm -f libft.a
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re libftprintf.a
