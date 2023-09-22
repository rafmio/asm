.section .data

.globl people, numpeople

numpeople:
	# Calculate the number of people in arra
	.quad (endpeople - people) / PERSON_RECORD_SIZE

people:	    # marks beginning of the array
	.quad $gkcname, 200, 10, 2, 74, 20 
	.quad $jbname,  280, 12, 2, 72, 44
	.quad $cslname, 150,  8, 1, 68, 30
	.quad $taname,  250, 14, 3, 75, 24
	.quad $inname,  250, 10, 4, 70, 11
	.quad $gmname,  180, 11, 5, 69, 65
endpeople:  # makrs the end of the aray

gkcname:
	.ascii "Gilbert Keith Chester\0"
jbname:
	.ascii "Jonathan Bartlett\0"
cslname:
	.ascii "Clist Silver Lewis\0"
taname:
	.ascii "Tommy Aquinas\0"
inname:
	.ascii "Isaac Newn\0"
gmname:
	.ascii "Gregory Mend\0"

# Describe the components of the struct
.globl NAME_PTR_OFFSET, WEIGHT_OFFSET, SHOE_OFFSET
.globl HAIR_OFFSET    , HEIGHT_OFFSET, AGE_OFFSET
.equ NAME_PTR_OFFSET, 0
.equ WEIGHT_OFFSET,   8
.equ SHOE_OFFSET,	 16
.equ HAIR_OFFSET,    24
.equ HEIGHT_OFFSET,  32
.equ AGE_OFFSET,     40

.globl PERSON_RECORD_SIZE
.equ   PERSON_RECORD_SIZE, 48
