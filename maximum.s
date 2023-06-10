#PURPOSE:   find the maximum number in a set of data items

#VARIABLES:
#
#   %edi    index of data being examined
#   %ebx    largest data item found
#   %eax    current data item
#
#   data_items  item data, terminated with 0

.section .data

data_items:                 # the data items to work on
    .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text

.globl _start
_start:
    movl $0, %edi                   # move 0 to the index register
    movl data_items(,%edi,4), %eax  # load the first byte of data
    movl %eax, %ebx                 # set max to be first item by def

start_loop:
    cmpl $0, %eax                   # check to see if we hit the end
    je loop_exit
    incl %edi                       # load next value
    movl data_items(,%edi,4), %eax
    cmpl %ebx, %eax                 # compare values
    jle start_loop                  # jump to loop beginning if not bigger
    movl %eax, %ebx                 # move value as the largest
    jmp start_loop                  # unconditional jump to loop begin

loop_exit:
    movl $1, %eax
    int $0x80
