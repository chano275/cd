PROJ_DIR=${PWD}
BUILD=${PROJ_DIR}/build
SRC=${PROJ_DIR}/src
INC=${PROJ_DIR}/include
BIN=${PROJ_DIR}/bin

SRCS := ${shell find ${SRC} -name "*.c"}

OBJS=${BUILD}/myapp.o ${BUILD}/foo.o ${BUILD}/goo.o



all: dep ${BIN}/myapp

${BIN}/myapp: ${OBJS}
	gcc ${OBJS} -o ${BIN}/myapp

${BUILD}/%.o: ${SRC}/%.c
	gcc -c $< -I${INC} -o $@

clean:
	rm ${BUILD}/*.o
	rm ${BIN}/*
	rm -f .depend

dep: .depend

.depend: ${SRCS}
	rm -f ./.depend
	gcc -c -I${INC} -M $^ > ./.depend

include ./.depend
# FIRST DEPENDENCY = $<
# TARGET = $@
# -M : HEADER FILE SEARCH

