Ца6
Ч
D
AddV2
x"T
y"T
z"T"
Ttype:
2	
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
ж
Conv3D

input"T
filter"T
output"T"
Ttype:
2"
strides	list(int)(0""
paddingstring:
SAMEVALID"0
data_formatstringNDHWC:
NDHWCNCDHW"!
	dilations	list(int)	

R
Einsum
inputs"T*N
output"T"
equationstring"
Nint(0"	
Ttype
*
Erf
x"T
y"T"
Ttype:
2
Ў
GatherV2
params"Tparams
indices"Tindices
axis"Taxis
output"Tparams"

batch_dimsint "
Tparamstype"
Tindicestype:
2	"
Taxistype:
2	
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
Р
	MaxPool3D

input"T
output"T"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID"0
data_formatstringNDHWC:
NDHWCNCDHW"
Ttype:
2

MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( 
?
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:

Prod

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	
f
Range
start"Tidx
limit"Tidx
delta"Tidx
output"Tidx" 
Tidxtype0:
2
	
@
ReadVariableOp
resource
value"dtype"
dtypetype
@
RealDiv
x"T
y"T
z"T"
Ttype:
2	
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
Ѕ
ResourceGather
resource
indices"Tindices
output"dtype"

batch_dimsint "
validate_indicesbool("
dtypetype"
Tindicestype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
С
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring Ј
@
StaticRegexFullMatch	
input

output
"
patternstring
ї
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 "serve*2.10.12v2.10.0-76-gfdfc646704c8ю.
~
Adam/dense_4/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*$
shared_nameAdam/dense_4/bias/v
w
'Adam/dense_4/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_4/bias/v*
_output_shapes
:@*
dtype0

Adam/dense_4/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*&
shared_nameAdam/dense_4/kernel/v

)Adam/dense_4/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_4/kernel/v*
_output_shapes
:	@*
dtype0

Adam/dense_3/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/dense_3/bias/v
x
'Adam/dense_3/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_3/bias/v*
_output_shapes	
:*
dtype0

Adam/dense_3/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*&
shared_nameAdam/dense_3/kernel/v

)Adam/dense_3/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_3/kernel/v*
_output_shapes
:	@*
dtype0
ц
GAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*X
shared_nameIGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/v
п
[Adam/transformer_layer_2/multi_head_attention_1/attention_output/bias/v/Read/ReadVariableOpReadVariableOpGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/v*
_output_shapes
:@*
dtype0
ђ
IAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*Z
shared_nameKIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/v
ы
]Adam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/v/Read/ReadVariableOpReadVariableOpIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/v*"
_output_shapes
:@@*
dtype0
д
<Adam/transformer_layer_2/multi_head_attention_1/value/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*M
shared_name><Adam/transformer_layer_2/multi_head_attention_1/value/bias/v
Э
PAdam/transformer_layer_2/multi_head_attention_1/value/bias/v/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_2/multi_head_attention_1/value/bias/v*
_output_shapes

:@*
dtype0
м
>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*O
shared_name@>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/v
е
RAdam/transformer_layer_2/multi_head_attention_1/value/kernel/v/Read/ReadVariableOpReadVariableOp>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/v*"
_output_shapes
:@@*
dtype0
а
:Adam/transformer_layer_2/multi_head_attention_1/key/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*K
shared_name<:Adam/transformer_layer_2/multi_head_attention_1/key/bias/v
Щ
NAdam/transformer_layer_2/multi_head_attention_1/key/bias/v/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_2/multi_head_attention_1/key/bias/v*
_output_shapes

:@*
dtype0
и
<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*M
shared_name><Adam/transformer_layer_2/multi_head_attention_1/key/kernel/v
б
PAdam/transformer_layer_2/multi_head_attention_1/key/kernel/v/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/v*"
_output_shapes
:@@*
dtype0
д
<Adam/transformer_layer_2/multi_head_attention_1/query/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*M
shared_name><Adam/transformer_layer_2/multi_head_attention_1/query/bias/v
Э
PAdam/transformer_layer_2/multi_head_attention_1/query/bias/v/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_2/multi_head_attention_1/query/bias/v*
_output_shapes

:@*
dtype0
м
>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*O
shared_name@>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/v
е
RAdam/transformer_layer_2/multi_head_attention_1/query/kernel/v/Read/ReadVariableOpReadVariableOp>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/v*"
_output_shapes
:@@*
dtype0
~
Adam/dense_2/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*$
shared_nameAdam/dense_2/bias/v
w
'Adam/dense_2/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_2/bias/v*
_output_shapes
:@*
dtype0

Adam/dense_2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*&
shared_nameAdam/dense_2/kernel/v

)Adam/dense_2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_2/kernel/v*
_output_shapes
:	@*
dtype0

Adam/dense_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/dense_1/bias/v
x
'Adam/dense_1/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_1/bias/v*
_output_shapes	
:*
dtype0

Adam/dense_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*&
shared_nameAdam/dense_1/kernel/v

)Adam/dense_1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_1/kernel/v*
_output_shapes
:	@*
dtype0
т
EAdam/transformer_layer_1/multi_head_attention/attention_output/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*V
shared_nameGEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/v
л
YAdam/transformer_layer_1/multi_head_attention/attention_output/bias/v/Read/ReadVariableOpReadVariableOpEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/v*
_output_shapes
:@*
dtype0
ю
GAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*X
shared_nameIGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/v
ч
[Adam/transformer_layer_1/multi_head_attention/attention_output/kernel/v/Read/ReadVariableOpReadVariableOpGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/v*"
_output_shapes
:@@*
dtype0
а
:Adam/transformer_layer_1/multi_head_attention/value/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*K
shared_name<:Adam/transformer_layer_1/multi_head_attention/value/bias/v
Щ
NAdam/transformer_layer_1/multi_head_attention/value/bias/v/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_1/multi_head_attention/value/bias/v*
_output_shapes

:@*
dtype0
и
<Adam/transformer_layer_1/multi_head_attention/value/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*M
shared_name><Adam/transformer_layer_1/multi_head_attention/value/kernel/v
б
PAdam/transformer_layer_1/multi_head_attention/value/kernel/v/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_1/multi_head_attention/value/kernel/v*"
_output_shapes
:@@*
dtype0
Ь
8Adam/transformer_layer_1/multi_head_attention/key/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*I
shared_name:8Adam/transformer_layer_1/multi_head_attention/key/bias/v
Х
LAdam/transformer_layer_1/multi_head_attention/key/bias/v/Read/ReadVariableOpReadVariableOp8Adam/transformer_layer_1/multi_head_attention/key/bias/v*
_output_shapes

:@*
dtype0
д
:Adam/transformer_layer_1/multi_head_attention/key/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*K
shared_name<:Adam/transformer_layer_1/multi_head_attention/key/kernel/v
Э
NAdam/transformer_layer_1/multi_head_attention/key/kernel/v/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_1/multi_head_attention/key/kernel/v*"
_output_shapes
:@@*
dtype0
а
:Adam/transformer_layer_1/multi_head_attention/query/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*K
shared_name<:Adam/transformer_layer_1/multi_head_attention/query/bias/v
Щ
NAdam/transformer_layer_1/multi_head_attention/query/bias/v/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_1/multi_head_attention/query/bias/v*
_output_shapes

:@*
dtype0
и
<Adam/transformer_layer_1/multi_head_attention/query/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*M
shared_name><Adam/transformer_layer_1/multi_head_attention/query/kernel/v
б
PAdam/transformer_layer_1/multi_head_attention/query/kernel/v/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_1/multi_head_attention/query/kernel/v*"
_output_shapes
:@@*
dtype0
Ф
4Adam/frame_position_embedding/embedding/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*E
shared_name64Adam/frame_position_embedding/embedding/embeddings/v
Н
HAdam/frame_position_embedding/embedding/embeddings/v/Read/ReadVariableOpReadVariableOp4Adam/frame_position_embedding/embedding/embeddings/v*
_output_shapes

:@*
dtype0

Adam/time_distributed_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*/
shared_name Adam/time_distributed_1/bias/v

2Adam/time_distributed_1/bias/v/Read/ReadVariableOpReadVariableOpAdam/time_distributed_1/bias/v*
_output_shapes
:@*
dtype0

 Adam/time_distributed_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*1
shared_name" Adam/time_distributed_1/kernel/v

4Adam/time_distributed_1/kernel/v/Read/ReadVariableOpReadVariableOp Adam/time_distributed_1/kernel/v*
_output_shapes
:	@*
dtype0

Adam/conv3d_5/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameAdam/conv3d_5/bias/v
z
(Adam/conv3d_5/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv3d_5/bias/v*
_output_shapes	
:*
dtype0

Adam/conv3d_5/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*!
shape:*'
shared_nameAdam/conv3d_5/kernel/v

*Adam/conv3d_5/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv3d_5/kernel/v*,
_output_shapes
:*
dtype0

Adam/conv3d_4/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameAdam/conv3d_4/bias/v
z
(Adam/conv3d_4/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv3d_4/bias/v*
_output_shapes	
:*
dtype0

Adam/conv3d_4/kernel/vVarHandleOp*
_output_shapes
: *
dtype0* 
shape:@*'
shared_nameAdam/conv3d_4/kernel/v

*Adam/conv3d_4/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv3d_4/kernel/v*+
_output_shapes
:@*
dtype0

Adam/conv3d_3/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*%
shared_nameAdam/conv3d_3/bias/v
y
(Adam/conv3d_3/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv3d_3/bias/v*
_output_shapes
:@*
dtype0

Adam/conv3d_3/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*'
shared_nameAdam/conv3d_3/kernel/v

*Adam/conv3d_3/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv3d_3/kernel/v**
_output_shapes
:@@*
dtype0

Adam/conv3d_2/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*%
shared_nameAdam/conv3d_2/bias/v
y
(Adam/conv3d_2/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv3d_2/bias/v*
_output_shapes
:@*
dtype0

Adam/conv3d_2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*'
shared_nameAdam/conv3d_2/kernel/v

*Adam/conv3d_2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv3d_2/kernel/v**
_output_shapes
: @*
dtype0

Adam/conv3d_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv3d_1/bias/v
y
(Adam/conv3d_1/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv3d_1/bias/v*
_output_shapes
: *
dtype0

Adam/conv3d_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *'
shared_nameAdam/conv3d_1/kernel/v

*Adam/conv3d_1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv3d_1/kernel/v**
_output_shapes
:  *
dtype0
|
Adam/conv3d/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/conv3d/bias/v
u
&Adam/conv3d/bias/v/Read/ReadVariableOpReadVariableOpAdam/conv3d/bias/v*
_output_shapes
: *
dtype0

Adam/conv3d/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv3d/kernel/v

(Adam/conv3d/kernel/v/Read/ReadVariableOpReadVariableOpAdam/conv3d/kernel/v**
_output_shapes
: *
dtype0
И
0Adam/encoder3d/spatial_attention/conv3d_6/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*A
shared_name20Adam/encoder3d/spatial_attention/conv3d_6/bias/v
Б
DAdam/encoder3d/spatial_attention/conv3d_6/bias/v/Read/ReadVariableOpReadVariableOp0Adam/encoder3d/spatial_attention/conv3d_6/bias/v*
_output_shapes
:*
dtype0
Ь
2Adam/encoder3d/spatial_attention/conv3d_6/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*C
shared_name42Adam/encoder3d/spatial_attention/conv3d_6/kernel/v
Х
FAdam/encoder3d/spatial_attention/conv3d_6/kernel/v/Read/ReadVariableOpReadVariableOp2Adam/encoder3d/spatial_attention/conv3d_6/kernel/v**
_output_shapes
:*
dtype0
~
Adam/dense_6/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/dense_6/bias/v
w
'Adam/dense_6/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_6/bias/v*
_output_shapes
:*
dtype0

Adam/dense_6/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*&
shared_nameAdam/dense_6/kernel/v

)Adam/dense_6/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_6/kernel/v*
_output_shapes
:	*
dtype0

Adam/dense_5/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/dense_5/bias/v
x
'Adam/dense_5/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_5/bias/v*
_output_shapes	
:*
dtype0

Adam/dense_5/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*&
shared_nameAdam/dense_5/kernel/v

)Adam/dense_5/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_5/kernel/v* 
_output_shapes
:
*
dtype0
~
Adam/dense_4/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*$
shared_nameAdam/dense_4/bias/m
w
'Adam/dense_4/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_4/bias/m*
_output_shapes
:@*
dtype0

Adam/dense_4/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*&
shared_nameAdam/dense_4/kernel/m

)Adam/dense_4/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_4/kernel/m*
_output_shapes
:	@*
dtype0

Adam/dense_3/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/dense_3/bias/m
x
'Adam/dense_3/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_3/bias/m*
_output_shapes	
:*
dtype0

Adam/dense_3/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*&
shared_nameAdam/dense_3/kernel/m

)Adam/dense_3/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_3/kernel/m*
_output_shapes
:	@*
dtype0
ц
GAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*X
shared_nameIGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/m
п
[Adam/transformer_layer_2/multi_head_attention_1/attention_output/bias/m/Read/ReadVariableOpReadVariableOpGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/m*
_output_shapes
:@*
dtype0
ђ
IAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*Z
shared_nameKIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/m
ы
]Adam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/m/Read/ReadVariableOpReadVariableOpIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/m*"
_output_shapes
:@@*
dtype0
д
<Adam/transformer_layer_2/multi_head_attention_1/value/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*M
shared_name><Adam/transformer_layer_2/multi_head_attention_1/value/bias/m
Э
PAdam/transformer_layer_2/multi_head_attention_1/value/bias/m/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_2/multi_head_attention_1/value/bias/m*
_output_shapes

:@*
dtype0
м
>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*O
shared_name@>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/m
е
RAdam/transformer_layer_2/multi_head_attention_1/value/kernel/m/Read/ReadVariableOpReadVariableOp>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/m*"
_output_shapes
:@@*
dtype0
а
:Adam/transformer_layer_2/multi_head_attention_1/key/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*K
shared_name<:Adam/transformer_layer_2/multi_head_attention_1/key/bias/m
Щ
NAdam/transformer_layer_2/multi_head_attention_1/key/bias/m/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_2/multi_head_attention_1/key/bias/m*
_output_shapes

:@*
dtype0
и
<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*M
shared_name><Adam/transformer_layer_2/multi_head_attention_1/key/kernel/m
б
PAdam/transformer_layer_2/multi_head_attention_1/key/kernel/m/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/m*"
_output_shapes
:@@*
dtype0
д
<Adam/transformer_layer_2/multi_head_attention_1/query/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*M
shared_name><Adam/transformer_layer_2/multi_head_attention_1/query/bias/m
Э
PAdam/transformer_layer_2/multi_head_attention_1/query/bias/m/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_2/multi_head_attention_1/query/bias/m*
_output_shapes

:@*
dtype0
м
>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*O
shared_name@>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/m
е
RAdam/transformer_layer_2/multi_head_attention_1/query/kernel/m/Read/ReadVariableOpReadVariableOp>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/m*"
_output_shapes
:@@*
dtype0
~
Adam/dense_2/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*$
shared_nameAdam/dense_2/bias/m
w
'Adam/dense_2/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_2/bias/m*
_output_shapes
:@*
dtype0

Adam/dense_2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*&
shared_nameAdam/dense_2/kernel/m

)Adam/dense_2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_2/kernel/m*
_output_shapes
:	@*
dtype0

Adam/dense_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/dense_1/bias/m
x
'Adam/dense_1/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_1/bias/m*
_output_shapes	
:*
dtype0

Adam/dense_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*&
shared_nameAdam/dense_1/kernel/m

)Adam/dense_1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_1/kernel/m*
_output_shapes
:	@*
dtype0
т
EAdam/transformer_layer_1/multi_head_attention/attention_output/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*V
shared_nameGEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/m
л
YAdam/transformer_layer_1/multi_head_attention/attention_output/bias/m/Read/ReadVariableOpReadVariableOpEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/m*
_output_shapes
:@*
dtype0
ю
GAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*X
shared_nameIGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/m
ч
[Adam/transformer_layer_1/multi_head_attention/attention_output/kernel/m/Read/ReadVariableOpReadVariableOpGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/m*"
_output_shapes
:@@*
dtype0
а
:Adam/transformer_layer_1/multi_head_attention/value/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*K
shared_name<:Adam/transformer_layer_1/multi_head_attention/value/bias/m
Щ
NAdam/transformer_layer_1/multi_head_attention/value/bias/m/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_1/multi_head_attention/value/bias/m*
_output_shapes

:@*
dtype0
и
<Adam/transformer_layer_1/multi_head_attention/value/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*M
shared_name><Adam/transformer_layer_1/multi_head_attention/value/kernel/m
б
PAdam/transformer_layer_1/multi_head_attention/value/kernel/m/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_1/multi_head_attention/value/kernel/m*"
_output_shapes
:@@*
dtype0
Ь
8Adam/transformer_layer_1/multi_head_attention/key/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*I
shared_name:8Adam/transformer_layer_1/multi_head_attention/key/bias/m
Х
LAdam/transformer_layer_1/multi_head_attention/key/bias/m/Read/ReadVariableOpReadVariableOp8Adam/transformer_layer_1/multi_head_attention/key/bias/m*
_output_shapes

:@*
dtype0
д
:Adam/transformer_layer_1/multi_head_attention/key/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*K
shared_name<:Adam/transformer_layer_1/multi_head_attention/key/kernel/m
Э
NAdam/transformer_layer_1/multi_head_attention/key/kernel/m/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_1/multi_head_attention/key/kernel/m*"
_output_shapes
:@@*
dtype0
а
:Adam/transformer_layer_1/multi_head_attention/query/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*K
shared_name<:Adam/transformer_layer_1/multi_head_attention/query/bias/m
Щ
NAdam/transformer_layer_1/multi_head_attention/query/bias/m/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_1/multi_head_attention/query/bias/m*
_output_shapes

:@*
dtype0
и
<Adam/transformer_layer_1/multi_head_attention/query/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*M
shared_name><Adam/transformer_layer_1/multi_head_attention/query/kernel/m
б
PAdam/transformer_layer_1/multi_head_attention/query/kernel/m/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_1/multi_head_attention/query/kernel/m*"
_output_shapes
:@@*
dtype0
Ф
4Adam/frame_position_embedding/embedding/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*E
shared_name64Adam/frame_position_embedding/embedding/embeddings/m
Н
HAdam/frame_position_embedding/embedding/embeddings/m/Read/ReadVariableOpReadVariableOp4Adam/frame_position_embedding/embedding/embeddings/m*
_output_shapes

:@*
dtype0

Adam/time_distributed_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*/
shared_name Adam/time_distributed_1/bias/m

2Adam/time_distributed_1/bias/m/Read/ReadVariableOpReadVariableOpAdam/time_distributed_1/bias/m*
_output_shapes
:@*
dtype0

 Adam/time_distributed_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*1
shared_name" Adam/time_distributed_1/kernel/m

4Adam/time_distributed_1/kernel/m/Read/ReadVariableOpReadVariableOp Adam/time_distributed_1/kernel/m*
_output_shapes
:	@*
dtype0

Adam/conv3d_5/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameAdam/conv3d_5/bias/m
z
(Adam/conv3d_5/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv3d_5/bias/m*
_output_shapes	
:*
dtype0

Adam/conv3d_5/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*!
shape:*'
shared_nameAdam/conv3d_5/kernel/m

*Adam/conv3d_5/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv3d_5/kernel/m*,
_output_shapes
:*
dtype0

Adam/conv3d_4/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*%
shared_nameAdam/conv3d_4/bias/m
z
(Adam/conv3d_4/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv3d_4/bias/m*
_output_shapes	
:*
dtype0

Adam/conv3d_4/kernel/mVarHandleOp*
_output_shapes
: *
dtype0* 
shape:@*'
shared_nameAdam/conv3d_4/kernel/m

*Adam/conv3d_4/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv3d_4/kernel/m*+
_output_shapes
:@*
dtype0

Adam/conv3d_3/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*%
shared_nameAdam/conv3d_3/bias/m
y
(Adam/conv3d_3/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv3d_3/bias/m*
_output_shapes
:@*
dtype0

Adam/conv3d_3/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*'
shared_nameAdam/conv3d_3/kernel/m

*Adam/conv3d_3/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv3d_3/kernel/m**
_output_shapes
:@@*
dtype0

Adam/conv3d_2/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*%
shared_nameAdam/conv3d_2/bias/m
y
(Adam/conv3d_2/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv3d_2/bias/m*
_output_shapes
:@*
dtype0

Adam/conv3d_2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*'
shared_nameAdam/conv3d_2/kernel/m

*Adam/conv3d_2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv3d_2/kernel/m**
_output_shapes
: @*
dtype0

Adam/conv3d_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv3d_1/bias/m
y
(Adam/conv3d_1/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv3d_1/bias/m*
_output_shapes
: *
dtype0

Adam/conv3d_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *'
shared_nameAdam/conv3d_1/kernel/m

*Adam/conv3d_1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv3d_1/kernel/m**
_output_shapes
:  *
dtype0
|
Adam/conv3d/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/conv3d/bias/m
u
&Adam/conv3d/bias/m/Read/ReadVariableOpReadVariableOpAdam/conv3d/bias/m*
_output_shapes
: *
dtype0

Adam/conv3d/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/conv3d/kernel/m

(Adam/conv3d/kernel/m/Read/ReadVariableOpReadVariableOpAdam/conv3d/kernel/m**
_output_shapes
: *
dtype0
И
0Adam/encoder3d/spatial_attention/conv3d_6/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*A
shared_name20Adam/encoder3d/spatial_attention/conv3d_6/bias/m
Б
DAdam/encoder3d/spatial_attention/conv3d_6/bias/m/Read/ReadVariableOpReadVariableOp0Adam/encoder3d/spatial_attention/conv3d_6/bias/m*
_output_shapes
:*
dtype0
Ь
2Adam/encoder3d/spatial_attention/conv3d_6/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*C
shared_name42Adam/encoder3d/spatial_attention/conv3d_6/kernel/m
Х
FAdam/encoder3d/spatial_attention/conv3d_6/kernel/m/Read/ReadVariableOpReadVariableOp2Adam/encoder3d/spatial_attention/conv3d_6/kernel/m**
_output_shapes
:*
dtype0
~
Adam/dense_6/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/dense_6/bias/m
w
'Adam/dense_6/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_6/bias/m*
_output_shapes
:*
dtype0

Adam/dense_6/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*&
shared_nameAdam/dense_6/kernel/m

)Adam/dense_6/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_6/kernel/m*
_output_shapes
:	*
dtype0

Adam/dense_5/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/dense_5/bias/m
x
'Adam/dense_5/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_5/bias/m*
_output_shapes	
:*
dtype0

Adam/dense_5/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*&
shared_nameAdam/dense_5/kernel/m

)Adam/dense_5/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_5/kernel/m* 
_output_shapes
:
*
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
p
dense_4/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_namedense_4/bias
i
 dense_4/bias/Read/ReadVariableOpReadVariableOpdense_4/bias*
_output_shapes
:@*
dtype0
y
dense_4/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*
shared_namedense_4/kernel
r
"dense_4/kernel/Read/ReadVariableOpReadVariableOpdense_4/kernel*
_output_shapes
:	@*
dtype0
q
dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_3/bias
j
 dense_3/bias/Read/ReadVariableOpReadVariableOpdense_3/bias*
_output_shapes	
:*
dtype0
y
dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*
shared_namedense_3/kernel
r
"dense_3/kernel/Read/ReadVariableOpReadVariableOpdense_3/kernel*
_output_shapes
:	@*
dtype0
и
@transformer_layer_2/multi_head_attention_1/attention_output/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*Q
shared_nameB@transformer_layer_2/multi_head_attention_1/attention_output/bias
б
Ttransformer_layer_2/multi_head_attention_1/attention_output/bias/Read/ReadVariableOpReadVariableOp@transformer_layer_2/multi_head_attention_1/attention_output/bias*
_output_shapes
:@*
dtype0
ф
Btransformer_layer_2/multi_head_attention_1/attention_output/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*S
shared_nameDBtransformer_layer_2/multi_head_attention_1/attention_output/kernel
н
Vtransformer_layer_2/multi_head_attention_1/attention_output/kernel/Read/ReadVariableOpReadVariableOpBtransformer_layer_2/multi_head_attention_1/attention_output/kernel*"
_output_shapes
:@@*
dtype0
Ц
5transformer_layer_2/multi_head_attention_1/value/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*F
shared_name75transformer_layer_2/multi_head_attention_1/value/bias
П
Itransformer_layer_2/multi_head_attention_1/value/bias/Read/ReadVariableOpReadVariableOp5transformer_layer_2/multi_head_attention_1/value/bias*
_output_shapes

:@*
dtype0
Ю
7transformer_layer_2/multi_head_attention_1/value/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*H
shared_name97transformer_layer_2/multi_head_attention_1/value/kernel
Ч
Ktransformer_layer_2/multi_head_attention_1/value/kernel/Read/ReadVariableOpReadVariableOp7transformer_layer_2/multi_head_attention_1/value/kernel*"
_output_shapes
:@@*
dtype0
Т
3transformer_layer_2/multi_head_attention_1/key/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*D
shared_name53transformer_layer_2/multi_head_attention_1/key/bias
Л
Gtransformer_layer_2/multi_head_attention_1/key/bias/Read/ReadVariableOpReadVariableOp3transformer_layer_2/multi_head_attention_1/key/bias*
_output_shapes

:@*
dtype0
Ъ
5transformer_layer_2/multi_head_attention_1/key/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*F
shared_name75transformer_layer_2/multi_head_attention_1/key/kernel
У
Itransformer_layer_2/multi_head_attention_1/key/kernel/Read/ReadVariableOpReadVariableOp5transformer_layer_2/multi_head_attention_1/key/kernel*"
_output_shapes
:@@*
dtype0
Ц
5transformer_layer_2/multi_head_attention_1/query/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*F
shared_name75transformer_layer_2/multi_head_attention_1/query/bias
П
Itransformer_layer_2/multi_head_attention_1/query/bias/Read/ReadVariableOpReadVariableOp5transformer_layer_2/multi_head_attention_1/query/bias*
_output_shapes

:@*
dtype0
Ю
7transformer_layer_2/multi_head_attention_1/query/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*H
shared_name97transformer_layer_2/multi_head_attention_1/query/kernel
Ч
Ktransformer_layer_2/multi_head_attention_1/query/kernel/Read/ReadVariableOpReadVariableOp7transformer_layer_2/multi_head_attention_1/query/kernel*"
_output_shapes
:@@*
dtype0
p
dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_namedense_2/bias
i
 dense_2/bias/Read/ReadVariableOpReadVariableOpdense_2/bias*
_output_shapes
:@*
dtype0
y
dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*
shared_namedense_2/kernel
r
"dense_2/kernel/Read/ReadVariableOpReadVariableOpdense_2/kernel*
_output_shapes
:	@*
dtype0
q
dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_1/bias
j
 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_output_shapes	
:*
dtype0
y
dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@*
shared_namedense_1/kernel
r
"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel*
_output_shapes
:	@*
dtype0
д
>transformer_layer_1/multi_head_attention/attention_output/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*O
shared_name@>transformer_layer_1/multi_head_attention/attention_output/bias
Э
Rtransformer_layer_1/multi_head_attention/attention_output/bias/Read/ReadVariableOpReadVariableOp>transformer_layer_1/multi_head_attention/attention_output/bias*
_output_shapes
:@*
dtype0
р
@transformer_layer_1/multi_head_attention/attention_output/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*Q
shared_nameB@transformer_layer_1/multi_head_attention/attention_output/kernel
й
Ttransformer_layer_1/multi_head_attention/attention_output/kernel/Read/ReadVariableOpReadVariableOp@transformer_layer_1/multi_head_attention/attention_output/kernel*"
_output_shapes
:@@*
dtype0
Т
3transformer_layer_1/multi_head_attention/value/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*D
shared_name53transformer_layer_1/multi_head_attention/value/bias
Л
Gtransformer_layer_1/multi_head_attention/value/bias/Read/ReadVariableOpReadVariableOp3transformer_layer_1/multi_head_attention/value/bias*
_output_shapes

:@*
dtype0
Ъ
5transformer_layer_1/multi_head_attention/value/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*F
shared_name75transformer_layer_1/multi_head_attention/value/kernel
У
Itransformer_layer_1/multi_head_attention/value/kernel/Read/ReadVariableOpReadVariableOp5transformer_layer_1/multi_head_attention/value/kernel*"
_output_shapes
:@@*
dtype0
О
1transformer_layer_1/multi_head_attention/key/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*B
shared_name31transformer_layer_1/multi_head_attention/key/bias
З
Etransformer_layer_1/multi_head_attention/key/bias/Read/ReadVariableOpReadVariableOp1transformer_layer_1/multi_head_attention/key/bias*
_output_shapes

:@*
dtype0
Ц
3transformer_layer_1/multi_head_attention/key/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*D
shared_name53transformer_layer_1/multi_head_attention/key/kernel
П
Gtransformer_layer_1/multi_head_attention/key/kernel/Read/ReadVariableOpReadVariableOp3transformer_layer_1/multi_head_attention/key/kernel*"
_output_shapes
:@@*
dtype0
Т
3transformer_layer_1/multi_head_attention/query/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*D
shared_name53transformer_layer_1/multi_head_attention/query/bias
Л
Gtransformer_layer_1/multi_head_attention/query/bias/Read/ReadVariableOpReadVariableOp3transformer_layer_1/multi_head_attention/query/bias*
_output_shapes

:@*
dtype0
Ъ
5transformer_layer_1/multi_head_attention/query/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*F
shared_name75transformer_layer_1/multi_head_attention/query/kernel
У
Itransformer_layer_1/multi_head_attention/query/kernel/Read/ReadVariableOpReadVariableOp5transformer_layer_1/multi_head_attention/query/kernel*"
_output_shapes
:@@*
dtype0
Ж
-frame_position_embedding/embedding/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*>
shared_name/-frame_position_embedding/embedding/embeddings
Џ
Aframe_position_embedding/embedding/embeddings/Read/ReadVariableOpReadVariableOp-frame_position_embedding/embedding/embeddings*
_output_shapes

:@*
dtype0

time_distributed_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*(
shared_nametime_distributed_1/bias

+time_distributed_1/bias/Read/ReadVariableOpReadVariableOptime_distributed_1/bias*
_output_shapes
:@*
dtype0

time_distributed_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@**
shared_nametime_distributed_1/kernel

-time_distributed_1/kernel/Read/ReadVariableOpReadVariableOptime_distributed_1/kernel*
_output_shapes
:	@*
dtype0
s
conv3d_5/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_nameconv3d_5/bias
l
!conv3d_5/bias/Read/ReadVariableOpReadVariableOpconv3d_5/bias*
_output_shapes	
:*
dtype0

conv3d_5/kernelVarHandleOp*
_output_shapes
: *
dtype0*!
shape:* 
shared_nameconv3d_5/kernel

#conv3d_5/kernel/Read/ReadVariableOpReadVariableOpconv3d_5/kernel*,
_output_shapes
:*
dtype0
s
conv3d_4/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_nameconv3d_4/bias
l
!conv3d_4/bias/Read/ReadVariableOpReadVariableOpconv3d_4/bias*
_output_shapes	
:*
dtype0

conv3d_4/kernelVarHandleOp*
_output_shapes
: *
dtype0* 
shape:@* 
shared_nameconv3d_4/kernel

#conv3d_4/kernel/Read/ReadVariableOpReadVariableOpconv3d_4/kernel*+
_output_shapes
:@*
dtype0
r
conv3d_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_nameconv3d_3/bias
k
!conv3d_3/bias/Read/ReadVariableOpReadVariableOpconv3d_3/bias*
_output_shapes
:@*
dtype0

conv3d_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@* 
shared_nameconv3d_3/kernel

#conv3d_3/kernel/Read/ReadVariableOpReadVariableOpconv3d_3/kernel**
_output_shapes
:@@*
dtype0
r
conv3d_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_nameconv3d_2/bias
k
!conv3d_2/bias/Read/ReadVariableOpReadVariableOpconv3d_2/bias*
_output_shapes
:@*
dtype0

conv3d_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @* 
shared_nameconv3d_2/kernel

#conv3d_2/kernel/Read/ReadVariableOpReadVariableOpconv3d_2/kernel**
_output_shapes
: @*
dtype0
r
conv3d_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameconv3d_1/bias
k
!conv3d_1/bias/Read/ReadVariableOpReadVariableOpconv3d_1/bias*
_output_shapes
: *
dtype0

conv3d_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  * 
shared_nameconv3d_1/kernel

#conv3d_1/kernel/Read/ReadVariableOpReadVariableOpconv3d_1/kernel**
_output_shapes
:  *
dtype0
n
conv3d/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameconv3d/bias
g
conv3d/bias/Read/ReadVariableOpReadVariableOpconv3d/bias*
_output_shapes
: *
dtype0

conv3d/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameconv3d/kernel
{
!conv3d/kernel/Read/ReadVariableOpReadVariableOpconv3d/kernel**
_output_shapes
: *
dtype0
Њ
)encoder3d/spatial_attention/conv3d_6/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*:
shared_name+)encoder3d/spatial_attention/conv3d_6/bias
Ѓ
=encoder3d/spatial_attention/conv3d_6/bias/Read/ReadVariableOpReadVariableOp)encoder3d/spatial_attention/conv3d_6/bias*
_output_shapes
:*
dtype0
О
+encoder3d/spatial_attention/conv3d_6/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*<
shared_name-+encoder3d/spatial_attention/conv3d_6/kernel
З
?encoder3d/spatial_attention/conv3d_6/kernel/Read/ReadVariableOpReadVariableOp+encoder3d/spatial_attention/conv3d_6/kernel**
_output_shapes
:*
dtype0
p
dense_6/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_6/bias
i
 dense_6/bias/Read/ReadVariableOpReadVariableOpdense_6/bias*
_output_shapes
:*
dtype0
y
dense_6/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*
shared_namedense_6/kernel
r
"dense_6/kernel/Read/ReadVariableOpReadVariableOpdense_6/kernel*
_output_shapes
:	*
dtype0
q
dense_5/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_5/bias
j
 dense_5/bias/Read/ReadVariableOpReadVariableOpdense_5/bias*
_output_shapes	
:*
dtype0
z
dense_5/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*
shared_namedense_5/kernel
s
"dense_5/kernel/Read/ReadVariableOpReadVariableOpdense_5/kernel* 
_output_shapes
:
*
dtype0

serving_default_input_1Placeholder*3
_output_shapes!
:џџџџџџџџџ  *
dtype0*(
shape:џџџџџџџџџ  
Э
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1+encoder3d/spatial_attention/conv3d_6/kernel)encoder3d/spatial_attention/conv3d_6/biasconv3d/kernelconv3d/biasconv3d_1/kernelconv3d_1/biasconv3d_2/kernelconv3d_2/biasconv3d_3/kernelconv3d_3/biasconv3d_4/kernelconv3d_4/biasconv3d_5/kernelconv3d_5/biastime_distributed_1/kerneltime_distributed_1/bias-frame_position_embedding/embedding/embeddings5transformer_layer_1/multi_head_attention/query/kernel3transformer_layer_1/multi_head_attention/query/bias3transformer_layer_1/multi_head_attention/key/kernel1transformer_layer_1/multi_head_attention/key/bias5transformer_layer_1/multi_head_attention/value/kernel3transformer_layer_1/multi_head_attention/value/bias@transformer_layer_1/multi_head_attention/attention_output/kernel>transformer_layer_1/multi_head_attention/attention_output/biasdense_1/kerneldense_1/biasdense_2/kerneldense_2/bias7transformer_layer_2/multi_head_attention_1/query/kernel5transformer_layer_2/multi_head_attention_1/query/bias5transformer_layer_2/multi_head_attention_1/key/kernel3transformer_layer_2/multi_head_attention_1/key/bias7transformer_layer_2/multi_head_attention_1/value/kernel5transformer_layer_2/multi_head_attention_1/value/biasBtransformer_layer_2/multi_head_attention_1/attention_output/kernel@transformer_layer_2/multi_head_attention_1/attention_output/biasdense_3/kerneldense_3/biasdense_4/kerneldense_4/biasdense_5/kerneldense_5/biasdense_6/kerneldense_6/bias*9
Tin2
02.*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*O
_read_only_resource_inputs1
/-	
 !"#$%&'()*+,-*0
config_proto 

CPU

GPU2*0J 8 *,
f'R%
#__inference_signature_wrapper_12641

NoOpNoOp
м
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB Bџ
Љ
layer-0
layer_with_weights-0
layer-1
layer-2
layer_with_weights-1
layer-3
layer_with_weights-2
layer-4
layer_with_weights-3
layer-5
layer_with_weights-4
layer-6
layer-7
	layer_with_weights-5
	layer-8

layer_with_weights-6

layer-9
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures
#_self_saveable_object_factories*
'
#_self_saveable_object_factories* 
Ё
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
spatial_attention

conv3d
conv3d2
conv3d3
 	pooling3d
!
pooling3d2
"
pooling3d3
##_self_saveable_object_factories*
О
$	variables
%trainable_variables
&regularization_losses
'	keras_api
(__call__
*)&call_and_return_all_conditional_losses
	*layer
#+_self_saveable_object_factories* 
Р
,	variables
-trainable_variables
.regularization_losses
/	keras_api
0__call__
*1&call_and_return_all_conditional_losses
	2layer
#3_self_saveable_object_factories*
Ю
4	variables
5trainable_variables
6regularization_losses
7	keras_api
8__call__
*9&call_and_return_all_conditional_losses
:position_embeddings
#;_self_saveable_object_factories*
д
<	variables
=trainable_variables
>regularization_losses
?	keras_api
@__call__
*A&call_and_return_all_conditional_losses
B	attention
C
dense_proj
#D_self_saveable_object_factories*
д
E	variables
Ftrainable_variables
Gregularization_losses
H	keras_api
I__call__
*J&call_and_return_all_conditional_losses
K	attention
L
dense_proj
#M_self_saveable_object_factories*
Г
N	variables
Otrainable_variables
Pregularization_losses
Q	keras_api
R__call__
*S&call_and_return_all_conditional_losses
#T_self_saveable_object_factories* 
Ы
U	variables
Vtrainable_variables
Wregularization_losses
X	keras_api
Y__call__
*Z&call_and_return_all_conditional_losses

[kernel
\bias
#]_self_saveable_object_factories*
Ы
^	variables
_trainable_variables
`regularization_losses
a	keras_api
b__call__
*c&call_and_return_all_conditional_losses

dkernel
ebias
#f_self_saveable_object_factories*
ђ
g0
h1
i2
j3
k4
l5
m6
n7
o8
p9
q10
r11
s12
t13
u14
v15
w16
x17
y18
z19
{20
|21
}22
~23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
[41
\42
d43
e44*
 
[0
\1
d2
e3*
* 
Е
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
:
trace_0
trace_1
trace_2
trace_3* 
:
trace_0
trace_1
trace_2
trace_3* 
* 
э
	iter
beta_1
beta_2

 decay
Ёlearning_rate[mв\mгdmдemеgmжhmзimиjmйkmкlmлmmмnmнomоpmпqmрrmсsmтtmуumфvmхwmцxmчymшzmщ{mъ|mы}mь~mэmю	mя	m№	mё	mђ	mѓ	mє	mѕ	mі	mї	mј	mљ	mњ	mћ	mќ	m§	mў[vџ\vdvevgvhvivjvkvlvmvnvovpvqvrvsvtvuvvvwvxvyvzv{v|v}v~vv	v	v	v	v	v 	vЁ	vЂ	vЃ	vЄ	vЅ	vІ	vЇ	vЈ	vЉ	vЊ	vЋ*

Ђserving_default* 
* 
* 
j
g0
h1
i2
j3
k4
l5
m6
n7
o8
p9
q10
r11
s12
t13*
* 
* 

Ѓnon_trainable_variables
Єlayers
Ѕmetrics
 Іlayer_regularization_losses
Їlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

Јtrace_0
Љtrace_1* 

Њtrace_0
Ћtrace_1* 
Ч
Ќ	variables
­trainable_variables
Ўregularization_losses
Џ	keras_api
А__call__
+Б&call_and_return_all_conditional_losses
	Вconv
$Г_self_saveable_object_factories*
Ц
Д	variables
Еtrainable_variables
Жregularization_losses
З	keras_api
И__call__
+Й&call_and_return_all_conditional_losses
Кseq
$Л_self_saveable_object_factories*
Ц
М	variables
Нtrainable_variables
Оregularization_losses
П	keras_api
Р__call__
+С&call_and_return_all_conditional_losses
Тseq
$У_self_saveable_object_factories*
Ц
Ф	variables
Хtrainable_variables
Цregularization_losses
Ч	keras_api
Ш__call__
+Щ&call_and_return_all_conditional_losses
Ъseq
$Ы_self_saveable_object_factories*
К
Ь	variables
Эtrainable_variables
Юregularization_losses
Я	keras_api
а__call__
+б&call_and_return_all_conditional_losses
$в_self_saveable_object_factories* 
К
г	variables
дtrainable_variables
еregularization_losses
ж	keras_api
з__call__
+и&call_and_return_all_conditional_losses
$й_self_saveable_object_factories* 
К
к	variables
лtrainable_variables
мregularization_losses
н	keras_api
о__call__
+п&call_and_return_all_conditional_losses
$р_self_saveable_object_factories* 
* 
* 
* 
* 

сnon_trainable_variables
тlayers
уmetrics
 фlayer_regularization_losses
хlayer_metrics
$	variables
%trainable_variables
&regularization_losses
(__call__
*)&call_and_return_all_conditional_losses
&)"call_and_return_conditional_losses* 

цtrace_0
чtrace_1* 

шtrace_0
щtrace_1* 
К
ъ	variables
ыtrainable_variables
ьregularization_losses
э	keras_api
ю__call__
+я&call_and_return_all_conditional_losses
$№_self_saveable_object_factories* 
* 

u0
v1*
* 
* 

ёnon_trainable_variables
ђlayers
ѓmetrics
 єlayer_regularization_losses
ѕlayer_metrics
,	variables
-trainable_variables
.regularization_losses
0__call__
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses*

іtrace_0
їtrace_1* 

јtrace_0
љtrace_1* 
в
њ	variables
ћtrainable_variables
ќregularization_losses
§	keras_api
ў__call__
+џ&call_and_return_all_conditional_losses

ukernel
vbias
$_self_saveable_object_factories*
* 

w0*
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
4	variables
5trainable_variables
6regularization_losses
8__call__
*9&call_and_return_all_conditional_losses
&9"call_and_return_conditional_losses*

trace_0* 

trace_0* 
Ь
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses
w
embeddings
$_self_saveable_object_factories*
* 
^
x0
y1
z2
{3
|4
}5
~6
7
8
9
10
11*
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
<	variables
=trainable_variables
>regularization_losses
@__call__
*A&call_and_return_all_conditional_losses
&A"call_and_return_conditional_losses*

trace_0
trace_1* 

trace_0
trace_1* 
Ћ
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses
_query_dense

_key_dense
 _value_dense
Ё_softmax
Ђ_dropout_layer
Ѓ_output_dense
$Є_self_saveable_object_factories*

Ѕlayer_with_weights-0
Ѕlayer-0
Іlayer_with_weights-1
Іlayer-1
Ї	variables
Јtrainable_variables
Љregularization_losses
Њ	keras_api
Ћ__call__
+Ќ&call_and_return_all_conditional_losses
$­_self_saveable_object_factories*
* 
f
0
1
2
3
4
5
6
7
8
9
10
11*
* 
* 

Ўnon_trainable_variables
Џlayers
Аmetrics
 Бlayer_regularization_losses
Вlayer_metrics
E	variables
Ftrainable_variables
Gregularization_losses
I__call__
*J&call_and_return_all_conditional_losses
&J"call_and_return_conditional_losses*

Гtrace_0
Дtrace_1* 

Еtrace_0
Жtrace_1* 
Ћ
З	variables
Иtrainable_variables
Йregularization_losses
К	keras_api
Л__call__
+М&call_and_return_all_conditional_losses
Н_query_dense
О
_key_dense
П_value_dense
Р_softmax
С_dropout_layer
Т_output_dense
$У_self_saveable_object_factories*

Фlayer_with_weights-0
Фlayer-0
Хlayer_with_weights-1
Хlayer-1
Ц	variables
Чtrainable_variables
Шregularization_losses
Щ	keras_api
Ъ__call__
+Ы&call_and_return_all_conditional_losses
$Ь_self_saveable_object_factories*
* 
* 
* 
* 

Эnon_trainable_variables
Юlayers
Яmetrics
 аlayer_regularization_losses
бlayer_metrics
N	variables
Otrainable_variables
Pregularization_losses
R__call__
*S&call_and_return_all_conditional_losses
&S"call_and_return_conditional_losses* 

вtrace_0* 

гtrace_0* 
* 

[0
\1*

[0
\1*
* 

дnon_trainable_variables
еlayers
жmetrics
 зlayer_regularization_losses
иlayer_metrics
U	variables
Vtrainable_variables
Wregularization_losses
Y__call__
*Z&call_and_return_all_conditional_losses
&Z"call_and_return_conditional_losses*

йtrace_0* 

кtrace_0* 
^X
VARIABLE_VALUEdense_5/kernel6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_5/bias4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 

d0
e1*

d0
e1*
* 

лnon_trainable_variables
мlayers
нmetrics
 оlayer_regularization_losses
пlayer_metrics
^	variables
_trainable_variables
`regularization_losses
b__call__
*c&call_and_return_all_conditional_losses
&c"call_and_return_conditional_losses*

рtrace_0* 

сtrace_0* 
^X
VARIABLE_VALUEdense_6/kernel6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_6/bias4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
ke
VARIABLE_VALUE+encoder3d/spatial_attention/conv3d_6/kernel&variables/0/.ATTRIBUTES/VARIABLE_VALUE*
ic
VARIABLE_VALUE)encoder3d/spatial_attention/conv3d_6/bias&variables/1/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEconv3d/kernel&variables/2/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUEconv3d/bias&variables/3/.ATTRIBUTES/VARIABLE_VALUE*
OI
VARIABLE_VALUEconv3d_1/kernel&variables/4/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEconv3d_1/bias&variables/5/.ATTRIBUTES/VARIABLE_VALUE*
OI
VARIABLE_VALUEconv3d_2/kernel&variables/6/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEconv3d_2/bias&variables/7/.ATTRIBUTES/VARIABLE_VALUE*
OI
VARIABLE_VALUEconv3d_3/kernel&variables/8/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEconv3d_3/bias&variables/9/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEconv3d_4/kernel'variables/10/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUEconv3d_4/bias'variables/11/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEconv3d_5/kernel'variables/12/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUEconv3d_5/bias'variables/13/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEtime_distributed_1/kernel'variables/14/.ATTRIBUTES/VARIABLE_VALUE*
XR
VARIABLE_VALUEtime_distributed_1/bias'variables/15/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUE-frame_position_embedding/embedding/embeddings'variables/16/.ATTRIBUTES/VARIABLE_VALUE*
vp
VARIABLE_VALUE5transformer_layer_1/multi_head_attention/query/kernel'variables/17/.ATTRIBUTES/VARIABLE_VALUE*
tn
VARIABLE_VALUE3transformer_layer_1/multi_head_attention/query/bias'variables/18/.ATTRIBUTES/VARIABLE_VALUE*
tn
VARIABLE_VALUE3transformer_layer_1/multi_head_attention/key/kernel'variables/19/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUE1transformer_layer_1/multi_head_attention/key/bias'variables/20/.ATTRIBUTES/VARIABLE_VALUE*
vp
VARIABLE_VALUE5transformer_layer_1/multi_head_attention/value/kernel'variables/21/.ATTRIBUTES/VARIABLE_VALUE*
tn
VARIABLE_VALUE3transformer_layer_1/multi_head_attention/value/bias'variables/22/.ATTRIBUTES/VARIABLE_VALUE*
{
VARIABLE_VALUE@transformer_layer_1/multi_head_attention/attention_output/kernel'variables/23/.ATTRIBUTES/VARIABLE_VALUE*
y
VARIABLE_VALUE>transformer_layer_1/multi_head_attention/attention_output/bias'variables/24/.ATTRIBUTES/VARIABLE_VALUE*
OI
VARIABLE_VALUEdense_1/kernel'variables/25/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEdense_1/bias'variables/26/.ATTRIBUTES/VARIABLE_VALUE*
OI
VARIABLE_VALUEdense_2/kernel'variables/27/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEdense_2/bias'variables/28/.ATTRIBUTES/VARIABLE_VALUE*
xr
VARIABLE_VALUE7transformer_layer_2/multi_head_attention_1/query/kernel'variables/29/.ATTRIBUTES/VARIABLE_VALUE*
vp
VARIABLE_VALUE5transformer_layer_2/multi_head_attention_1/query/bias'variables/30/.ATTRIBUTES/VARIABLE_VALUE*
vp
VARIABLE_VALUE5transformer_layer_2/multi_head_attention_1/key/kernel'variables/31/.ATTRIBUTES/VARIABLE_VALUE*
tn
VARIABLE_VALUE3transformer_layer_2/multi_head_attention_1/key/bias'variables/32/.ATTRIBUTES/VARIABLE_VALUE*
xr
VARIABLE_VALUE7transformer_layer_2/multi_head_attention_1/value/kernel'variables/33/.ATTRIBUTES/VARIABLE_VALUE*
vp
VARIABLE_VALUE5transformer_layer_2/multi_head_attention_1/value/bias'variables/34/.ATTRIBUTES/VARIABLE_VALUE*
}
VARIABLE_VALUEBtransformer_layer_2/multi_head_attention_1/attention_output/kernel'variables/35/.ATTRIBUTES/VARIABLE_VALUE*
{
VARIABLE_VALUE@transformer_layer_2/multi_head_attention_1/attention_output/bias'variables/36/.ATTRIBUTES/VARIABLE_VALUE*
OI
VARIABLE_VALUEdense_3/kernel'variables/37/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEdense_3/bias'variables/38/.ATTRIBUTES/VARIABLE_VALUE*
OI
VARIABLE_VALUEdense_4/kernel'variables/39/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEdense_4/bias'variables/40/.ATTRIBUTES/VARIABLE_VALUE*
в
g0
h1
i2
j3
k4
l5
m6
n7
o8
p9
q10
r11
s12
t13
u14
v15
w16
x17
y18
z19
{20
|21
}22
~23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40*
J
0
1
2
3
4
5
6
7
	8

9*

т0
у1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
LF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE*
PJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE*
NH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE*
^X
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
j
g0
h1
i2
j3
k4
l5
m6
n7
o8
p9
q10
r11
s12
t13*
5
0
1
2
3
 4
!5
"6*
* 
* 
* 
* 
* 
* 
* 

g0
h1*
* 
* 

фnon_trainable_variables
хlayers
цmetrics
 чlayer_regularization_losses
шlayer_metrics
Ќ	variables
­trainable_variables
Ўregularization_losses
А__call__
+Б&call_and_return_all_conditional_losses
'Б"call_and_return_conditional_losses*
* 
* 
ѕ
щ	variables
ъtrainable_variables
ыregularization_losses
ь	keras_api
э__call__
+ю&call_and_return_all_conditional_losses

gkernel
hbias
$я_self_saveable_object_factories
!№_jit_compiled_convolution_op*
* 
 
i0
j1
k2
l3*
* 
* 

ёnon_trainable_variables
ђlayers
ѓmetrics
 єlayer_regularization_losses
ѕlayer_metrics
Д	variables
Еtrainable_variables
Жregularization_losses
И__call__
+Й&call_and_return_all_conditional_losses
'Й"call_and_return_conditional_losses*
* 
* 

іlayer_with_weights-0
іlayer-0
їlayer_with_weights-1
їlayer-1
ј	variables
љtrainable_variables
њregularization_losses
ћ	keras_api
ќ__call__
+§&call_and_return_all_conditional_losses
$ў_self_saveable_object_factories*
* 
 
m0
n1
o2
p3*
* 
* 

џnon_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
М	variables
Нtrainable_variables
Оregularization_losses
Р__call__
+С&call_and_return_all_conditional_losses
'С"call_and_return_conditional_losses*
* 
* 

layer_with_weights-0
layer-0
layer_with_weights-1
layer-1
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses
$_self_saveable_object_factories*
* 
 
q0
r1
s2
t3*
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Ф	variables
Хtrainable_variables
Цregularization_losses
Ш__call__
+Щ&call_and_return_all_conditional_losses
'Щ"call_and_return_conditional_losses*
* 
* 

layer_with_weights-0
layer-0
layer_with_weights-1
layer-1
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses
$_self_saveable_object_factories*
* 
* 
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Ь	variables
Эtrainable_variables
Юregularization_losses
а__call__
+б&call_and_return_all_conditional_losses
'б"call_and_return_conditional_losses* 

 trace_0* 

Ёtrace_0* 
* 
* 
* 
* 

Ђnon_trainable_variables
Ѓlayers
Єmetrics
 Ѕlayer_regularization_losses
Іlayer_metrics
г	variables
дtrainable_variables
еregularization_losses
з__call__
+и&call_and_return_all_conditional_losses
'и"call_and_return_conditional_losses* 

Їtrace_0* 

Јtrace_0* 
* 
* 
* 
* 

Љnon_trainable_variables
Њlayers
Ћmetrics
 Ќlayer_regularization_losses
­layer_metrics
к	variables
лtrainable_variables
мregularization_losses
о__call__
+п&call_and_return_all_conditional_losses
'п"call_and_return_conditional_losses* 

Ўtrace_0* 

Џtrace_0* 
* 
* 
	
*0* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

Аnon_trainable_variables
Бlayers
Вmetrics
 Гlayer_regularization_losses
Дlayer_metrics
ъ	variables
ыtrainable_variables
ьregularization_losses
ю__call__
+я&call_and_return_all_conditional_losses
'я"call_and_return_conditional_losses* 

Еtrace_0* 

Жtrace_0* 
* 

u0
v1*

20*
* 
* 
* 
* 
* 
* 
* 

u0
v1*
* 
* 

Зnon_trainable_variables
Иlayers
Йmetrics
 Кlayer_regularization_losses
Лlayer_metrics
њ	variables
ћtrainable_variables
ќregularization_losses
ў__call__
+џ&call_and_return_all_conditional_losses
'џ"call_and_return_conditional_losses*

Мtrace_0* 

Нtrace_0* 
* 

w0*

:0*
* 
* 
* 
* 
* 

w0*
* 
* 

Оnon_trainable_variables
Пlayers
Рmetrics
 Сlayer_regularization_losses
Тlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses*
* 
* 
* 
^
x0
y1
z2
{3
|4
}5
~6
7
8
9
10
11*

B0
C1*
* 
* 
* 
* 
* 
* 
* 
<
x0
y1
z2
{3
|4
}5
~6
7*
* 
* 

Уnon_trainable_variables
Фlayers
Хmetrics
 Цlayer_regularization_losses
Чlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses*
* 
* 

Ш	variables
Щtrainable_variables
Ъregularization_losses
Ы	keras_api
Ь__call__
+Э&call_and_return_all_conditional_losses
Юpartial_output_shape
Яfull_output_shape

xkernel
ybias
$а_self_saveable_object_factories*

б	variables
вtrainable_variables
гregularization_losses
д	keras_api
е__call__
+ж&call_and_return_all_conditional_losses
зpartial_output_shape
иfull_output_shape

zkernel
{bias
$й_self_saveable_object_factories*

к	variables
лtrainable_variables
мregularization_losses
н	keras_api
о__call__
+п&call_and_return_all_conditional_losses
рpartial_output_shape
сfull_output_shape

|kernel
}bias
$т_self_saveable_object_factories*
К
у	variables
фtrainable_variables
хregularization_losses
ц	keras_api
ч__call__
+ш&call_and_return_all_conditional_losses
$щ_self_saveable_object_factories* 
в
ъ	variables
ыtrainable_variables
ьregularization_losses
э	keras_api
ю__call__
+я&call_and_return_all_conditional_losses
№_random_generator
$ё_self_saveable_object_factories* 

ђ	variables
ѓtrainable_variables
єregularization_losses
ѕ	keras_api
і__call__
+ї&call_and_return_all_conditional_losses
јpartial_output_shape
љfull_output_shape

~kernel
bias
$њ_self_saveable_object_factories*
* 
д
ћ	variables
ќtrainable_variables
§regularization_losses
ў	keras_api
џ__call__
+&call_and_return_all_conditional_losses
kernel
	bias
$_self_saveable_object_factories*
д
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses
kernel
	bias
$_self_saveable_object_factories*
$
0
1
2
3*
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Ї	variables
Јtrainable_variables
Љregularization_losses
Ћ__call__
+Ќ&call_and_return_all_conditional_losses
'Ќ"call_and_return_conditional_losses*
:
trace_0
trace_1
trace_2
trace_3* 
:
trace_0
trace_1
trace_2
trace_3* 
* 
f
0
1
2
3
4
5
6
7
8
9
10
11*

K0
L1*
* 
* 
* 
* 
* 
* 
* 
D
0
1
2
3
4
5
6
7*
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
З	variables
Иtrainable_variables
Йregularization_losses
Л__call__
+М&call_and_return_all_conditional_losses
'М"call_and_return_conditional_losses*
* 
* 

	variables
trainable_variables
regularization_losses
	keras_api
__call__
+ &call_and_return_all_conditional_losses
Ёpartial_output_shape
Ђfull_output_shape
kernel
	bias
$Ѓ_self_saveable_object_factories*

Є	variables
Ѕtrainable_variables
Іregularization_losses
Ї	keras_api
Ј__call__
+Љ&call_and_return_all_conditional_losses
Њpartial_output_shape
Ћfull_output_shape
kernel
	bias
$Ќ_self_saveable_object_factories*

­	variables
Ўtrainable_variables
Џregularization_losses
А	keras_api
Б__call__
+В&call_and_return_all_conditional_losses
Гpartial_output_shape
Дfull_output_shape
kernel
	bias
$Е_self_saveable_object_factories*
К
Ж	variables
Зtrainable_variables
Иregularization_losses
Й	keras_api
К__call__
+Л&call_and_return_all_conditional_losses
$М_self_saveable_object_factories* 
в
Н	variables
Оtrainable_variables
Пregularization_losses
Р	keras_api
С__call__
+Т&call_and_return_all_conditional_losses
У_random_generator
$Ф_self_saveable_object_factories* 

Х	variables
Цtrainable_variables
Чregularization_losses
Ш	keras_api
Щ__call__
+Ъ&call_and_return_all_conditional_losses
Ыpartial_output_shape
Ьfull_output_shape
kernel
	bias
$Э_self_saveable_object_factories*
* 
д
Ю	variables
Яtrainable_variables
аregularization_losses
б	keras_api
в__call__
+г&call_and_return_all_conditional_losses
kernel
	bias
$д_self_saveable_object_factories*
д
е	variables
жtrainable_variables
зregularization_losses
и	keras_api
й__call__
+к&call_and_return_all_conditional_losses
kernel
	bias
$л_self_saveable_object_factories*
$
0
1
2
3*
* 
* 

мnon_trainable_variables
нlayers
оmetrics
 пlayer_regularization_losses
рlayer_metrics
Ц	variables
Чtrainable_variables
Шregularization_losses
Ъ__call__
+Ы&call_and_return_all_conditional_losses
'Ы"call_and_return_conditional_losses*
:
сtrace_0
тtrace_1
уtrace_2
фtrace_3* 
:
хtrace_0
цtrace_1
чtrace_2
шtrace_3* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
<
щ	variables
ъ	keras_api

ыtotal

ьcount*
M
э	variables
ю	keras_api

яtotal

№count
ё
_fn_kwargs*

g0
h1*

В0*
* 
* 
* 

g0
h1*
* 
* 

ђnon_trainable_variables
ѓlayers
єmetrics
 ѕlayer_regularization_losses
іlayer_metrics
щ	variables
ъtrainable_variables
ыregularization_losses
э__call__
+ю&call_and_return_all_conditional_losses
'ю"call_and_return_conditional_losses*
* 
* 
* 
* 
 
i0
j1
k2
l3*

К0*
* 
* 
* 
ѕ
ї	variables
јtrainable_variables
љregularization_losses
њ	keras_api
ћ__call__
+ќ&call_and_return_all_conditional_losses

ikernel
jbias
$§_self_saveable_object_factories
!ў_jit_compiled_convolution_op*
ѕ
џ	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses

kkernel
lbias
$_self_saveable_object_factories
!_jit_compiled_convolution_op*
 
i0
j1
k2
l3*
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
ј	variables
љtrainable_variables
њregularization_losses
ќ__call__
+§&call_and_return_all_conditional_losses
'§"call_and_return_conditional_losses*
:
trace_0
trace_1
trace_2
trace_3* 
:
trace_0
trace_1
trace_2
trace_3* 
* 
 
m0
n1
o2
p3*

Т0*
* 
* 
* 
ѕ
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses

mkernel
nbias
$_self_saveable_object_factories
!_jit_compiled_convolution_op*
ѕ
	variables
trainable_variables
regularization_losses
	keras_api
 __call__
+Ё&call_and_return_all_conditional_losses

okernel
pbias
$Ђ_self_saveable_object_factories
!Ѓ_jit_compiled_convolution_op*
 
m0
n1
o2
p3*
* 
* 

Єnon_trainable_variables
Ѕlayers
Іmetrics
 Їlayer_regularization_losses
Јlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses*
:
Љtrace_0
Њtrace_1
Ћtrace_2
Ќtrace_3* 
:
­trace_0
Ўtrace_1
Џtrace_2
Аtrace_3* 
* 
 
q0
r1
s2
t3*

Ъ0*
* 
* 
* 
ѕ
Б	variables
Вtrainable_variables
Гregularization_losses
Д	keras_api
Е__call__
+Ж&call_and_return_all_conditional_losses

qkernel
rbias
$З_self_saveable_object_factories
!И_jit_compiled_convolution_op*
ѕ
Й	variables
Кtrainable_variables
Лregularization_losses
М	keras_api
Н__call__
+О&call_and_return_all_conditional_losses

skernel
tbias
$П_self_saveable_object_factories
!Р_jit_compiled_convolution_op*
 
q0
r1
s2
t3*
* 
* 

Сnon_trainable_variables
Тlayers
Уmetrics
 Фlayer_regularization_losses
Хlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses*
:
Цtrace_0
Чtrace_1
Шtrace_2
Щtrace_3* 
:
Ъtrace_0
Ыtrace_1
Ьtrace_2
Эtrace_3* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

u0
v1*
* 
* 
* 
* 
* 
* 

w0*
* 
* 
* 
* 
<
x0
y1
z2
{3
|4
}5
~6
7*
4
0
1
 2
Ё3
Ђ4
Ѓ5*
* 
* 
* 

x0
y1*
* 
* 

Юnon_trainable_variables
Яlayers
аmetrics
 бlayer_regularization_losses
вlayer_metrics
Ш	variables
Щtrainable_variables
Ъregularization_losses
Ь__call__
+Э&call_and_return_all_conditional_losses
'Э"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

z0
{1*
* 
* 

гnon_trainable_variables
дlayers
еmetrics
 жlayer_regularization_losses
зlayer_metrics
б	variables
вtrainable_variables
гregularization_losses
е__call__
+ж&call_and_return_all_conditional_losses
'ж"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

|0
}1*
* 
* 

иnon_trainable_variables
йlayers
кmetrics
 лlayer_regularization_losses
мlayer_metrics
к	variables
лtrainable_variables
мregularization_losses
о__call__
+п&call_and_return_all_conditional_losses
'п"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
* 
* 
* 

нnon_trainable_variables
оlayers
пmetrics
 рlayer_regularization_losses
сlayer_metrics
у	variables
фtrainable_variables
хregularization_losses
ч__call__
+ш&call_and_return_all_conditional_losses
'ш"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 
* 

тnon_trainable_variables
уlayers
фmetrics
 хlayer_regularization_losses
цlayer_metrics
ъ	variables
ыtrainable_variables
ьregularization_losses
ю__call__
+я&call_and_return_all_conditional_losses
'я"call_and_return_conditional_losses* 
* 
* 
(
$ч_self_saveable_object_factories* 
* 

~0
1*
* 
* 

шnon_trainable_variables
щlayers
ъmetrics
 ыlayer_regularization_losses
ьlayer_metrics
ђ	variables
ѓtrainable_variables
єregularization_losses
і__call__
+ї&call_and_return_all_conditional_losses
'ї"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

0
1*
* 
* 

эnon_trainable_variables
юlayers
яmetrics
 №layer_regularization_losses
ёlayer_metrics
ћ	variables
ќtrainable_variables
§regularization_losses
џ__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses*

ђtrace_0* 

ѓtrace_0* 
* 

0
1*
* 
* 

єnon_trainable_variables
ѕlayers
іmetrics
 їlayer_regularization_losses
јlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses*

љtrace_0* 

њtrace_0* 
* 
$
0
1
2
3*

Ѕ0
І1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
D
0
1
2
3
4
5
6
7*
4
Н0
О1
П2
Р3
С4
Т5*
* 
* 
* 

0
1*
* 
* 

ћnon_trainable_variables
ќlayers
§metrics
 ўlayer_regularization_losses
џlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+ &call_and_return_all_conditional_losses
' "call_and_return_conditional_losses*
* 
* 
* 
* 
* 

0
1*
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Є	variables
Ѕtrainable_variables
Іregularization_losses
Ј__call__
+Љ&call_and_return_all_conditional_losses
'Љ"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

0
1*
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
­	variables
Ўtrainable_variables
Џregularization_losses
Б__call__
+В&call_and_return_all_conditional_losses
'В"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
* 
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Ж	variables
Зtrainable_variables
Иregularization_losses
К__call__
+Л&call_and_return_all_conditional_losses
'Л"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Н	variables
Оtrainable_variables
Пregularization_losses
С__call__
+Т&call_and_return_all_conditional_losses
'Т"call_and_return_conditional_losses* 
* 
* 
(
$_self_saveable_object_factories* 
* 

0
1*
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Х	variables
Цtrainable_variables
Чregularization_losses
Щ__call__
+Ъ&call_and_return_all_conditional_losses
'Ъ"call_and_return_conditional_losses*
* 
* 
* 
* 
* 

0
1*
* 
* 

non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Ю	variables
Яtrainable_variables
аregularization_losses
в__call__
+г&call_and_return_all_conditional_losses
'г"call_and_return_conditional_losses*

trace_0* 

 trace_0* 
* 

0
1*
* 
* 

Ёnon_trainable_variables
Ђlayers
Ѓmetrics
 Єlayer_regularization_losses
Ѕlayer_metrics
е	variables
жtrainable_variables
зregularization_losses
й__call__
+к&call_and_return_all_conditional_losses
'к"call_and_return_conditional_losses*

Іtrace_0* 

Їtrace_0* 
* 
$
0
1
2
3*

Ф0
Х1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

ы0
ь1*

щ	variables*
UO
VARIABLE_VALUEtotal_14keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_14keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

я0
№1*

э	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE*
* 

g0
h1*
* 
* 
* 
* 

i0
j1*
* 
* 

Јnon_trainable_variables
Љlayers
Њmetrics
 Ћlayer_regularization_losses
Ќlayer_metrics
ї	variables
јtrainable_variables
љregularization_losses
ћ__call__
+ќ&call_and_return_all_conditional_losses
'ќ"call_and_return_conditional_losses*

­trace_0* 

Ўtrace_0* 
* 
* 

k0
l1*
* 
* 

Џnon_trainable_variables
Аlayers
Бmetrics
 Вlayer_regularization_losses
Гlayer_metrics
џ	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses*

Дtrace_0* 

Еtrace_0* 
* 
* 
 
i0
j1
k2
l3*

і0
ї1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

m0
n1*
* 
* 

Жnon_trainable_variables
Зlayers
Иmetrics
 Йlayer_regularization_losses
Кlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses*

Лtrace_0* 

Мtrace_0* 
* 
* 

o0
p1*
* 
* 

Нnon_trainable_variables
Оlayers
Пmetrics
 Рlayer_regularization_losses
Сlayer_metrics
	variables
trainable_variables
regularization_losses
 __call__
+Ё&call_and_return_all_conditional_losses
'Ё"call_and_return_conditional_losses*

Тtrace_0* 

Уtrace_0* 
* 
* 
 
m0
n1
o2
p3*

0
1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

q0
r1*
* 
* 

Фnon_trainable_variables
Хlayers
Цmetrics
 Чlayer_regularization_losses
Шlayer_metrics
Б	variables
Вtrainable_variables
Гregularization_losses
Е__call__
+Ж&call_and_return_all_conditional_losses
'Ж"call_and_return_conditional_losses*

Щtrace_0* 

Ъtrace_0* 
* 
* 

s0
t1*
* 
* 

Ыnon_trainable_variables
Ьlayers
Эmetrics
 Юlayer_regularization_losses
Яlayer_metrics
Й	variables
Кtrainable_variables
Лregularization_losses
Н__call__
+О&call_and_return_all_conditional_losses
'О"call_and_return_conditional_losses*

аtrace_0* 

бtrace_0* 
* 
* 
 
q0
r1
s2
t3*

0
1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

x0
y1*
* 
* 
* 
* 

z0
{1*
* 
* 
* 
* 

|0
}1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

~0
1*
* 
* 
* 
* 

0
1*
* 
* 
* 
* 
* 
* 

0
1*
* 
* 
* 
* 
* 
* 

0
1*
* 
* 
* 
* 

0
1*
* 
* 
* 
* 

0
1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

0
1*
* 
* 
* 
* 

0
1*
* 
* 
* 
* 
* 
* 

0
1*
* 
* 
* 
* 
* 
* 

i0
j1*
* 
* 
* 
* 
* 
* 

k0
l1*
* 
* 
* 
* 
* 
* 

m0
n1*
* 
* 
* 
* 
* 
* 

o0
p1*
* 
* 
* 
* 
* 
* 

q0
r1*
* 
* 
* 
* 
* 
* 

s0
t1*
* 
* 
* 
* 
* 
* 
{
VARIABLE_VALUEAdam/dense_5/kernel/mRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdam/dense_5/bias/mPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
{
VARIABLE_VALUEAdam/dense_6/kernel/mRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdam/dense_6/bias/mPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE2Adam/encoder3d/spatial_attention/conv3d_6/kernel/mBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE0Adam/encoder3d/spatial_attention/conv3d_6/bias/mBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/conv3d/kernel/mBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUEAdam/conv3d/bias/mBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/conv3d_1/kernel/mBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/conv3d_1/bias/mBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/conv3d_2/kernel/mBvariables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/conv3d_2/bias/mBvariables/7/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/conv3d_3/kernel/mBvariables/8/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/conv3d_3/bias/mBvariables/9/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
sm
VARIABLE_VALUEAdam/conv3d_4/kernel/mCvariables/10/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
qk
VARIABLE_VALUEAdam/conv3d_4/bias/mCvariables/11/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
sm
VARIABLE_VALUEAdam/conv3d_5/kernel/mCvariables/12/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
qk
VARIABLE_VALUEAdam/conv3d_5/bias/mCvariables/13/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUE Adam/time_distributed_1/kernel/mCvariables/14/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
{u
VARIABLE_VALUEAdam/time_distributed_1/bias/mCvariables/15/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE4Adam/frame_position_embedding/embedding/embeddings/mCvariables/16/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE<Adam/transformer_layer_1/multi_head_attention/query/kernel/mCvariables/17/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE:Adam/transformer_layer_1/multi_head_attention/query/bias/mCvariables/18/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE:Adam/transformer_layer_1/multi_head_attention/key/kernel/mCvariables/19/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE8Adam/transformer_layer_1/multi_head_attention/key/bias/mCvariables/20/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE<Adam/transformer_layer_1/multi_head_attention/value/kernel/mCvariables/21/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE:Adam/transformer_layer_1/multi_head_attention/value/bias/mCvariables/22/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
Ѕ
VARIABLE_VALUEGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/mCvariables/23/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
Ѓ
VARIABLE_VALUEEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/mCvariables/24/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/dense_1/kernel/mCvariables/25/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/dense_1/bias/mCvariables/26/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/dense_2/kernel/mCvariables/27/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/dense_2/bias/mCvariables/28/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/mCvariables/29/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE<Adam/transformer_layer_2/multi_head_attention_1/query/bias/mCvariables/30/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/mCvariables/31/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE:Adam/transformer_layer_2/multi_head_attention_1/key/bias/mCvariables/32/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/mCvariables/33/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE<Adam/transformer_layer_2/multi_head_attention_1/value/bias/mCvariables/34/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
Ї 
VARIABLE_VALUEIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/mCvariables/35/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
Ѕ
VARIABLE_VALUEGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/mCvariables/36/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/dense_3/kernel/mCvariables/37/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/dense_3/bias/mCvariables/38/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/dense_4/kernel/mCvariables/39/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/dense_4/bias/mCvariables/40/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
{
VARIABLE_VALUEAdam/dense_5/kernel/vRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdam/dense_5/bias/vPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
{
VARIABLE_VALUEAdam/dense_6/kernel/vRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdam/dense_6/bias/vPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE2Adam/encoder3d/spatial_attention/conv3d_6/kernel/vBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE0Adam/encoder3d/spatial_attention/conv3d_6/bias/vBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/conv3d/kernel/vBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
nh
VARIABLE_VALUEAdam/conv3d/bias/vBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/conv3d_1/kernel/vBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/conv3d_1/bias/vBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/conv3d_2/kernel/vBvariables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/conv3d_2/bias/vBvariables/7/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/conv3d_3/kernel/vBvariables/8/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/conv3d_3/bias/vBvariables/9/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
sm
VARIABLE_VALUEAdam/conv3d_4/kernel/vCvariables/10/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
qk
VARIABLE_VALUEAdam/conv3d_4/bias/vCvariables/11/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
sm
VARIABLE_VALUEAdam/conv3d_5/kernel/vCvariables/12/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
qk
VARIABLE_VALUEAdam/conv3d_5/bias/vCvariables/13/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUE Adam/time_distributed_1/kernel/vCvariables/14/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
{u
VARIABLE_VALUEAdam/time_distributed_1/bias/vCvariables/15/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE4Adam/frame_position_embedding/embedding/embeddings/vCvariables/16/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE<Adam/transformer_layer_1/multi_head_attention/query/kernel/vCvariables/17/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE:Adam/transformer_layer_1/multi_head_attention/query/bias/vCvariables/18/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE:Adam/transformer_layer_1/multi_head_attention/key/kernel/vCvariables/19/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE8Adam/transformer_layer_1/multi_head_attention/key/bias/vCvariables/20/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE<Adam/transformer_layer_1/multi_head_attention/value/kernel/vCvariables/21/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE:Adam/transformer_layer_1/multi_head_attention/value/bias/vCvariables/22/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
Ѕ
VARIABLE_VALUEGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/vCvariables/23/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
Ѓ
VARIABLE_VALUEEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/vCvariables/24/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/dense_1/kernel/vCvariables/25/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/dense_1/bias/vCvariables/26/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/dense_2/kernel/vCvariables/27/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/dense_2/bias/vCvariables/28/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/vCvariables/29/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE<Adam/transformer_layer_2/multi_head_attention_1/query/bias/vCvariables/30/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/vCvariables/31/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE:Adam/transformer_layer_2/multi_head_attention_1/key/bias/vCvariables/32/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/vCvariables/33/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*

VARIABLE_VALUE<Adam/transformer_layer_2/multi_head_attention_1/value/bias/vCvariables/34/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
Ї 
VARIABLE_VALUEIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/vCvariables/35/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
Ѕ
VARIABLE_VALUEGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/vCvariables/36/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/dense_3/kernel/vCvariables/37/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/dense_3/bias/vCvariables/38/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/dense_4/kernel/vCvariables/39/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/dense_4/bias/vCvariables/40/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
B
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename"dense_5/kernel/Read/ReadVariableOp dense_5/bias/Read/ReadVariableOp"dense_6/kernel/Read/ReadVariableOp dense_6/bias/Read/ReadVariableOp?encoder3d/spatial_attention/conv3d_6/kernel/Read/ReadVariableOp=encoder3d/spatial_attention/conv3d_6/bias/Read/ReadVariableOp!conv3d/kernel/Read/ReadVariableOpconv3d/bias/Read/ReadVariableOp#conv3d_1/kernel/Read/ReadVariableOp!conv3d_1/bias/Read/ReadVariableOp#conv3d_2/kernel/Read/ReadVariableOp!conv3d_2/bias/Read/ReadVariableOp#conv3d_3/kernel/Read/ReadVariableOp!conv3d_3/bias/Read/ReadVariableOp#conv3d_4/kernel/Read/ReadVariableOp!conv3d_4/bias/Read/ReadVariableOp#conv3d_5/kernel/Read/ReadVariableOp!conv3d_5/bias/Read/ReadVariableOp-time_distributed_1/kernel/Read/ReadVariableOp+time_distributed_1/bias/Read/ReadVariableOpAframe_position_embedding/embedding/embeddings/Read/ReadVariableOpItransformer_layer_1/multi_head_attention/query/kernel/Read/ReadVariableOpGtransformer_layer_1/multi_head_attention/query/bias/Read/ReadVariableOpGtransformer_layer_1/multi_head_attention/key/kernel/Read/ReadVariableOpEtransformer_layer_1/multi_head_attention/key/bias/Read/ReadVariableOpItransformer_layer_1/multi_head_attention/value/kernel/Read/ReadVariableOpGtransformer_layer_1/multi_head_attention/value/bias/Read/ReadVariableOpTtransformer_layer_1/multi_head_attention/attention_output/kernel/Read/ReadVariableOpRtransformer_layer_1/multi_head_attention/attention_output/bias/Read/ReadVariableOp"dense_1/kernel/Read/ReadVariableOp dense_1/bias/Read/ReadVariableOp"dense_2/kernel/Read/ReadVariableOp dense_2/bias/Read/ReadVariableOpKtransformer_layer_2/multi_head_attention_1/query/kernel/Read/ReadVariableOpItransformer_layer_2/multi_head_attention_1/query/bias/Read/ReadVariableOpItransformer_layer_2/multi_head_attention_1/key/kernel/Read/ReadVariableOpGtransformer_layer_2/multi_head_attention_1/key/bias/Read/ReadVariableOpKtransformer_layer_2/multi_head_attention_1/value/kernel/Read/ReadVariableOpItransformer_layer_2/multi_head_attention_1/value/bias/Read/ReadVariableOpVtransformer_layer_2/multi_head_attention_1/attention_output/kernel/Read/ReadVariableOpTtransformer_layer_2/multi_head_attention_1/attention_output/bias/Read/ReadVariableOp"dense_3/kernel/Read/ReadVariableOp dense_3/bias/Read/ReadVariableOp"dense_4/kernel/Read/ReadVariableOp dense_4/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp)Adam/dense_5/kernel/m/Read/ReadVariableOp'Adam/dense_5/bias/m/Read/ReadVariableOp)Adam/dense_6/kernel/m/Read/ReadVariableOp'Adam/dense_6/bias/m/Read/ReadVariableOpFAdam/encoder3d/spatial_attention/conv3d_6/kernel/m/Read/ReadVariableOpDAdam/encoder3d/spatial_attention/conv3d_6/bias/m/Read/ReadVariableOp(Adam/conv3d/kernel/m/Read/ReadVariableOp&Adam/conv3d/bias/m/Read/ReadVariableOp*Adam/conv3d_1/kernel/m/Read/ReadVariableOp(Adam/conv3d_1/bias/m/Read/ReadVariableOp*Adam/conv3d_2/kernel/m/Read/ReadVariableOp(Adam/conv3d_2/bias/m/Read/ReadVariableOp*Adam/conv3d_3/kernel/m/Read/ReadVariableOp(Adam/conv3d_3/bias/m/Read/ReadVariableOp*Adam/conv3d_4/kernel/m/Read/ReadVariableOp(Adam/conv3d_4/bias/m/Read/ReadVariableOp*Adam/conv3d_5/kernel/m/Read/ReadVariableOp(Adam/conv3d_5/bias/m/Read/ReadVariableOp4Adam/time_distributed_1/kernel/m/Read/ReadVariableOp2Adam/time_distributed_1/bias/m/Read/ReadVariableOpHAdam/frame_position_embedding/embedding/embeddings/m/Read/ReadVariableOpPAdam/transformer_layer_1/multi_head_attention/query/kernel/m/Read/ReadVariableOpNAdam/transformer_layer_1/multi_head_attention/query/bias/m/Read/ReadVariableOpNAdam/transformer_layer_1/multi_head_attention/key/kernel/m/Read/ReadVariableOpLAdam/transformer_layer_1/multi_head_attention/key/bias/m/Read/ReadVariableOpPAdam/transformer_layer_1/multi_head_attention/value/kernel/m/Read/ReadVariableOpNAdam/transformer_layer_1/multi_head_attention/value/bias/m/Read/ReadVariableOp[Adam/transformer_layer_1/multi_head_attention/attention_output/kernel/m/Read/ReadVariableOpYAdam/transformer_layer_1/multi_head_attention/attention_output/bias/m/Read/ReadVariableOp)Adam/dense_1/kernel/m/Read/ReadVariableOp'Adam/dense_1/bias/m/Read/ReadVariableOp)Adam/dense_2/kernel/m/Read/ReadVariableOp'Adam/dense_2/bias/m/Read/ReadVariableOpRAdam/transformer_layer_2/multi_head_attention_1/query/kernel/m/Read/ReadVariableOpPAdam/transformer_layer_2/multi_head_attention_1/query/bias/m/Read/ReadVariableOpPAdam/transformer_layer_2/multi_head_attention_1/key/kernel/m/Read/ReadVariableOpNAdam/transformer_layer_2/multi_head_attention_1/key/bias/m/Read/ReadVariableOpRAdam/transformer_layer_2/multi_head_attention_1/value/kernel/m/Read/ReadVariableOpPAdam/transformer_layer_2/multi_head_attention_1/value/bias/m/Read/ReadVariableOp]Adam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/m/Read/ReadVariableOp[Adam/transformer_layer_2/multi_head_attention_1/attention_output/bias/m/Read/ReadVariableOp)Adam/dense_3/kernel/m/Read/ReadVariableOp'Adam/dense_3/bias/m/Read/ReadVariableOp)Adam/dense_4/kernel/m/Read/ReadVariableOp'Adam/dense_4/bias/m/Read/ReadVariableOp)Adam/dense_5/kernel/v/Read/ReadVariableOp'Adam/dense_5/bias/v/Read/ReadVariableOp)Adam/dense_6/kernel/v/Read/ReadVariableOp'Adam/dense_6/bias/v/Read/ReadVariableOpFAdam/encoder3d/spatial_attention/conv3d_6/kernel/v/Read/ReadVariableOpDAdam/encoder3d/spatial_attention/conv3d_6/bias/v/Read/ReadVariableOp(Adam/conv3d/kernel/v/Read/ReadVariableOp&Adam/conv3d/bias/v/Read/ReadVariableOp*Adam/conv3d_1/kernel/v/Read/ReadVariableOp(Adam/conv3d_1/bias/v/Read/ReadVariableOp*Adam/conv3d_2/kernel/v/Read/ReadVariableOp(Adam/conv3d_2/bias/v/Read/ReadVariableOp*Adam/conv3d_3/kernel/v/Read/ReadVariableOp(Adam/conv3d_3/bias/v/Read/ReadVariableOp*Adam/conv3d_4/kernel/v/Read/ReadVariableOp(Adam/conv3d_4/bias/v/Read/ReadVariableOp*Adam/conv3d_5/kernel/v/Read/ReadVariableOp(Adam/conv3d_5/bias/v/Read/ReadVariableOp4Adam/time_distributed_1/kernel/v/Read/ReadVariableOp2Adam/time_distributed_1/bias/v/Read/ReadVariableOpHAdam/frame_position_embedding/embedding/embeddings/v/Read/ReadVariableOpPAdam/transformer_layer_1/multi_head_attention/query/kernel/v/Read/ReadVariableOpNAdam/transformer_layer_1/multi_head_attention/query/bias/v/Read/ReadVariableOpNAdam/transformer_layer_1/multi_head_attention/key/kernel/v/Read/ReadVariableOpLAdam/transformer_layer_1/multi_head_attention/key/bias/v/Read/ReadVariableOpPAdam/transformer_layer_1/multi_head_attention/value/kernel/v/Read/ReadVariableOpNAdam/transformer_layer_1/multi_head_attention/value/bias/v/Read/ReadVariableOp[Adam/transformer_layer_1/multi_head_attention/attention_output/kernel/v/Read/ReadVariableOpYAdam/transformer_layer_1/multi_head_attention/attention_output/bias/v/Read/ReadVariableOp)Adam/dense_1/kernel/v/Read/ReadVariableOp'Adam/dense_1/bias/v/Read/ReadVariableOp)Adam/dense_2/kernel/v/Read/ReadVariableOp'Adam/dense_2/bias/v/Read/ReadVariableOpRAdam/transformer_layer_2/multi_head_attention_1/query/kernel/v/Read/ReadVariableOpPAdam/transformer_layer_2/multi_head_attention_1/query/bias/v/Read/ReadVariableOpPAdam/transformer_layer_2/multi_head_attention_1/key/kernel/v/Read/ReadVariableOpNAdam/transformer_layer_2/multi_head_attention_1/key/bias/v/Read/ReadVariableOpRAdam/transformer_layer_2/multi_head_attention_1/value/kernel/v/Read/ReadVariableOpPAdam/transformer_layer_2/multi_head_attention_1/value/bias/v/Read/ReadVariableOp]Adam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/v/Read/ReadVariableOp[Adam/transformer_layer_2/multi_head_attention_1/attention_output/bias/v/Read/ReadVariableOp)Adam/dense_3/kernel/v/Read/ReadVariableOp'Adam/dense_3/bias/v/Read/ReadVariableOp)Adam/dense_4/kernel/v/Read/ReadVariableOp'Adam/dense_4/bias/v/Read/ReadVariableOpConst* 
Tin
2	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *'
f"R 
__inference__traced_save_15490
Ф+
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamedense_5/kerneldense_5/biasdense_6/kerneldense_6/bias+encoder3d/spatial_attention/conv3d_6/kernel)encoder3d/spatial_attention/conv3d_6/biasconv3d/kernelconv3d/biasconv3d_1/kernelconv3d_1/biasconv3d_2/kernelconv3d_2/biasconv3d_3/kernelconv3d_3/biasconv3d_4/kernelconv3d_4/biasconv3d_5/kernelconv3d_5/biastime_distributed_1/kerneltime_distributed_1/bias-frame_position_embedding/embedding/embeddings5transformer_layer_1/multi_head_attention/query/kernel3transformer_layer_1/multi_head_attention/query/bias3transformer_layer_1/multi_head_attention/key/kernel1transformer_layer_1/multi_head_attention/key/bias5transformer_layer_1/multi_head_attention/value/kernel3transformer_layer_1/multi_head_attention/value/bias@transformer_layer_1/multi_head_attention/attention_output/kernel>transformer_layer_1/multi_head_attention/attention_output/biasdense_1/kerneldense_1/biasdense_2/kerneldense_2/bias7transformer_layer_2/multi_head_attention_1/query/kernel5transformer_layer_2/multi_head_attention_1/query/bias5transformer_layer_2/multi_head_attention_1/key/kernel3transformer_layer_2/multi_head_attention_1/key/bias7transformer_layer_2/multi_head_attention_1/value/kernel5transformer_layer_2/multi_head_attention_1/value/biasBtransformer_layer_2/multi_head_attention_1/attention_output/kernel@transformer_layer_2/multi_head_attention_1/attention_output/biasdense_3/kerneldense_3/biasdense_4/kerneldense_4/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotal_1count_1totalcountAdam/dense_5/kernel/mAdam/dense_5/bias/mAdam/dense_6/kernel/mAdam/dense_6/bias/m2Adam/encoder3d/spatial_attention/conv3d_6/kernel/m0Adam/encoder3d/spatial_attention/conv3d_6/bias/mAdam/conv3d/kernel/mAdam/conv3d/bias/mAdam/conv3d_1/kernel/mAdam/conv3d_1/bias/mAdam/conv3d_2/kernel/mAdam/conv3d_2/bias/mAdam/conv3d_3/kernel/mAdam/conv3d_3/bias/mAdam/conv3d_4/kernel/mAdam/conv3d_4/bias/mAdam/conv3d_5/kernel/mAdam/conv3d_5/bias/m Adam/time_distributed_1/kernel/mAdam/time_distributed_1/bias/m4Adam/frame_position_embedding/embedding/embeddings/m<Adam/transformer_layer_1/multi_head_attention/query/kernel/m:Adam/transformer_layer_1/multi_head_attention/query/bias/m:Adam/transformer_layer_1/multi_head_attention/key/kernel/m8Adam/transformer_layer_1/multi_head_attention/key/bias/m<Adam/transformer_layer_1/multi_head_attention/value/kernel/m:Adam/transformer_layer_1/multi_head_attention/value/bias/mGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/mEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/mAdam/dense_1/kernel/mAdam/dense_1/bias/mAdam/dense_2/kernel/mAdam/dense_2/bias/m>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/m<Adam/transformer_layer_2/multi_head_attention_1/query/bias/m<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/m:Adam/transformer_layer_2/multi_head_attention_1/key/bias/m>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/m<Adam/transformer_layer_2/multi_head_attention_1/value/bias/mIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/mGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/mAdam/dense_3/kernel/mAdam/dense_3/bias/mAdam/dense_4/kernel/mAdam/dense_4/bias/mAdam/dense_5/kernel/vAdam/dense_5/bias/vAdam/dense_6/kernel/vAdam/dense_6/bias/v2Adam/encoder3d/spatial_attention/conv3d_6/kernel/v0Adam/encoder3d/spatial_attention/conv3d_6/bias/vAdam/conv3d/kernel/vAdam/conv3d/bias/vAdam/conv3d_1/kernel/vAdam/conv3d_1/bias/vAdam/conv3d_2/kernel/vAdam/conv3d_2/bias/vAdam/conv3d_3/kernel/vAdam/conv3d_3/bias/vAdam/conv3d_4/kernel/vAdam/conv3d_4/bias/vAdam/conv3d_5/kernel/vAdam/conv3d_5/bias/v Adam/time_distributed_1/kernel/vAdam/time_distributed_1/bias/v4Adam/frame_position_embedding/embedding/embeddings/v<Adam/transformer_layer_1/multi_head_attention/query/kernel/v:Adam/transformer_layer_1/multi_head_attention/query/bias/v:Adam/transformer_layer_1/multi_head_attention/key/kernel/v8Adam/transformer_layer_1/multi_head_attention/key/bias/v<Adam/transformer_layer_1/multi_head_attention/value/kernel/v:Adam/transformer_layer_1/multi_head_attention/value/bias/vGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/vEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/vAdam/dense_1/kernel/vAdam/dense_1/bias/vAdam/dense_2/kernel/vAdam/dense_2/bias/v>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/v<Adam/transformer_layer_2/multi_head_attention_1/query/bias/v<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/v:Adam/transformer_layer_2/multi_head_attention_1/key/bias/v>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/v<Adam/transformer_layer_2/multi_head_attention_1/value/bias/vIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/vGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/vAdam/dense_3/kernel/vAdam/dense_3/bias/vAdam/dense_4/kernel/vAdam/dense_4/bias/v*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 **
f%R#
!__inference__traced_restore_15932ѕ'
д
М
E__inference_sequential_layer_call_and_return_conditional_losses_13821

inputs*
conv3d_13810: 
conv3d_13812: ,
conv3d_1_13815:  
conv3d_1_13817: 
identityЂconv3d/StatefulPartitionedCallЂ conv3d_1/StatefulPartitionedCallє
conv3d/StatefulPartitionedCallStatefulPartitionedCallinputsconv3d_13810conv3d_13812*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ   *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *J
fERC
A__inference_conv3d_layer_call_and_return_conditional_losses_13737
 conv3d_1/StatefulPartitionedCallStatefulPartitionedCall'conv3d/StatefulPartitionedCall:output:0conv3d_1_13815conv3d_1_13817*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ   *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_1_layer_call_and_return_conditional_losses_13754
IdentityIdentity)conv3d_1/StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   
NoOpNoOp^conv3d/StatefulPartitionedCall!^conv3d_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ  : : : : 2@
conv3d/StatefulPartitionedCallconv3d/StatefulPartitionedCall2D
 conv3d_1/StatefulPartitionedCall conv3d_1/StatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
Ѕ

C__inference_conv3d_3_layer_call_and_return_conditional_losses_13908

inputs<
conv3d_readvariableop_resource:@@-
biasadd_readvariableop_resource:@
identityЂBiasAdd/ReadVariableOpЂConv3D/ReadVariableOp
Conv3D/ReadVariableOpReadVariableOpconv3d_readvariableop_resource**
_output_shapes
:@@*
dtype0
Conv3DConv3DinputsConv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
BiasAddBiasAddConv3D:output:0BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@\
ReluReluBiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@m
IdentityIdentityRelu:activations:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv3D/ReadVariableOpConv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ@
 
_user_specified_nameinputs
д

'__inference_dense_2_layer_call_fn_14799

inputs
unknown:	@
	unknown_0:@
identityЂStatefulPartitionedCallо
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_13342s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:џџџџџџџџџ: : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs


M__inference_time_distributed_1_layer_call_and_return_conditional_losses_13232

inputs7
$dense_matmul_readvariableop_resource:	@3
%dense_biasadd_readvariableop_resource:@
identityЂdense/BiasAdd/ReadVariableOpЂdense/MatMul/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:б
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask^
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   e
ReshapeReshapeinputsReshape/shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџ
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource*
_output_shapes
:	@*
dtype0
dense/MatMulMatMulReshape:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@~
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@U
dense/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?z
dense/Gelu/mulMuldense/Gelu/mul/x:output:0dense/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ@V
dense/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?
dense/Gelu/truedivRealDivdense/BiasAdd:output:0dense/Gelu/Cast/x:output:0*
T0*'
_output_shapes
:џџџџџџџџџ@_
dense/Gelu/ErfErfdense/Gelu/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџ@U
dense/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?x
dense/Gelu/addAddV2dense/Gelu/add/x:output:0dense/Gelu/Erf:y:0*
T0*'
_output_shapes
:џџџџџџџџџ@q
dense/Gelu/mul_1Muldense/Gelu/mul:z:0dense/Gelu/add:z:0*
T0*'
_output_shapes
:џџџџџџџџџ@\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџS
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value	B :@
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:
	Reshape_1Reshapedense/Gelu/mul_1:z:0Reshape_1/shape:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ@n
IdentityIdentityReshape_1:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ@
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:џџџџџџџџџџџџџџџџџџ: : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp:] Y
5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
f

@__inference_model_layer_call_and_return_conditional_losses_13105

inputs-
encoder3d_12971:
encoder3d_12973:-
encoder3d_12975: 
encoder3d_12977: -
encoder3d_12979:  
encoder3d_12981: -
encoder3d_12983: @
encoder3d_12985:@-
encoder3d_12987:@@
encoder3d_12989:@.
encoder3d_12991:@
encoder3d_12993:	/
encoder3d_12995:
encoder3d_12997:	J
7time_distributed_1_dense_matmul_readvariableop_resource:	@F
8time_distributed_1_dense_biasadd_readvariableop_resource:@0
frame_position_embedding_13028:@/
transformer_layer_1_13031:@@+
transformer_layer_1_13033:@/
transformer_layer_1_13035:@@+
transformer_layer_1_13037:@/
transformer_layer_1_13039:@@+
transformer_layer_1_13041:@/
transformer_layer_1_13043:@@'
transformer_layer_1_13045:@,
transformer_layer_1_13047:	@(
transformer_layer_1_13049:	,
transformer_layer_1_13051:	@'
transformer_layer_1_13053:@/
transformer_layer_2_13056:@@+
transformer_layer_2_13058:@/
transformer_layer_2_13060:@@+
transformer_layer_2_13062:@/
transformer_layer_2_13064:@@+
transformer_layer_2_13066:@/
transformer_layer_2_13068:@@'
transformer_layer_2_13070:@,
transformer_layer_2_13072:	@(
transformer_layer_2_13074:	,
transformer_layer_2_13076:	@'
transformer_layer_2_13078:@:
&dense_5_matmul_readvariableop_resource:
6
'dense_5_biasadd_readvariableop_resource:	9
&dense_6_matmul_readvariableop_resource:	5
'dense_6_biasadd_readvariableop_resource:
identityЂdense_5/BiasAdd/ReadVariableOpЂdense_5/MatMul/ReadVariableOpЂdense_6/BiasAdd/ReadVariableOpЂdense_6/MatMul/ReadVariableOpЂ!encoder3d/StatefulPartitionedCallЂ0frame_position_embedding/StatefulPartitionedCallЂ/time_distributed_1/dense/BiasAdd/ReadVariableOpЂ.time_distributed_1/dense/MatMul/ReadVariableOpЂ+transformer_layer_1/StatefulPartitionedCallЂ+transformer_layer_2/StatefulPartitionedCallЩ
!encoder3d/StatefulPartitionedCallStatefulPartitionedCallinputsencoder3d_12971encoder3d_12973encoder3d_12975encoder3d_12977encoder3d_12979encoder3d_12981encoder3d_12983encoder3d_12985encoder3d_12987encoder3d_12989encoder3d_12991encoder3d_12993encoder3d_12995encoder3d_12997*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11973w
time_distributed/Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"џџџџ         Г
time_distributed/ReshapeReshape*encoder3d/StatefulPartitionedCall:output:0'time_distributed/Reshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџo
time_distributed/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   Њ
 time_distributed/flatten/ReshapeReshape!time_distributed/Reshape:output:0'time_distributed/flatten/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџu
 time_distributed/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*!
valueB"џџџџ      В
time_distributed/Reshape_1Reshape)time_distributed/flatten/Reshape:output:0)time_distributed/Reshape_1/shape:output:0*
T0*,
_output_shapes
:џџџџџџџџџy
 time_distributed/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*%
valueB"џџџџ         З
time_distributed/Reshape_2Reshape*encoder3d/StatefulPartitionedCall:output:0)time_distributed/Reshape_2/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџq
 time_distributed_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   Ј
time_distributed_1/ReshapeReshape#time_distributed/Reshape_1:output:0)time_distributed_1/Reshape/shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџЇ
.time_distributed_1/dense/MatMul/ReadVariableOpReadVariableOp7time_distributed_1_dense_matmul_readvariableop_resource*
_output_shapes
:	@*
dtype0И
time_distributed_1/dense/MatMulMatMul#time_distributed_1/Reshape:output:06time_distributed_1/dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@Є
/time_distributed_1/dense/BiasAdd/ReadVariableOpReadVariableOp8time_distributed_1_dense_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0С
 time_distributed_1/dense/BiasAddBiasAdd)time_distributed_1/dense/MatMul:product:07time_distributed_1/dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@h
#time_distributed_1/dense/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Г
!time_distributed_1/dense/Gelu/mulMul,time_distributed_1/dense/Gelu/mul/x:output:0)time_distributed_1/dense/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ@i
$time_distributed_1/dense/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?М
%time_distributed_1/dense/Gelu/truedivRealDiv)time_distributed_1/dense/BiasAdd:output:0-time_distributed_1/dense/Gelu/Cast/x:output:0*
T0*'
_output_shapes
:џџџџџџџџџ@
!time_distributed_1/dense/Gelu/ErfErf)time_distributed_1/dense/Gelu/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџ@h
#time_distributed_1/dense/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Б
!time_distributed_1/dense/Gelu/addAddV2,time_distributed_1/dense/Gelu/add/x:output:0%time_distributed_1/dense/Gelu/Erf:y:0*
T0*'
_output_shapes
:џџџџџџџџџ@Њ
#time_distributed_1/dense/Gelu/mul_1Mul%time_distributed_1/dense/Gelu/mul:z:0%time_distributed_1/dense/Gelu/add:z:0*
T0*'
_output_shapes
:џџџџџџџџџ@w
"time_distributed_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*!
valueB"џџџџ   @   Г
time_distributed_1/Reshape_1Reshape'time_distributed_1/dense/Gelu/mul_1:z:0+time_distributed_1/Reshape_1/shape:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@s
"time_distributed_1/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   Ќ
time_distributed_1/Reshape_2Reshape#time_distributed/Reshape_1:output:0+time_distributed_1/Reshape_2/shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџ
0frame_position_embedding/StatefulPartitionedCallStatefulPartitionedCall%time_distributed_1/Reshape_1:output:0frame_position_embedding_13028*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11291Я
+transformer_layer_1/StatefulPartitionedCallStatefulPartitionedCall9frame_position_embedding/StatefulPartitionedCall:output:0transformer_layer_1_13031transformer_layer_1_13033transformer_layer_1_13035transformer_layer_1_13037transformer_layer_1_13039transformer_layer_1_13041transformer_layer_1_13043transformer_layer_1_13045transformer_layer_1_13047transformer_layer_1_13049transformer_layer_1_13051transformer_layer_1_13053*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_12044Ъ
+transformer_layer_2/StatefulPartitionedCallStatefulPartitionedCall4transformer_layer_1/StatefulPartitionedCall:output:0transformer_layer_2_13056transformer_layer_2_13058transformer_layer_2_13060transformer_layer_2_13062transformer_layer_2_13064transformer_layer_2_13066transformer_layer_2_13068transformer_layer_2_13070transformer_layer_2_13072transformer_layer_2_13074transformer_layer_2_13076transformer_layer_2_13078*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_12098`
flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   
flatten_1/ReshapeReshape4transformer_layer_2/StatefulPartitionedCall:output:0flatten_1/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџ
dense_5/MatMul/ReadVariableOpReadVariableOp&dense_5_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
dense_5/MatMulMatMulflatten_1/Reshape:output:0%dense_5/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџ
dense_5/BiasAdd/ReadVariableOpReadVariableOp'dense_5_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
dense_5/BiasAddBiasAdddense_5/MatMul:product:0&dense_5/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџW
dense_5/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?
dense_5/Gelu/mulMuldense_5/Gelu/mul/x:output:0dense_5/BiasAdd:output:0*
T0*(
_output_shapes
:џџџџџџџџџX
dense_5/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?
dense_5/Gelu/truedivRealDivdense_5/BiasAdd:output:0dense_5/Gelu/Cast/x:output:0*
T0*(
_output_shapes
:џџџџџџџџџd
dense_5/Gelu/ErfErfdense_5/Gelu/truediv:z:0*
T0*(
_output_shapes
:џџџџџџџџџW
dense_5/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
dense_5/Gelu/addAddV2dense_5/Gelu/add/x:output:0dense_5/Gelu/Erf:y:0*
T0*(
_output_shapes
:џџџџџџџџџx
dense_5/Gelu/mul_1Muldense_5/Gelu/mul:z:0dense_5/Gelu/add:z:0*
T0*(
_output_shapes
:џџџџџџџџџ
dense_6/MatMul/ReadVariableOpReadVariableOp&dense_6_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
dense_6/MatMulMatMuldense_5/Gelu/mul_1:z:0%dense_6/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ
dense_6/BiasAdd/ReadVariableOpReadVariableOp'dense_6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
dense_6/BiasAddBiasAdddense_6/MatMul:product:0&dense_6/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџf
dense_6/SoftmaxSoftmaxdense_6/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџh
IdentityIdentitydense_6/Softmax:softmax:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџо
NoOpNoOp^dense_5/BiasAdd/ReadVariableOp^dense_5/MatMul/ReadVariableOp^dense_6/BiasAdd/ReadVariableOp^dense_6/MatMul/ReadVariableOp"^encoder3d/StatefulPartitionedCall1^frame_position_embedding/StatefulPartitionedCall0^time_distributed_1/dense/BiasAdd/ReadVariableOp/^time_distributed_1/dense/MatMul/ReadVariableOp,^transformer_layer_1/StatefulPartitionedCall,^transformer_layer_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes{
y:џџџџџџџџџ  : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2@
dense_5/BiasAdd/ReadVariableOpdense_5/BiasAdd/ReadVariableOp2>
dense_5/MatMul/ReadVariableOpdense_5/MatMul/ReadVariableOp2@
dense_6/BiasAdd/ReadVariableOpdense_6/BiasAdd/ReadVariableOp2>
dense_6/MatMul/ReadVariableOpdense_6/MatMul/ReadVariableOp2F
!encoder3d/StatefulPartitionedCall!encoder3d/StatefulPartitionedCall2d
0frame_position_embedding/StatefulPartitionedCall0frame_position_embedding/StatefulPartitionedCall2b
/time_distributed_1/dense/BiasAdd/ReadVariableOp/time_distributed_1/dense/BiasAdd/ReadVariableOp2`
.time_distributed_1/dense/MatMul/ReadVariableOp.time_distributed_1/dense/MatMul/ReadVariableOp2Z
+transformer_layer_1/StatefulPartitionedCall+transformer_layer_1/StatefulPartitionedCall2Z
+transformer_layer_2/StatefulPartitionedCall+transformer_layer_2/StatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
и"
ћ
B__inference_dense_3_layer_call_and_return_conditional_losses_13506

inputs4
!tensordot_readvariableop_resource:	@.
biasadd_readvariableop_resource:	
identityЂBiasAdd/ReadVariableOpЂTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : Л
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : П
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:y
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџ\
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ї
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџO

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?m
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџP
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?v
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџX
Gelu/ErfErfGelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџO

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?k
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџd

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџb
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*,
_output_shapes
:џџџџџџџџџz
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
В
в
,__inference_sequential_1_layer_call_fn_14416

inputs
unknown:	@
	unknown_0:	
	unknown_1:	@
	unknown_2:@
identityЂStatefulPartitionedCall§
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *P
fKRI
G__inference_sequential_1_layer_call_and_return_conditional_losses_13549s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
Ў
а
*__inference_sequential_layer_call_fn_14275

inputs
unknown:	@
	unknown_0:	
	unknown_1:	@
	unknown_2:@
identityЂStatefulPartitionedCallћ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_13409s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
	
є
,__inference_sequential_2_layer_call_fn_14153
conv3d_4_input&
unknown:@
	unknown_0:	)
	unknown_1:
	unknown_2:	
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallconv3d_4_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *P
fKRI
G__inference_sequential_2_layer_call_and_return_conditional_losses_14129|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:c _
3
_output_shapes!
:џџџџџџџџџ@
(
_user_specified_nameconv3d_4_input

 
2__inference_time_distributed_1_layer_call_fn_13203

inputs
unknown:	@
	unknown_0:@
identityЂStatefulPartitionedCallђ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *V
fQRO
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_11566|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:џџџџџџџџџџџџџџџџџџ: : 22
StatefulPartitionedCallStatefulPartitionedCall:] Y
5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs

У
(__inference_restored_function_body_11377

inputs
unknown:@@
	unknown_0:@
	unknown_1:@@
	unknown_2:@
	unknown_3:@@
	unknown_4:@
	unknown_5:@@
	unknown_6:@
	unknown_7:	@
	unknown_8:	
	unknown_9:	@

unknown_10:@
identityЂStatefulPartitionedCallЭ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *V
fQRO
M__inference_transformer_layer_2_layer_call_and_return_conditional_losses_5281s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs

У
(__inference_restored_function_body_12098

inputs
unknown:@@
	unknown_0:@
	unknown_1:@@
	unknown_2:@
	unknown_3:@@
	unknown_4:@
	unknown_5:@@
	unknown_6:@
	unknown_7:	@
	unknown_8:	
	unknown_9:	@

unknown_10:@
identityЂStatefulPartitionedCallЭ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *V
fQRO
M__inference_transformer_layer_2_layer_call_and_return_conditional_losses_1181s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
ц
Т
E__inference_sequential_layer_call_and_return_conditional_losses_13859
conv3d_input*
conv3d_13848: 
conv3d_13850: ,
conv3d_1_13853:  
conv3d_1_13855: 
identityЂconv3d/StatefulPartitionedCallЂ conv3d_1/StatefulPartitionedCallњ
conv3d/StatefulPartitionedCallStatefulPartitionedCallconv3d_inputconv3d_13848conv3d_13850*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ   *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *J
fERC
A__inference_conv3d_layer_call_and_return_conditional_losses_13737
 conv3d_1/StatefulPartitionedCallStatefulPartitionedCall'conv3d/StatefulPartitionedCall:output:0conv3d_1_13853conv3d_1_13855*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ   *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_1_layer_call_and_return_conditional_losses_13754
IdentityIdentity)conv3d_1/StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   
NoOpNoOp^conv3d/StatefulPartitionedCall!^conv3d_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ  : : : : 2@
conv3d/StatefulPartitionedCallconv3d/StatefulPartitionedCall2D
 conv3d_1/StatefulPartitionedCall conv3d_1/StatefulPartitionedCall:a ]
3
_output_shapes!
:џџџџџџџџџ  
&
_user_specified_nameconv3d_input

Ь
G__inference_sequential_1_layer_call_and_return_conditional_losses_14027
conv3d_2_input,
conv3d_2_14016: @
conv3d_2_14018:@,
conv3d_3_14021:@@
conv3d_3_14023:@
identityЂ conv3d_2/StatefulPartitionedCallЂ conv3d_3/StatefulPartitionedCall
 conv3d_2/StatefulPartitionedCallStatefulPartitionedCallconv3d_2_inputconv3d_2_14016conv3d_2_14018*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_2_layer_call_and_return_conditional_losses_13891
 conv3d_3/StatefulPartitionedCallStatefulPartitionedCall)conv3d_2/StatefulPartitionedCall:output:0conv3d_3_14021conv3d_3_14023*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_3_layer_call_and_return_conditional_losses_13908
IdentityIdentity)conv3d_3/StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@
NoOpNoOp!^conv3d_2/StatefulPartitionedCall!^conv3d_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ : : : : 2D
 conv3d_2/StatefulPartitionedCall conv3d_2/StatefulPartitionedCall2D
 conv3d_3/StatefulPartitionedCall conv3d_3/StatefulPartitionedCall:c _
3
_output_shapes!
:џџџџџџџџџ 
(
_user_specified_nameconv3d_2_input

Є
(__inference_conv3d_5_layer_call_fn_15024

inputs'
unknown:
	unknown_0:	
identityЂStatefulPartitionedCallш
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_5_layer_call_and_return_conditional_losses_14062|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:џџџџџџџџџ: : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
4
_output_shapes"
 :џџџџџџџџџ
 
_user_specified_nameinputs
ч
ч
,__inference_sequential_1_layer_call_fn_14632

inputs%
unknown: @
	unknown_0:@'
	unknown_1:@@
	unknown_2:@
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *P
fKRI
G__inference_sequential_1_layer_call_and_return_conditional_losses_13915{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ 
 
_user_specified_nameinputs
О

L__inference_transformer_layer_1_layer_call_and_return_conditional_losses_971

inputsV
@multi_head_attention_query_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_query_add_readvariableop_resource:@T
>multi_head_attention_key_einsum_einsum_readvariableop_resource:@@F
4multi_head_attention_key_add_readvariableop_resource:@V
@multi_head_attention_value_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_value_add_readvariableop_resource:@a
Kmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource:@@O
Amulti_head_attention_attention_output_add_readvariableop_resource:@G
4sequential_dense_1_tensordot_readvariableop_resource:	@A
2sequential_dense_1_biasadd_readvariableop_resource:	G
4sequential_dense_2_tensordot_readvariableop_resource:	@@
2sequential_dense_2_biasadd_readvariableop_resource:@
identityЂ8multi_head_attention/attention_output/add/ReadVariableOpЂBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpЂ+multi_head_attention/key/add/ReadVariableOpЂ5multi_head_attention/key/einsum/Einsum/ReadVariableOpЂ-multi_head_attention/query/add/ReadVariableOpЂ7multi_head_attention/query/einsum/Einsum/ReadVariableOpЂ-multi_head_attention/value/add/ReadVariableOpЂ7multi_head_attention/value/einsum/Einsum/ReadVariableOpЂ)sequential/dense_1/BiasAdd/ReadVariableOpЂ+sequential/dense_1/Tensordot/ReadVariableOpЂ)sequential/dense_2/BiasAdd/ReadVariableOpЂ+sequential/dense_2/Tensordot/ReadVariableOpМ
7multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0л
(multi_head_attention/query/einsum/EinsumEinsuminputs?multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЄ
-multi_head_attention/query/add/ReadVariableOpReadVariableOp6multi_head_attention_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ы
multi_head_attention/query/addAddV21multi_head_attention/query/einsum/Einsum:output:05multi_head_attention/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@И
5multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOp>multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0з
&multi_head_attention/key/einsum/EinsumEinsuminputs=multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abde 
+multi_head_attention/key/add/ReadVariableOpReadVariableOp4multi_head_attention_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Х
multi_head_attention/key/addAddV2/multi_head_attention/key/einsum/Einsum:output:03multi_head_attention/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@М
7multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0л
(multi_head_attention/value/einsum/EinsumEinsuminputs?multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЄ
-multi_head_attention/value/add/ReadVariableOpReadVariableOp6multi_head_attention_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ы
multi_head_attention/value/addAddV21multi_head_attention/value/einsum/Einsum:output:05multi_head_attention/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@_
multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >Ђ
multi_head_attention/MulMul"multi_head_attention/query/add:z:0#multi_head_attention/Mul/y:output:0*
T0*/
_output_shapes
:џџџџџџџџџ@Ю
"multi_head_attention/einsum/EinsumEinsum multi_head_attention/key/add:z:0multi_head_attention/Mul:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ*
equationaecd,abcd->acbe
$multi_head_attention/softmax/SoftmaxSoftmax+multi_head_attention/einsum/Einsum:output:0*
T0*/
_output_shapes
:џџџџџџџџџф
$multi_head_attention/einsum_1/EinsumEinsum.multi_head_attention/softmax/Softmax:softmax:0"multi_head_attention/value/add:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationacbe,aecd->abcdв
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpKmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0
3multi_head_attention/attention_output/einsum/EinsumEinsum-multi_head_attention/einsum_1/Einsum:output:0Jmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:џџџџџџџџџ@*
equationabcd,cde->abeЖ
8multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpAmulti_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0ш
)multi_head_attention/attention_output/addAddV2<multi_head_attention/attention_output/einsum/Einsum:output:0@multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@y
addAddV2inputs-multi_head_attention/attention_output/add:z:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ё
+sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0k
!sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:r
!sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Y
"sequential/dense_1/Tensordot/ShapeShapeadd:z:0*
T0*
_output_shapes
:l
*sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
%sequential/dense_1/Tensordot/GatherV2GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/free:output:03sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
,sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential/dense_1/Tensordot/GatherV2_1GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/axes:output:05sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
"sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: Ї
!sequential/dense_1/Tensordot/ProdProd.sequential/dense_1/Tensordot/GatherV2:output:0+sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ­
#sequential/dense_1/Tensordot/Prod_1Prod0sequential/dense_1/Tensordot/GatherV2_1:output:0-sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ш
#sequential/dense_1/Tensordot/concatConcatV2*sequential/dense_1/Tensordot/free:output:0*sequential/dense_1/Tensordot/axes:output:01sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:В
"sequential/dense_1/Tensordot/stackPack*sequential/dense_1/Tensordot/Prod:output:0,sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
: 
&sequential/dense_1/Tensordot/transpose	Transposeadd:z:0,sequential/dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@У
$sequential/dense_1/Tensordot/ReshapeReshape*sequential/dense_1/Tensordot/transpose:y:0+sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџФ
#sequential/dense_1/Tensordot/MatMulMatMul-sequential/dense_1/Tensordot/Reshape:output:03sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџo
$sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:l
*sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ѓ
%sequential/dense_1/Tensordot/concat_1ConcatV2.sequential/dense_1/Tensordot/GatherV2:output:0-sequential/dense_1/Tensordot/Const_2:output:03sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Н
sequential/dense_1/TensordotReshape-sequential/dense_1/Tensordot/MatMul:product:0.sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0Ж
sequential/dense_1/BiasAddBiasAdd%sequential/dense_1/Tensordot:output:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџb
sequential/dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?І
sequential/dense_1/Gelu/mulMul&sequential/dense_1/Gelu/mul/x:output:0#sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџc
sequential/dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?Џ
sequential/dense_1/Gelu/truedivRealDiv#sequential/dense_1/BiasAdd:output:0'sequential/dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџ~
sequential/dense_1/Gelu/ErfErf#sequential/dense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџb
sequential/dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Є
sequential/dense_1/Gelu/addAddV2&sequential/dense_1/Gelu/add/x:output:0sequential/dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџ
sequential/dense_1/Gelu/mul_1Mulsequential/dense_1/Gelu/mul:z:0sequential/dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџЁ
+sequential/dense_2/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_2_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0k
!sequential/dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:r
!sequential/dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       s
"sequential/dense_2/Tensordot/ShapeShape!sequential/dense_1/Gelu/mul_1:z:0*
T0*
_output_shapes
:l
*sequential/dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
%sequential/dense_2/Tensordot/GatherV2GatherV2+sequential/dense_2/Tensordot/Shape:output:0*sequential/dense_2/Tensordot/free:output:03sequential/dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
,sequential/dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential/dense_2/Tensordot/GatherV2_1GatherV2+sequential/dense_2/Tensordot/Shape:output:0*sequential/dense_2/Tensordot/axes:output:05sequential/dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
"sequential/dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: Ї
!sequential/dense_2/Tensordot/ProdProd.sequential/dense_2/Tensordot/GatherV2:output:0+sequential/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ­
#sequential/dense_2/Tensordot/Prod_1Prod0sequential/dense_2/Tensordot/GatherV2_1:output:0-sequential/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ш
#sequential/dense_2/Tensordot/concatConcatV2*sequential/dense_2/Tensordot/free:output:0*sequential/dense_2/Tensordot/axes:output:01sequential/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:В
"sequential/dense_2/Tensordot/stackPack*sequential/dense_2/Tensordot/Prod:output:0,sequential/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Л
&sequential/dense_2/Tensordot/transpose	Transpose!sequential/dense_1/Gelu/mul_1:z:0,sequential/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџУ
$sequential/dense_2/Tensordot/ReshapeReshape*sequential/dense_2/Tensordot/transpose:y:0+sequential/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџУ
#sequential/dense_2/Tensordot/MatMulMatMul-sequential/dense_2/Tensordot/Reshape:output:03sequential/dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@n
$sequential/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@l
*sequential/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ѓ
%sequential/dense_2/Tensordot/concat_1ConcatV2.sequential/dense_2/Tensordot/GatherV2:output:0-sequential/dense_2/Tensordot/Const_2:output:03sequential/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:М
sequential/dense_2/TensordotReshape-sequential/dense_2/Tensordot/MatMul:product:0.sequential/dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
)sequential/dense_2/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Е
sequential/dense_2/BiasAddBiasAdd%sequential/dense_2/Tensordot:output:01sequential/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@r
add_1AddV2add:z:0#sequential/dense_2/BiasAdd:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Д
NoOpNoOp9^multi_head_attention/attention_output/add/ReadVariableOpC^multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp,^multi_head_attention/key/add/ReadVariableOp6^multi_head_attention/key/einsum/Einsum/ReadVariableOp.^multi_head_attention/query/add/ReadVariableOp8^multi_head_attention/query/einsum/Einsum/ReadVariableOp.^multi_head_attention/value/add/ReadVariableOp8^multi_head_attention/value/einsum/Einsum/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp,^sequential/dense_1/Tensordot/ReadVariableOp*^sequential/dense_2/BiasAdd/ReadVariableOp,^sequential/dense_2/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 \
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 2t
8multi_head_attention/attention_output/add/ReadVariableOp8multi_head_attention/attention_output/add/ReadVariableOp2
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp2Z
+multi_head_attention/key/add/ReadVariableOp+multi_head_attention/key/add/ReadVariableOp2n
5multi_head_attention/key/einsum/Einsum/ReadVariableOp5multi_head_attention/key/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/query/add/ReadVariableOp-multi_head_attention/query/add/ReadVariableOp2r
7multi_head_attention/query/einsum/Einsum/ReadVariableOp7multi_head_attention/query/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/value/add/ReadVariableOp-multi_head_attention/value/add/ReadVariableOp2r
7multi_head_attention/value/einsum/Einsum/ReadVariableOp7multi_head_attention/value/einsum/Einsum/ReadVariableOp2V
)sequential/dense_1/BiasAdd/ReadVariableOp)sequential/dense_1/BiasAdd/ReadVariableOp2Z
+sequential/dense_1/Tensordot/ReadVariableOp+sequential/dense_1/Tensordot/ReadVariableOp2V
)sequential/dense_2/BiasAdd/ReadVariableOp)sequential/dense_2/BiasAdd/ReadVariableOp2Z
+sequential/dense_2/Tensordot/ReadVariableOp+sequential/dense_2/Tensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
­

C__inference_conv3d_4_layer_call_and_return_conditional_losses_14045

inputs=
conv3d_readvariableop_resource:@.
biasadd_readvariableop_resource:	
identityЂBiasAdd/ReadVariableOpЂConv3D/ReadVariableOp
Conv3D/ReadVariableOpReadVariableOpconv3d_readvariableop_resource*+
_output_shapes
:@*
dtype0
Conv3DConv3DinputsConv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	
s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
BiasAddBiasAddConv3D:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ]
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџn
IdentityIdentityRelu:activations:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџw
NoOpNoOp^BiasAdd/ReadVariableOp^Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv3D/ReadVariableOpConv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ@
 
_user_specified_nameinputs
Ѕ

C__inference_conv3d_3_layer_call_and_return_conditional_losses_14995

inputs<
conv3d_readvariableop_resource:@@-
biasadd_readvariableop_resource:@
identityЂBiasAdd/ReadVariableOpЂConv3D/ReadVariableOp
Conv3D/ReadVariableOpReadVariableOpconv3d_readvariableop_resource**
_output_shapes
:@@*
dtype0
Conv3DConv3DinputsConv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
BiasAddBiasAddConv3D:output:0BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@\
ReluReluBiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@m
IdentityIdentityRelu:activations:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv3D/ReadVariableOpConv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ@
 
_user_specified_nameinputs
Ќ
Э
2__inference_transformer_layer_1_layer_call_fn_1346

inputs
unknown:@@
	unknown_0:@
	unknown_1:@@
	unknown_2:@
	unknown_3:@@
	unknown_4:@
	unknown_5:@@
	unknown_6:@
	unknown_7:	@
	unknown_8:	
	unknown_9:	@

unknown_10:@
identityЂStatefulPartitionedCallь
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *V
fQRO
M__inference_transformer_layer_1_layer_call_and_return_conditional_losses_1329`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
Ѓ
ў
A__inference_conv3d_layer_call_and_return_conditional_losses_13737

inputs<
conv3d_readvariableop_resource: -
biasadd_readvariableop_resource: 
identityЂBiasAdd/ReadVariableOpЂConv3D/ReadVariableOp
Conv3D/ReadVariableOpReadVariableOpconv3d_readvariableop_resource**
_output_shapes
: *
dtype0
Conv3DConv3DinputsConv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0
BiasAddBiasAddConv3D:output:0BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   \
ReluReluBiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   m
IdentityIdentityRelu:activations:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ  : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv3D/ReadVariableOpConv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
и"
ћ
B__inference_dense_1_layer_call_and_return_conditional_losses_14790

inputs4
!tensordot_readvariableop_resource:	@.
biasadd_readvariableop_resource:	
identityЂBiasAdd/ReadVariableOpЂTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : Л
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : П
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:y
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџ\
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ї
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџO

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?m
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџP
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?v
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџX
Gelu/ErfErfGelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџO

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?k
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџd

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџb
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*,
_output_shapes
:џџџџџџџџџz
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
ѕC
ї
@__inference_model_layer_call_and_return_conditional_losses_12136

inputs-
encoder3d_11974:
encoder3d_11976:-
encoder3d_11978: 
encoder3d_11980: -
encoder3d_11982:  
encoder3d_11984: -
encoder3d_11986: @
encoder3d_11988:@-
encoder3d_11990:@@
encoder3d_11992:@.
encoder3d_11994:@
encoder3d_11996:	/
encoder3d_11998:
encoder3d_12000:	+
time_distributed_1_12006:	@&
time_distributed_1_12008:@0
frame_position_embedding_12013:@/
transformer_layer_1_12045:@@+
transformer_layer_1_12047:@/
transformer_layer_1_12049:@@+
transformer_layer_1_12051:@/
transformer_layer_1_12053:@@+
transformer_layer_1_12055:@/
transformer_layer_1_12057:@@'
transformer_layer_1_12059:@,
transformer_layer_1_12061:	@(
transformer_layer_1_12063:	,
transformer_layer_1_12065:	@'
transformer_layer_1_12067:@/
transformer_layer_2_12099:@@+
transformer_layer_2_12101:@/
transformer_layer_2_12103:@@+
transformer_layer_2_12105:@/
transformer_layer_2_12107:@@+
transformer_layer_2_12109:@/
transformer_layer_2_12111:@@'
transformer_layer_2_12113:@,
transformer_layer_2_12115:	@(
transformer_layer_2_12117:	,
transformer_layer_2_12119:	@'
transformer_layer_2_12121:@!
dense_5_12125:

dense_5_12127:	 
dense_6_12130:	
dense_6_12132:
identityЂdense_5/StatefulPartitionedCallЂdense_6/StatefulPartitionedCallЂ!encoder3d/StatefulPartitionedCallЂ0frame_position_embedding/StatefulPartitionedCallЂ*time_distributed_1/StatefulPartitionedCallЂ+transformer_layer_1/StatefulPartitionedCallЂ+transformer_layer_2/StatefulPartitionedCallЩ
!encoder3d/StatefulPartitionedCallStatefulPartitionedCallinputsencoder3d_11974encoder3d_11976encoder3d_11978encoder3d_11980encoder3d_11982encoder3d_11984encoder3d_11986encoder3d_11988encoder3d_11990encoder3d_11992encoder3d_11994encoder3d_11996encoder3d_11998encoder3d_12000*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11973ѓ
 time_distributed/PartitionedCallPartitionedCall*encoder3d/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_time_distributed_layer_call_and_return_conditional_losses_11481w
time_distributed/Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"џџџџ         Г
time_distributed/ReshapeReshape*encoder3d/StatefulPartitionedCall:output:0'time_distributed/Reshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџП
*time_distributed_1/StatefulPartitionedCallStatefulPartitionedCall)time_distributed/PartitionedCall:output:0time_distributed_1_12006time_distributed_1_12008*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *V
fQRO
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_11566q
 time_distributed_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   Ў
time_distributed_1/ReshapeReshape)time_distributed/PartitionedCall:output:0)time_distributed_1/Reshape/shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџ
0frame_position_embedding/StatefulPartitionedCallStatefulPartitionedCall3time_distributed_1/StatefulPartitionedCall:output:0frame_position_embedding_12013*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11291Я
+transformer_layer_1/StatefulPartitionedCallStatefulPartitionedCall9frame_position_embedding/StatefulPartitionedCall:output:0transformer_layer_1_12045transformer_layer_1_12047transformer_layer_1_12049transformer_layer_1_12051transformer_layer_1_12053transformer_layer_1_12055transformer_layer_1_12057transformer_layer_1_12059transformer_layer_1_12061transformer_layer_1_12063transformer_layer_1_12065transformer_layer_1_12067*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_12044Ъ
+transformer_layer_2/StatefulPartitionedCallStatefulPartitionedCall4transformer_layer_1/StatefulPartitionedCall:output:0transformer_layer_2_12099transformer_layer_2_12101transformer_layer_2_12103transformer_layer_2_12105transformer_layer_2_12107transformer_layer_2_12109transformer_layer_2_12111transformer_layer_2_12113transformer_layer_2_12115transformer_layer_2_12117transformer_layer_2_12119transformer_layer_2_12121*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_12098ы
flatten_1/PartitionedCallPartitionedCall4transformer_layer_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_flatten_1_layer_call_and_return_conditional_losses_11678
dense_5/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_5_12125dense_5_12127*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_11698
dense_6/StatefulPartitionedCallStatefulPartitionedCall(dense_5/StatefulPartitionedCall:output:0dense_6_12130dense_6_12132*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_6_layer_call_and_return_conditional_losses_11715w
IdentityIdentity(dense_6/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџъ
NoOpNoOp ^dense_5/StatefulPartitionedCall ^dense_6/StatefulPartitionedCall"^encoder3d/StatefulPartitionedCall1^frame_position_embedding/StatefulPartitionedCall+^time_distributed_1/StatefulPartitionedCall,^transformer_layer_1/StatefulPartitionedCall,^transformer_layer_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes{
y:џџџџџџџџџ  : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2B
dense_6/StatefulPartitionedCalldense_6/StatefulPartitionedCall2F
!encoder3d/StatefulPartitionedCall!encoder3d/StatefulPartitionedCall2d
0frame_position_embedding/StatefulPartitionedCall0frame_position_embedding/StatefulPartitionedCall2X
*time_distributed_1/StatefulPartitionedCall*time_distributed_1/StatefulPartitionedCall2Z
+transformer_layer_1/StatefulPartitionedCall+transformer_layer_1/StatefulPartitionedCall2Z
+transformer_layer_2/StatefulPartitionedCall+transformer_layer_2/StatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
ч
ч
,__inference_sequential_1_layer_call_fn_14645

inputs%
unknown: @
	unknown_0:@'
	unknown_1:@@
	unknown_2:@
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *P
fKRI
G__inference_sequential_1_layer_call_and_return_conditional_losses_13975{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ 
 
_user_specified_nameinputs
е

'__inference_dense_1_layer_call_fn_14752

inputs
unknown:	@
	unknown_0:	
identityЂStatefulPartitionedCallп
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_13306t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ@: : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
ю
ь
,__inference_sequential_2_layer_call_fn_14694

inputs&
unknown:@
	unknown_0:	)
	unknown_1:
	unknown_2:	
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *P
fKRI
G__inference_sequential_2_layer_call_and_return_conditional_losses_14069|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ@
 
_user_specified_nameinputs
ь
Ф
G__inference_sequential_1_layer_call_and_return_conditional_losses_13975

inputs,
conv3d_2_13964: @
conv3d_2_13966:@,
conv3d_3_13969:@@
conv3d_3_13971:@
identityЂ conv3d_2/StatefulPartitionedCallЂ conv3d_3/StatefulPartitionedCallќ
 conv3d_2/StatefulPartitionedCallStatefulPartitionedCallinputsconv3d_2_13964conv3d_2_13966*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_2_layer_call_and_return_conditional_losses_13891
 conv3d_3/StatefulPartitionedCallStatefulPartitionedCall)conv3d_2/StatefulPartitionedCall:output:0conv3d_3_13969conv3d_3_13971*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_3_layer_call_and_return_conditional_losses_13908
IdentityIdentity)conv3d_3/StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@
NoOpNoOp!^conv3d_2/StatefulPartitionedCall!^conv3d_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ : : : : 2D
 conv3d_2/StatefulPartitionedCall conv3d_2/StatefulPartitionedCall2D
 conv3d_3/StatefulPartitionedCall conv3d_3/StatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ 
 
_user_specified_nameinputs

Ѓ
(__inference_conv3d_4_layer_call_fn_15004

inputs&
unknown:@
	unknown_0:	
identityЂStatefulPartitionedCallш
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_4_layer_call_and_return_conditional_losses_14045|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ@: : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ@
 
_user_specified_nameinputs
Х
р
E__inference_sequential_layer_call_and_return_conditional_losses_14619

inputsC
%conv3d_conv3d_readvariableop_resource: 4
&conv3d_biasadd_readvariableop_resource: E
'conv3d_1_conv3d_readvariableop_resource:  6
(conv3d_1_biasadd_readvariableop_resource: 
identityЂconv3d/BiasAdd/ReadVariableOpЂconv3d/Conv3D/ReadVariableOpЂconv3d_1/BiasAdd/ReadVariableOpЂconv3d_1/Conv3D/ReadVariableOp
conv3d/Conv3D/ReadVariableOpReadVariableOp%conv3d_conv3d_readvariableop_resource**
_output_shapes
: *
dtype0Ќ
conv3d/Conv3DConv3Dinputs$conv3d/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	

conv3d/BiasAdd/ReadVariableOpReadVariableOp&conv3d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0
conv3d/BiasAddBiasAddconv3d/Conv3D:output:0%conv3d/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   j
conv3d/ReluReluconv3d/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   
conv3d_1/Conv3D/ReadVariableOpReadVariableOp'conv3d_1_conv3d_readvariableop_resource**
_output_shapes
:  *
dtype0У
conv3d_1/Conv3DConv3Dconv3d/Relu:activations:0&conv3d_1/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	

conv3d_1/BiasAdd/ReadVariableOpReadVariableOp(conv3d_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0
conv3d_1/BiasAddBiasAddconv3d_1/Conv3D:output:0'conv3d_1/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   n
conv3d_1/ReluReluconv3d_1/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   v
IdentityIdentityconv3d_1/Relu:activations:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   Ш
NoOpNoOp^conv3d/BiasAdd/ReadVariableOp^conv3d/Conv3D/ReadVariableOp ^conv3d_1/BiasAdd/ReadVariableOp^conv3d_1/Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ  : : : : 2>
conv3d/BiasAdd/ReadVariableOpconv3d/BiasAdd/ReadVariableOp2<
conv3d/Conv3D/ReadVariableOpconv3d/Conv3D/ReadVariableOp2B
conv3d_1/BiasAdd/ReadVariableOpconv3d_1/BiasAdd/ReadVariableOp2@
conv3d_1/Conv3D/ReadVariableOpconv3d_1/Conv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
е
d
H__inference_max_pooling3d_layer_call_and_return_conditional_losses_13114

inputs
identityН
	MaxPool3D	MaxPool3Dinputs*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ*
ksize	
*
paddingSAME*
strides	

IdentityIdentityMaxPool3D:output:0*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ: {
W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
Ъ
Д
'__inference_encoder3d_layer_call_fn_837

inputs%
unknown:
	unknown_0:'
	unknown_1: 
	unknown_2: '
	unknown_3:  
	unknown_4: '
	unknown_5: @
	unknown_6:@'
	unknown_7:@@
	unknown_8:@(
	unknown_9:@

unknown_10:	*

unknown_11:

unknown_12:	
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_encoder3d_layer_call_and_return_conditional_losses_818`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 |
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:џџџџџџџџџ  : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
Ќ
Э
2__inference_transformer_layer_2_layer_call_fn_1542

inputs
unknown:@@
	unknown_0:@
	unknown_1:@@
	unknown_2:@
	unknown_3:@@
	unknown_4:@
	unknown_5:@@
	unknown_6:@
	unknown_7:	@
	unknown_8:	
	unknown_9:	@

unknown_10:@
identityЂStatefulPartitionedCallь
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *V
fQRO
M__inference_transformer_layer_2_layer_call_and_return_conditional_losses_1525`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
љo
є
B__inference_encoder3d_layer_call_and_return_conditional_losses_818

inputsW
9spatial_attention_conv3d_6_conv3d_readvariableop_resource:H
:spatial_attention_conv3d_6_biasadd_readvariableop_resource:[
=conv2_plus1d_sequential_conv3d_conv3d_readvariableop_resource: L
>conv2_plus1d_sequential_conv3d_biasadd_readvariableop_resource: ]
?conv2_plus1d_sequential_conv3d_1_conv3d_readvariableop_resource:  N
@conv2_plus1d_sequential_conv3d_1_biasadd_readvariableop_resource: a
Cconv2_plus1d_1_sequential_1_conv3d_2_conv3d_readvariableop_resource: @R
Dconv2_plus1d_1_sequential_1_conv3d_2_biasadd_readvariableop_resource:@a
Cconv2_plus1d_1_sequential_1_conv3d_3_conv3d_readvariableop_resource:@@R
Dconv2_plus1d_1_sequential_1_conv3d_3_biasadd_readvariableop_resource:@b
Cconv2_plus1d_2_sequential_2_conv3d_4_conv3d_readvariableop_resource:@S
Dconv2_plus1d_2_sequential_2_conv3d_4_biasadd_readvariableop_resource:	c
Cconv2_plus1d_2_sequential_2_conv3d_5_conv3d_readvariableop_resource:S
Dconv2_plus1d_2_sequential_2_conv3d_5_biasadd_readvariableop_resource:	
identityЂ5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOpЂ4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOpЂ7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOpЂ6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOpЂ;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOpЂ:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOpЂ;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOpЂ:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOpЂ;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOpЂ:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOpЂ;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOpЂ:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOpЂ1spatial_attention/conv3d_6/BiasAdd/ReadVariableOpЂ0spatial_attention/conv3d_6/Conv3D/ReadVariableOpЖ
0spatial_attention/conv3d_6/Conv3D/ReadVariableOpReadVariableOp9spatial_attention_conv3d_6_conv3d_readvariableop_resource**
_output_shapes
:*
dtype0д
!spatial_attention/conv3d_6/Conv3DConv3Dinputs8spatial_attention/conv3d_6/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ  *
paddingSAME*
strides	
Ј
1spatial_attention/conv3d_6/BiasAdd/ReadVariableOpReadVariableOp:spatial_attention_conv3d_6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0в
"spatial_attention/conv3d_6/BiasAddBiasAdd*spatial_attention/conv3d_6/Conv3D:output:09spatial_attention/conv3d_6/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ  j
%spatial_attention/conv3d_6/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Х
#spatial_attention/conv3d_6/Gelu/mulMul.spatial_attention/conv3d_6/Gelu/mul/x:output:0+spatial_attention/conv3d_6/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ  k
&spatial_attention/conv3d_6/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?Ю
'spatial_attention/conv3d_6/Gelu/truedivRealDiv+spatial_attention/conv3d_6/BiasAdd:output:0/spatial_attention/conv3d_6/Gelu/Cast/x:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ  
#spatial_attention/conv3d_6/Gelu/ErfErf+spatial_attention/conv3d_6/Gelu/truediv:z:0*
T0*3
_output_shapes!
:џџџџџџџџџ  j
%spatial_attention/conv3d_6/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?У
#spatial_attention/conv3d_6/Gelu/addAddV2.spatial_attention/conv3d_6/Gelu/add/x:output:0'spatial_attention/conv3d_6/Gelu/Erf:y:0*
T0*3
_output_shapes!
:џџџџџџџџџ  М
%spatial_attention/conv3d_6/Gelu/mul_1Mul'spatial_attention/conv3d_6/Gelu/mul:z:0'spatial_attention/conv3d_6/Gelu/add:z:0*
T0*3
_output_shapes!
:џџџџџџџџџ  
spatial_attention/multiply/mulMulinputs)spatial_attention/conv3d_6/Gelu/mul_1:z:0*
T0*3
_output_shapes!
:џџџџџџџџџ  О
4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOpReadVariableOp=conv2_plus1d_sequential_conv3d_conv3d_readvariableop_resource**
_output_shapes
: *
dtype0ј
%conv2_plus1d/sequential/conv3d/Conv3DConv3D"spatial_attention/multiply/mul:z:0<conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	
А
5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOpReadVariableOp>conv2_plus1d_sequential_conv3d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0о
&conv2_plus1d/sequential/conv3d/BiasAddBiasAdd.conv2_plus1d/sequential/conv3d/Conv3D:output:0=conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   
#conv2_plus1d/sequential/conv3d/ReluRelu/conv2_plus1d/sequential/conv3d/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   Т
6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOpReadVariableOp?conv2_plus1d_sequential_conv3d_1_conv3d_readvariableop_resource**
_output_shapes
:  *
dtype0
'conv2_plus1d/sequential/conv3d_1/Conv3DConv3D1conv2_plus1d/sequential/conv3d/Relu:activations:0>conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	
Д
7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOpReadVariableOp@conv2_plus1d_sequential_conv3d_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ф
(conv2_plus1d/sequential/conv3d_1/BiasAddBiasAdd0conv2_plus1d/sequential/conv3d_1/Conv3D:output:0?conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   
%conv2_plus1d/sequential/conv3d_1/ReluRelu1conv2_plus1d/sequential/conv3d_1/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   д
max_pooling3d/MaxPool3D	MaxPool3D3conv2_plus1d/sequential/conv3d_1/Relu:activations:0*
T0*3
_output_shapes!
:џџџџџџџџџ *
ksize	
*
paddingSAME*
strides	
Ъ
:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_1_sequential_1_conv3d_2_conv3d_readvariableop_resource**
_output_shapes
: @*
dtype0
+conv2_plus1d_1/sequential_1/conv3d_2/Conv3DConv3D max_pooling3d/MaxPool3D:output:0Bconv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	
М
;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_1_sequential_1_conv3d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0№
,conv2_plus1d_1/sequential_1/conv3d_2/BiasAddBiasAdd4conv2_plus1d_1/sequential_1/conv3d_2/Conv3D:output:0Cconv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@І
)conv2_plus1d_1/sequential_1/conv3d_2/ReluRelu5conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@Ъ
:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_1_sequential_1_conv3d_3_conv3d_readvariableop_resource**
_output_shapes
:@@*
dtype0
+conv2_plus1d_1/sequential_1/conv3d_3/Conv3DConv3D7conv2_plus1d_1/sequential_1/conv3d_2/Relu:activations:0Bconv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	
М
;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_1_sequential_1_conv3d_3_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0№
,conv2_plus1d_1/sequential_1/conv3d_3/BiasAddBiasAdd4conv2_plus1d_1/sequential_1/conv3d_3/Conv3D:output:0Cconv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@І
)conv2_plus1d_1/sequential_1/conv3d_3/ReluRelu5conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@к
max_pooling3d_1/MaxPool3D	MaxPool3D7conv2_plus1d_1/sequential_1/conv3d_3/Relu:activations:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
ksize	
*
paddingSAME*
strides	
Ы
:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_2_sequential_2_conv3d_4_conv3d_readvariableop_resource*+
_output_shapes
:@*
dtype0
+conv2_plus1d_2/sequential_2/conv3d_4/Conv3DConv3D"max_pooling3d_1/MaxPool3D:output:0Bconv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	
Н
;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_2_sequential_2_conv3d_4_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0ё
,conv2_plus1d_2/sequential_2/conv3d_4/BiasAddBiasAdd4conv2_plus1d_2/sequential_2/conv3d_4/Conv3D:output:0Cconv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџЇ
)conv2_plus1d_2/sequential_2/conv3d_4/ReluRelu5conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџЬ
:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_2_sequential_2_conv3d_5_conv3d_readvariableop_resource*,
_output_shapes
:*
dtype0
+conv2_plus1d_2/sequential_2/conv3d_5/Conv3DConv3D7conv2_plus1d_2/sequential_2/conv3d_4/Relu:activations:0Bconv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	
Н
;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_2_sequential_2_conv3d_5_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0ё
,conv2_plus1d_2/sequential_2/conv3d_5/BiasAddBiasAdd4conv2_plus1d_2/sequential_2/conv3d_5/Conv3D:output:0Cconv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџЇ
)conv2_plus1d_2/sequential_2/conv3d_5/ReluRelu5conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџл
max_pooling3d_2/MaxPool3D	MaxPool3D7conv2_plus1d_2/sequential_2/conv3d_5/Relu:activations:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
ksize	
*
paddingSAME*
strides	
ћ
NoOpNoOp6^conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp5^conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp8^conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp7^conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp<^conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp;^conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp<^conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp;^conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp<^conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp;^conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp<^conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp;^conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp2^spatial_attention/conv3d_6/BiasAdd/ReadVariableOp1^spatial_attention/conv3d_6/Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ~
IdentityIdentity"max_pooling3d_2/MaxPool3D:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:џџџџџџџџџ  : : : : : : : : : : : : : : 2n
5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp2l
4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp2r
7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp2p
6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp2z
;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp2x
:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp2z
;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp2x
:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp2z
;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp2x
:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp2z
;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp2x
:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp2f
1spatial_attention/conv3d_6/BiasAdd/ReadVariableOp1spatial_attention/conv3d_6/BiasAdd/ReadVariableOp2d
0spatial_attention/conv3d_6/Conv3D/ReadVariableOp0spatial_attention/conv3d_6/Conv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
и"
ћ
B__inference_dense_1_layer_call_and_return_conditional_losses_13306

inputs4
!tensordot_readvariableop_resource:	@.
biasadd_readvariableop_resource:	
identityЂBiasAdd/ReadVariableOpЂTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : Л
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : П
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:y
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџ\
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ї
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџO

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?m
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџP
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?v
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџX
Gelu/ErfErfGelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџO

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?k
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџd

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџb
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*,
_output_shapes
:џџџџџџџџџz
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
Ц
^
B__inference_flatten_layer_call_and_return_conditional_losses_14222

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:џџџџџџџџџY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:џџџџџџџџџ:X T
0
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
зг
хm
!__inference__traced_restore_15932
file_prefix3
assignvariableop_dense_5_kernel:
.
assignvariableop_1_dense_5_bias:	4
!assignvariableop_2_dense_6_kernel:	-
assignvariableop_3_dense_6_bias:\
>assignvariableop_4_encoder3d_spatial_attention_conv3d_6_kernel:J
<assignvariableop_5_encoder3d_spatial_attention_conv3d_6_bias:>
 assignvariableop_6_conv3d_kernel: ,
assignvariableop_7_conv3d_bias: @
"assignvariableop_8_conv3d_1_kernel:  .
 assignvariableop_9_conv3d_1_bias: A
#assignvariableop_10_conv3d_2_kernel: @/
!assignvariableop_11_conv3d_2_bias:@A
#assignvariableop_12_conv3d_3_kernel:@@/
!assignvariableop_13_conv3d_3_bias:@B
#assignvariableop_14_conv3d_4_kernel:@0
!assignvariableop_15_conv3d_4_bias:	C
#assignvariableop_16_conv3d_5_kernel:0
!assignvariableop_17_conv3d_5_bias:	@
-assignvariableop_18_time_distributed_1_kernel:	@9
+assignvariableop_19_time_distributed_1_bias:@S
Aassignvariableop_20_frame_position_embedding_embedding_embeddings:@_
Iassignvariableop_21_transformer_layer_1_multi_head_attention_query_kernel:@@Y
Gassignvariableop_22_transformer_layer_1_multi_head_attention_query_bias:@]
Gassignvariableop_23_transformer_layer_1_multi_head_attention_key_kernel:@@W
Eassignvariableop_24_transformer_layer_1_multi_head_attention_key_bias:@_
Iassignvariableop_25_transformer_layer_1_multi_head_attention_value_kernel:@@Y
Gassignvariableop_26_transformer_layer_1_multi_head_attention_value_bias:@j
Tassignvariableop_27_transformer_layer_1_multi_head_attention_attention_output_kernel:@@`
Rassignvariableop_28_transformer_layer_1_multi_head_attention_attention_output_bias:@5
"assignvariableop_29_dense_1_kernel:	@/
 assignvariableop_30_dense_1_bias:	5
"assignvariableop_31_dense_2_kernel:	@.
 assignvariableop_32_dense_2_bias:@a
Kassignvariableop_33_transformer_layer_2_multi_head_attention_1_query_kernel:@@[
Iassignvariableop_34_transformer_layer_2_multi_head_attention_1_query_bias:@_
Iassignvariableop_35_transformer_layer_2_multi_head_attention_1_key_kernel:@@Y
Gassignvariableop_36_transformer_layer_2_multi_head_attention_1_key_bias:@a
Kassignvariableop_37_transformer_layer_2_multi_head_attention_1_value_kernel:@@[
Iassignvariableop_38_transformer_layer_2_multi_head_attention_1_value_bias:@l
Vassignvariableop_39_transformer_layer_2_multi_head_attention_1_attention_output_kernel:@@b
Tassignvariableop_40_transformer_layer_2_multi_head_attention_1_attention_output_bias:@5
"assignvariableop_41_dense_3_kernel:	@/
 assignvariableop_42_dense_3_bias:	5
"assignvariableop_43_dense_4_kernel:	@.
 assignvariableop_44_dense_4_bias:@'
assignvariableop_45_adam_iter:	 )
assignvariableop_46_adam_beta_1: )
assignvariableop_47_adam_beta_2: (
assignvariableop_48_adam_decay: 0
&assignvariableop_49_adam_learning_rate: %
assignvariableop_50_total_1: %
assignvariableop_51_count_1: #
assignvariableop_52_total: #
assignvariableop_53_count: =
)assignvariableop_54_adam_dense_5_kernel_m:
6
'assignvariableop_55_adam_dense_5_bias_m:	<
)assignvariableop_56_adam_dense_6_kernel_m:	5
'assignvariableop_57_adam_dense_6_bias_m:d
Fassignvariableop_58_adam_encoder3d_spatial_attention_conv3d_6_kernel_m:R
Dassignvariableop_59_adam_encoder3d_spatial_attention_conv3d_6_bias_m:F
(assignvariableop_60_adam_conv3d_kernel_m: 4
&assignvariableop_61_adam_conv3d_bias_m: H
*assignvariableop_62_adam_conv3d_1_kernel_m:  6
(assignvariableop_63_adam_conv3d_1_bias_m: H
*assignvariableop_64_adam_conv3d_2_kernel_m: @6
(assignvariableop_65_adam_conv3d_2_bias_m:@H
*assignvariableop_66_adam_conv3d_3_kernel_m:@@6
(assignvariableop_67_adam_conv3d_3_bias_m:@I
*assignvariableop_68_adam_conv3d_4_kernel_m:@7
(assignvariableop_69_adam_conv3d_4_bias_m:	J
*assignvariableop_70_adam_conv3d_5_kernel_m:7
(assignvariableop_71_adam_conv3d_5_bias_m:	G
4assignvariableop_72_adam_time_distributed_1_kernel_m:	@@
2assignvariableop_73_adam_time_distributed_1_bias_m:@Z
Hassignvariableop_74_adam_frame_position_embedding_embedding_embeddings_m:@f
Passignvariableop_75_adam_transformer_layer_1_multi_head_attention_query_kernel_m:@@`
Nassignvariableop_76_adam_transformer_layer_1_multi_head_attention_query_bias_m:@d
Nassignvariableop_77_adam_transformer_layer_1_multi_head_attention_key_kernel_m:@@^
Lassignvariableop_78_adam_transformer_layer_1_multi_head_attention_key_bias_m:@f
Passignvariableop_79_adam_transformer_layer_1_multi_head_attention_value_kernel_m:@@`
Nassignvariableop_80_adam_transformer_layer_1_multi_head_attention_value_bias_m:@q
[assignvariableop_81_adam_transformer_layer_1_multi_head_attention_attention_output_kernel_m:@@g
Yassignvariableop_82_adam_transformer_layer_1_multi_head_attention_attention_output_bias_m:@<
)assignvariableop_83_adam_dense_1_kernel_m:	@6
'assignvariableop_84_adam_dense_1_bias_m:	<
)assignvariableop_85_adam_dense_2_kernel_m:	@5
'assignvariableop_86_adam_dense_2_bias_m:@h
Rassignvariableop_87_adam_transformer_layer_2_multi_head_attention_1_query_kernel_m:@@b
Passignvariableop_88_adam_transformer_layer_2_multi_head_attention_1_query_bias_m:@f
Passignvariableop_89_adam_transformer_layer_2_multi_head_attention_1_key_kernel_m:@@`
Nassignvariableop_90_adam_transformer_layer_2_multi_head_attention_1_key_bias_m:@h
Rassignvariableop_91_adam_transformer_layer_2_multi_head_attention_1_value_kernel_m:@@b
Passignvariableop_92_adam_transformer_layer_2_multi_head_attention_1_value_bias_m:@s
]assignvariableop_93_adam_transformer_layer_2_multi_head_attention_1_attention_output_kernel_m:@@i
[assignvariableop_94_adam_transformer_layer_2_multi_head_attention_1_attention_output_bias_m:@<
)assignvariableop_95_adam_dense_3_kernel_m:	@6
'assignvariableop_96_adam_dense_3_bias_m:	<
)assignvariableop_97_adam_dense_4_kernel_m:	@5
'assignvariableop_98_adam_dense_4_bias_m:@=
)assignvariableop_99_adam_dense_5_kernel_v:
7
(assignvariableop_100_adam_dense_5_bias_v:	=
*assignvariableop_101_adam_dense_6_kernel_v:	6
(assignvariableop_102_adam_dense_6_bias_v:e
Gassignvariableop_103_adam_encoder3d_spatial_attention_conv3d_6_kernel_v:S
Eassignvariableop_104_adam_encoder3d_spatial_attention_conv3d_6_bias_v:G
)assignvariableop_105_adam_conv3d_kernel_v: 5
'assignvariableop_106_adam_conv3d_bias_v: I
+assignvariableop_107_adam_conv3d_1_kernel_v:  7
)assignvariableop_108_adam_conv3d_1_bias_v: I
+assignvariableop_109_adam_conv3d_2_kernel_v: @7
)assignvariableop_110_adam_conv3d_2_bias_v:@I
+assignvariableop_111_adam_conv3d_3_kernel_v:@@7
)assignvariableop_112_adam_conv3d_3_bias_v:@J
+assignvariableop_113_adam_conv3d_4_kernel_v:@8
)assignvariableop_114_adam_conv3d_4_bias_v:	K
+assignvariableop_115_adam_conv3d_5_kernel_v:8
)assignvariableop_116_adam_conv3d_5_bias_v:	H
5assignvariableop_117_adam_time_distributed_1_kernel_v:	@A
3assignvariableop_118_adam_time_distributed_1_bias_v:@[
Iassignvariableop_119_adam_frame_position_embedding_embedding_embeddings_v:@g
Qassignvariableop_120_adam_transformer_layer_1_multi_head_attention_query_kernel_v:@@a
Oassignvariableop_121_adam_transformer_layer_1_multi_head_attention_query_bias_v:@e
Oassignvariableop_122_adam_transformer_layer_1_multi_head_attention_key_kernel_v:@@_
Massignvariableop_123_adam_transformer_layer_1_multi_head_attention_key_bias_v:@g
Qassignvariableop_124_adam_transformer_layer_1_multi_head_attention_value_kernel_v:@@a
Oassignvariableop_125_adam_transformer_layer_1_multi_head_attention_value_bias_v:@r
\assignvariableop_126_adam_transformer_layer_1_multi_head_attention_attention_output_kernel_v:@@h
Zassignvariableop_127_adam_transformer_layer_1_multi_head_attention_attention_output_bias_v:@=
*assignvariableop_128_adam_dense_1_kernel_v:	@7
(assignvariableop_129_adam_dense_1_bias_v:	=
*assignvariableop_130_adam_dense_2_kernel_v:	@6
(assignvariableop_131_adam_dense_2_bias_v:@i
Sassignvariableop_132_adam_transformer_layer_2_multi_head_attention_1_query_kernel_v:@@c
Qassignvariableop_133_adam_transformer_layer_2_multi_head_attention_1_query_bias_v:@g
Qassignvariableop_134_adam_transformer_layer_2_multi_head_attention_1_key_kernel_v:@@a
Oassignvariableop_135_adam_transformer_layer_2_multi_head_attention_1_key_bias_v:@i
Sassignvariableop_136_adam_transformer_layer_2_multi_head_attention_1_value_kernel_v:@@c
Qassignvariableop_137_adam_transformer_layer_2_multi_head_attention_1_value_bias_v:@t
^assignvariableop_138_adam_transformer_layer_2_multi_head_attention_1_attention_output_kernel_v:@@j
\assignvariableop_139_adam_transformer_layer_2_multi_head_attention_1_attention_output_bias_v:@=
*assignvariableop_140_adam_dense_3_kernel_v:	@7
(assignvariableop_141_adam_dense_3_bias_v:	=
*assignvariableop_142_adam_dense_4_kernel_v:	@6
(assignvariableop_143_adam_dense_4_bias_v:@
identity_145ЂAssignVariableOpЂAssignVariableOp_1ЂAssignVariableOp_10ЂAssignVariableOp_100ЂAssignVariableOp_101ЂAssignVariableOp_102ЂAssignVariableOp_103ЂAssignVariableOp_104ЂAssignVariableOp_105ЂAssignVariableOp_106ЂAssignVariableOp_107ЂAssignVariableOp_108ЂAssignVariableOp_109ЂAssignVariableOp_11ЂAssignVariableOp_110ЂAssignVariableOp_111ЂAssignVariableOp_112ЂAssignVariableOp_113ЂAssignVariableOp_114ЂAssignVariableOp_115ЂAssignVariableOp_116ЂAssignVariableOp_117ЂAssignVariableOp_118ЂAssignVariableOp_119ЂAssignVariableOp_12ЂAssignVariableOp_120ЂAssignVariableOp_121ЂAssignVariableOp_122ЂAssignVariableOp_123ЂAssignVariableOp_124ЂAssignVariableOp_125ЂAssignVariableOp_126ЂAssignVariableOp_127ЂAssignVariableOp_128ЂAssignVariableOp_129ЂAssignVariableOp_13ЂAssignVariableOp_130ЂAssignVariableOp_131ЂAssignVariableOp_132ЂAssignVariableOp_133ЂAssignVariableOp_134ЂAssignVariableOp_135ЂAssignVariableOp_136ЂAssignVariableOp_137ЂAssignVariableOp_138ЂAssignVariableOp_139ЂAssignVariableOp_14ЂAssignVariableOp_140ЂAssignVariableOp_141ЂAssignVariableOp_142ЂAssignVariableOp_143ЂAssignVariableOp_15ЂAssignVariableOp_16ЂAssignVariableOp_17ЂAssignVariableOp_18ЂAssignVariableOp_19ЂAssignVariableOp_2ЂAssignVariableOp_20ЂAssignVariableOp_21ЂAssignVariableOp_22ЂAssignVariableOp_23ЂAssignVariableOp_24ЂAssignVariableOp_25ЂAssignVariableOp_26ЂAssignVariableOp_27ЂAssignVariableOp_28ЂAssignVariableOp_29ЂAssignVariableOp_3ЂAssignVariableOp_30ЂAssignVariableOp_31ЂAssignVariableOp_32ЂAssignVariableOp_33ЂAssignVariableOp_34ЂAssignVariableOp_35ЂAssignVariableOp_36ЂAssignVariableOp_37ЂAssignVariableOp_38ЂAssignVariableOp_39ЂAssignVariableOp_4ЂAssignVariableOp_40ЂAssignVariableOp_41ЂAssignVariableOp_42ЂAssignVariableOp_43ЂAssignVariableOp_44ЂAssignVariableOp_45ЂAssignVariableOp_46ЂAssignVariableOp_47ЂAssignVariableOp_48ЂAssignVariableOp_49ЂAssignVariableOp_5ЂAssignVariableOp_50ЂAssignVariableOp_51ЂAssignVariableOp_52ЂAssignVariableOp_53ЂAssignVariableOp_54ЂAssignVariableOp_55ЂAssignVariableOp_56ЂAssignVariableOp_57ЂAssignVariableOp_58ЂAssignVariableOp_59ЂAssignVariableOp_6ЂAssignVariableOp_60ЂAssignVariableOp_61ЂAssignVariableOp_62ЂAssignVariableOp_63ЂAssignVariableOp_64ЂAssignVariableOp_65ЂAssignVariableOp_66ЂAssignVariableOp_67ЂAssignVariableOp_68ЂAssignVariableOp_69ЂAssignVariableOp_7ЂAssignVariableOp_70ЂAssignVariableOp_71ЂAssignVariableOp_72ЂAssignVariableOp_73ЂAssignVariableOp_74ЂAssignVariableOp_75ЂAssignVariableOp_76ЂAssignVariableOp_77ЂAssignVariableOp_78ЂAssignVariableOp_79ЂAssignVariableOp_8ЂAssignVariableOp_80ЂAssignVariableOp_81ЂAssignVariableOp_82ЂAssignVariableOp_83ЂAssignVariableOp_84ЂAssignVariableOp_85ЂAssignVariableOp_86ЂAssignVariableOp_87ЂAssignVariableOp_88ЂAssignVariableOp_89ЂAssignVariableOp_9ЂAssignVariableOp_90ЂAssignVariableOp_91ЂAssignVariableOp_92ЂAssignVariableOp_93ЂAssignVariableOp_94ЂAssignVariableOp_95ЂAssignVariableOp_96ЂAssignVariableOp_97ЂAssignVariableOp_98ЂAssignVariableOp_99ЭD
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes	
:*
dtype0*ђC
valueшCBхCB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB'variables/10/.ATTRIBUTES/VARIABLE_VALUEB'variables/11/.ATTRIBUTES/VARIABLE_VALUEB'variables/12/.ATTRIBUTES/VARIABLE_VALUEB'variables/13/.ATTRIBUTES/VARIABLE_VALUEB'variables/14/.ATTRIBUTES/VARIABLE_VALUEB'variables/15/.ATTRIBUTES/VARIABLE_VALUEB'variables/16/.ATTRIBUTES/VARIABLE_VALUEB'variables/17/.ATTRIBUTES/VARIABLE_VALUEB'variables/18/.ATTRIBUTES/VARIABLE_VALUEB'variables/19/.ATTRIBUTES/VARIABLE_VALUEB'variables/20/.ATTRIBUTES/VARIABLE_VALUEB'variables/21/.ATTRIBUTES/VARIABLE_VALUEB'variables/22/.ATTRIBUTES/VARIABLE_VALUEB'variables/23/.ATTRIBUTES/VARIABLE_VALUEB'variables/24/.ATTRIBUTES/VARIABLE_VALUEB'variables/25/.ATTRIBUTES/VARIABLE_VALUEB'variables/26/.ATTRIBUTES/VARIABLE_VALUEB'variables/27/.ATTRIBUTES/VARIABLE_VALUEB'variables/28/.ATTRIBUTES/VARIABLE_VALUEB'variables/29/.ATTRIBUTES/VARIABLE_VALUEB'variables/30/.ATTRIBUTES/VARIABLE_VALUEB'variables/31/.ATTRIBUTES/VARIABLE_VALUEB'variables/32/.ATTRIBUTES/VARIABLE_VALUEB'variables/33/.ATTRIBUTES/VARIABLE_VALUEB'variables/34/.ATTRIBUTES/VARIABLE_VALUEB'variables/35/.ATTRIBUTES/VARIABLE_VALUEB'variables/36/.ATTRIBUTES/VARIABLE_VALUEB'variables/37/.ATTRIBUTES/VARIABLE_VALUEB'variables/38/.ATTRIBUTES/VARIABLE_VALUEB'variables/39/.ATTRIBUTES/VARIABLE_VALUEB'variables/40/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/7/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/8/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/9/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/10/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/11/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/12/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/13/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/14/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/15/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/16/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/17/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/18/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/19/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/20/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/21/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/22/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/23/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/24/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/25/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/26/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/27/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/28/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/29/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/30/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/31/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/32/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/33/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/34/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/35/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/36/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/37/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/38/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/39/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/40/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/7/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/8/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/9/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/10/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/11/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/12/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/13/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/14/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/15/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/16/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/17/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/18/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/19/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/20/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/21/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/22/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/23/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/24/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/25/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/26/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/27/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/28/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/29/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/30/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/31/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/32/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/33/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/34/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/35/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/36/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/37/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/38/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/39/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/40/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes	
:*
dtype0*И
valueЎBЋB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B њ
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*к
_output_shapesЧ
Ф:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*Ђ
dtypes
2	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOpAssignVariableOpassignvariableop_dense_5_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_1AssignVariableOpassignvariableop_1_dense_5_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_2AssignVariableOp!assignvariableop_2_dense_6_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_3AssignVariableOpassignvariableop_3_dense_6_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:­
AssignVariableOp_4AssignVariableOp>assignvariableop_4_encoder3d_spatial_attention_conv3d_6_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:Ћ
AssignVariableOp_5AssignVariableOp<assignvariableop_5_encoder3d_spatial_attention_conv3d_6_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_6AssignVariableOp assignvariableop_6_conv3d_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_7AssignVariableOpassignvariableop_7_conv3d_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_8AssignVariableOp"assignvariableop_8_conv3d_1_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_9AssignVariableOp assignvariableop_9_conv3d_1_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_10AssignVariableOp#assignvariableop_10_conv3d_2_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_11AssignVariableOp!assignvariableop_11_conv3d_2_biasIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_12AssignVariableOp#assignvariableop_12_conv3d_3_kernelIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_13AssignVariableOp!assignvariableop_13_conv3d_3_biasIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_14AssignVariableOp#assignvariableop_14_conv3d_4_kernelIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_15AssignVariableOp!assignvariableop_15_conv3d_4_biasIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_16AssignVariableOp#assignvariableop_16_conv3d_5_kernelIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_17AssignVariableOp!assignvariableop_17_conv3d_5_biasIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_18AssignVariableOp-assignvariableop_18_time_distributed_1_kernelIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_19AssignVariableOp+assignvariableop_19_time_distributed_1_biasIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:В
AssignVariableOp_20AssignVariableOpAassignvariableop_20_frame_position_embedding_embedding_embeddingsIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_21AssignVariableOpIassignvariableop_21_transformer_layer_1_multi_head_attention_query_kernelIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:И
AssignVariableOp_22AssignVariableOpGassignvariableop_22_transformer_layer_1_multi_head_attention_query_biasIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:И
AssignVariableOp_23AssignVariableOpGassignvariableop_23_transformer_layer_1_multi_head_attention_key_kernelIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:Ж
AssignVariableOp_24AssignVariableOpEassignvariableop_24_transformer_layer_1_multi_head_attention_key_biasIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_25AssignVariableOpIassignvariableop_25_transformer_layer_1_multi_head_attention_value_kernelIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:И
AssignVariableOp_26AssignVariableOpGassignvariableop_26_transformer_layer_1_multi_head_attention_value_biasIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:Х
AssignVariableOp_27AssignVariableOpTassignvariableop_27_transformer_layer_1_multi_head_attention_attention_output_kernelIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:У
AssignVariableOp_28AssignVariableOpRassignvariableop_28_transformer_layer_1_multi_head_attention_attention_output_biasIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_29AssignVariableOp"assignvariableop_29_dense_1_kernelIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_30AssignVariableOp assignvariableop_30_dense_1_biasIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_31AssignVariableOp"assignvariableop_31_dense_2_kernelIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_32AssignVariableOp assignvariableop_32_dense_2_biasIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:М
AssignVariableOp_33AssignVariableOpKassignvariableop_33_transformer_layer_2_multi_head_attention_1_query_kernelIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_34AssignVariableOpIassignvariableop_34_transformer_layer_2_multi_head_attention_1_query_biasIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_35AssignVariableOpIassignvariableop_35_transformer_layer_2_multi_head_attention_1_key_kernelIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:И
AssignVariableOp_36AssignVariableOpGassignvariableop_36_transformer_layer_2_multi_head_attention_1_key_biasIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:М
AssignVariableOp_37AssignVariableOpKassignvariableop_37_transformer_layer_2_multi_head_attention_1_value_kernelIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_38AssignVariableOpIassignvariableop_38_transformer_layer_2_multi_head_attention_1_value_biasIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:Ч
AssignVariableOp_39AssignVariableOpVassignvariableop_39_transformer_layer_2_multi_head_attention_1_attention_output_kernelIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:Х
AssignVariableOp_40AssignVariableOpTassignvariableop_40_transformer_layer_2_multi_head_attention_1_attention_output_biasIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_41AssignVariableOp"assignvariableop_41_dense_3_kernelIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_42AssignVariableOp assignvariableop_42_dense_3_biasIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_43AssignVariableOp"assignvariableop_43_dense_4_kernelIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_44AssignVariableOp assignvariableop_44_dense_4_biasIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0	*
_output_shapes
:
AssignVariableOp_45AssignVariableOpassignvariableop_45_adam_iterIdentity_45:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_46AssignVariableOpassignvariableop_46_adam_beta_1Identity_46:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_47AssignVariableOpassignvariableop_47_adam_beta_2Identity_47:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_48AssignVariableOpassignvariableop_48_adam_decayIdentity_48:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_49IdentityRestoreV2:tensors:49"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_49AssignVariableOp&assignvariableop_49_adam_learning_rateIdentity_49:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_50IdentityRestoreV2:tensors:50"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_50AssignVariableOpassignvariableop_50_total_1Identity_50:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_51IdentityRestoreV2:tensors:51"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_51AssignVariableOpassignvariableop_51_count_1Identity_51:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_52IdentityRestoreV2:tensors:52"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_52AssignVariableOpassignvariableop_52_totalIdentity_52:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_53IdentityRestoreV2:tensors:53"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_53AssignVariableOpassignvariableop_53_countIdentity_53:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_54IdentityRestoreV2:tensors:54"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_54AssignVariableOp)assignvariableop_54_adam_dense_5_kernel_mIdentity_54:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_55IdentityRestoreV2:tensors:55"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_55AssignVariableOp'assignvariableop_55_adam_dense_5_bias_mIdentity_55:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_56IdentityRestoreV2:tensors:56"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_56AssignVariableOp)assignvariableop_56_adam_dense_6_kernel_mIdentity_56:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_57IdentityRestoreV2:tensors:57"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_57AssignVariableOp'assignvariableop_57_adam_dense_6_bias_mIdentity_57:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_58IdentityRestoreV2:tensors:58"/device:CPU:0*
T0*
_output_shapes
:З
AssignVariableOp_58AssignVariableOpFassignvariableop_58_adam_encoder3d_spatial_attention_conv3d_6_kernel_mIdentity_58:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_59IdentityRestoreV2:tensors:59"/device:CPU:0*
T0*
_output_shapes
:Е
AssignVariableOp_59AssignVariableOpDassignvariableop_59_adam_encoder3d_spatial_attention_conv3d_6_bias_mIdentity_59:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_60IdentityRestoreV2:tensors:60"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_60AssignVariableOp(assignvariableop_60_adam_conv3d_kernel_mIdentity_60:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_61IdentityRestoreV2:tensors:61"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_61AssignVariableOp&assignvariableop_61_adam_conv3d_bias_mIdentity_61:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_62IdentityRestoreV2:tensors:62"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_62AssignVariableOp*assignvariableop_62_adam_conv3d_1_kernel_mIdentity_62:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_63IdentityRestoreV2:tensors:63"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_63AssignVariableOp(assignvariableop_63_adam_conv3d_1_bias_mIdentity_63:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_64IdentityRestoreV2:tensors:64"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_64AssignVariableOp*assignvariableop_64_adam_conv3d_2_kernel_mIdentity_64:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_65IdentityRestoreV2:tensors:65"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_65AssignVariableOp(assignvariableop_65_adam_conv3d_2_bias_mIdentity_65:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_66IdentityRestoreV2:tensors:66"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_66AssignVariableOp*assignvariableop_66_adam_conv3d_3_kernel_mIdentity_66:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_67IdentityRestoreV2:tensors:67"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_67AssignVariableOp(assignvariableop_67_adam_conv3d_3_bias_mIdentity_67:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_68IdentityRestoreV2:tensors:68"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_68AssignVariableOp*assignvariableop_68_adam_conv3d_4_kernel_mIdentity_68:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_69IdentityRestoreV2:tensors:69"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_69AssignVariableOp(assignvariableop_69_adam_conv3d_4_bias_mIdentity_69:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_70IdentityRestoreV2:tensors:70"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_70AssignVariableOp*assignvariableop_70_adam_conv3d_5_kernel_mIdentity_70:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_71IdentityRestoreV2:tensors:71"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_71AssignVariableOp(assignvariableop_71_adam_conv3d_5_bias_mIdentity_71:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_72IdentityRestoreV2:tensors:72"/device:CPU:0*
T0*
_output_shapes
:Ѕ
AssignVariableOp_72AssignVariableOp4assignvariableop_72_adam_time_distributed_1_kernel_mIdentity_72:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_73IdentityRestoreV2:tensors:73"/device:CPU:0*
T0*
_output_shapes
:Ѓ
AssignVariableOp_73AssignVariableOp2assignvariableop_73_adam_time_distributed_1_bias_mIdentity_73:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_74IdentityRestoreV2:tensors:74"/device:CPU:0*
T0*
_output_shapes
:Й
AssignVariableOp_74AssignVariableOpHassignvariableop_74_adam_frame_position_embedding_embedding_embeddings_mIdentity_74:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_75IdentityRestoreV2:tensors:75"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_75AssignVariableOpPassignvariableop_75_adam_transformer_layer_1_multi_head_attention_query_kernel_mIdentity_75:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_76IdentityRestoreV2:tensors:76"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_76AssignVariableOpNassignvariableop_76_adam_transformer_layer_1_multi_head_attention_query_bias_mIdentity_76:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_77IdentityRestoreV2:tensors:77"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_77AssignVariableOpNassignvariableop_77_adam_transformer_layer_1_multi_head_attention_key_kernel_mIdentity_77:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_78IdentityRestoreV2:tensors:78"/device:CPU:0*
T0*
_output_shapes
:Н
AssignVariableOp_78AssignVariableOpLassignvariableop_78_adam_transformer_layer_1_multi_head_attention_key_bias_mIdentity_78:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_79IdentityRestoreV2:tensors:79"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_79AssignVariableOpPassignvariableop_79_adam_transformer_layer_1_multi_head_attention_value_kernel_mIdentity_79:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_80IdentityRestoreV2:tensors:80"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_80AssignVariableOpNassignvariableop_80_adam_transformer_layer_1_multi_head_attention_value_bias_mIdentity_80:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_81IdentityRestoreV2:tensors:81"/device:CPU:0*
T0*
_output_shapes
:Ь
AssignVariableOp_81AssignVariableOp[assignvariableop_81_adam_transformer_layer_1_multi_head_attention_attention_output_kernel_mIdentity_81:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_82IdentityRestoreV2:tensors:82"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_82AssignVariableOpYassignvariableop_82_adam_transformer_layer_1_multi_head_attention_attention_output_bias_mIdentity_82:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_83IdentityRestoreV2:tensors:83"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_83AssignVariableOp)assignvariableop_83_adam_dense_1_kernel_mIdentity_83:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_84IdentityRestoreV2:tensors:84"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_84AssignVariableOp'assignvariableop_84_adam_dense_1_bias_mIdentity_84:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_85IdentityRestoreV2:tensors:85"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_85AssignVariableOp)assignvariableop_85_adam_dense_2_kernel_mIdentity_85:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_86IdentityRestoreV2:tensors:86"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_86AssignVariableOp'assignvariableop_86_adam_dense_2_bias_mIdentity_86:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_87IdentityRestoreV2:tensors:87"/device:CPU:0*
T0*
_output_shapes
:У
AssignVariableOp_87AssignVariableOpRassignvariableop_87_adam_transformer_layer_2_multi_head_attention_1_query_kernel_mIdentity_87:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_88IdentityRestoreV2:tensors:88"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_88AssignVariableOpPassignvariableop_88_adam_transformer_layer_2_multi_head_attention_1_query_bias_mIdentity_88:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_89IdentityRestoreV2:tensors:89"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_89AssignVariableOpPassignvariableop_89_adam_transformer_layer_2_multi_head_attention_1_key_kernel_mIdentity_89:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_90IdentityRestoreV2:tensors:90"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_90AssignVariableOpNassignvariableop_90_adam_transformer_layer_2_multi_head_attention_1_key_bias_mIdentity_90:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_91IdentityRestoreV2:tensors:91"/device:CPU:0*
T0*
_output_shapes
:У
AssignVariableOp_91AssignVariableOpRassignvariableop_91_adam_transformer_layer_2_multi_head_attention_1_value_kernel_mIdentity_91:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_92IdentityRestoreV2:tensors:92"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_92AssignVariableOpPassignvariableop_92_adam_transformer_layer_2_multi_head_attention_1_value_bias_mIdentity_92:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_93IdentityRestoreV2:tensors:93"/device:CPU:0*
T0*
_output_shapes
:Ю
AssignVariableOp_93AssignVariableOp]assignvariableop_93_adam_transformer_layer_2_multi_head_attention_1_attention_output_kernel_mIdentity_93:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_94IdentityRestoreV2:tensors:94"/device:CPU:0*
T0*
_output_shapes
:Ь
AssignVariableOp_94AssignVariableOp[assignvariableop_94_adam_transformer_layer_2_multi_head_attention_1_attention_output_bias_mIdentity_94:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_95IdentityRestoreV2:tensors:95"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_95AssignVariableOp)assignvariableop_95_adam_dense_3_kernel_mIdentity_95:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_96IdentityRestoreV2:tensors:96"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_96AssignVariableOp'assignvariableop_96_adam_dense_3_bias_mIdentity_96:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_97IdentityRestoreV2:tensors:97"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_97AssignVariableOp)assignvariableop_97_adam_dense_4_kernel_mIdentity_97:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_98IdentityRestoreV2:tensors:98"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_98AssignVariableOp'assignvariableop_98_adam_dense_4_bias_mIdentity_98:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_99IdentityRestoreV2:tensors:99"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_99AssignVariableOp)assignvariableop_99_adam_dense_5_kernel_vIdentity_99:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_100IdentityRestoreV2:tensors:100"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_100AssignVariableOp(assignvariableop_100_adam_dense_5_bias_vIdentity_100:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_101IdentityRestoreV2:tensors:101"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_101AssignVariableOp*assignvariableop_101_adam_dense_6_kernel_vIdentity_101:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_102IdentityRestoreV2:tensors:102"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_102AssignVariableOp(assignvariableop_102_adam_dense_6_bias_vIdentity_102:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_103IdentityRestoreV2:tensors:103"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_103AssignVariableOpGassignvariableop_103_adam_encoder3d_spatial_attention_conv3d_6_kernel_vIdentity_103:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_104IdentityRestoreV2:tensors:104"/device:CPU:0*
T0*
_output_shapes
:И
AssignVariableOp_104AssignVariableOpEassignvariableop_104_adam_encoder3d_spatial_attention_conv3d_6_bias_vIdentity_104:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_105IdentityRestoreV2:tensors:105"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_105AssignVariableOp)assignvariableop_105_adam_conv3d_kernel_vIdentity_105:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_106IdentityRestoreV2:tensors:106"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_106AssignVariableOp'assignvariableop_106_adam_conv3d_bias_vIdentity_106:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_107IdentityRestoreV2:tensors:107"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_107AssignVariableOp+assignvariableop_107_adam_conv3d_1_kernel_vIdentity_107:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_108IdentityRestoreV2:tensors:108"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_108AssignVariableOp)assignvariableop_108_adam_conv3d_1_bias_vIdentity_108:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_109IdentityRestoreV2:tensors:109"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_109AssignVariableOp+assignvariableop_109_adam_conv3d_2_kernel_vIdentity_109:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_110IdentityRestoreV2:tensors:110"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_110AssignVariableOp)assignvariableop_110_adam_conv3d_2_bias_vIdentity_110:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_111IdentityRestoreV2:tensors:111"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_111AssignVariableOp+assignvariableop_111_adam_conv3d_3_kernel_vIdentity_111:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_112IdentityRestoreV2:tensors:112"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_112AssignVariableOp)assignvariableop_112_adam_conv3d_3_bias_vIdentity_112:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_113IdentityRestoreV2:tensors:113"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_113AssignVariableOp+assignvariableop_113_adam_conv3d_4_kernel_vIdentity_113:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_114IdentityRestoreV2:tensors:114"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_114AssignVariableOp)assignvariableop_114_adam_conv3d_4_bias_vIdentity_114:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_115IdentityRestoreV2:tensors:115"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_115AssignVariableOp+assignvariableop_115_adam_conv3d_5_kernel_vIdentity_115:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_116IdentityRestoreV2:tensors:116"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_116AssignVariableOp)assignvariableop_116_adam_conv3d_5_bias_vIdentity_116:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_117IdentityRestoreV2:tensors:117"/device:CPU:0*
T0*
_output_shapes
:Ј
AssignVariableOp_117AssignVariableOp5assignvariableop_117_adam_time_distributed_1_kernel_vIdentity_117:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_118IdentityRestoreV2:tensors:118"/device:CPU:0*
T0*
_output_shapes
:І
AssignVariableOp_118AssignVariableOp3assignvariableop_118_adam_time_distributed_1_bias_vIdentity_118:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_119IdentityRestoreV2:tensors:119"/device:CPU:0*
T0*
_output_shapes
:М
AssignVariableOp_119AssignVariableOpIassignvariableop_119_adam_frame_position_embedding_embedding_embeddings_vIdentity_119:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_120IdentityRestoreV2:tensors:120"/device:CPU:0*
T0*
_output_shapes
:Ф
AssignVariableOp_120AssignVariableOpQassignvariableop_120_adam_transformer_layer_1_multi_head_attention_query_kernel_vIdentity_120:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_121IdentityRestoreV2:tensors:121"/device:CPU:0*
T0*
_output_shapes
:Т
AssignVariableOp_121AssignVariableOpOassignvariableop_121_adam_transformer_layer_1_multi_head_attention_query_bias_vIdentity_121:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_122IdentityRestoreV2:tensors:122"/device:CPU:0*
T0*
_output_shapes
:Т
AssignVariableOp_122AssignVariableOpOassignvariableop_122_adam_transformer_layer_1_multi_head_attention_key_kernel_vIdentity_122:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_123IdentityRestoreV2:tensors:123"/device:CPU:0*
T0*
_output_shapes
:Р
AssignVariableOp_123AssignVariableOpMassignvariableop_123_adam_transformer_layer_1_multi_head_attention_key_bias_vIdentity_123:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_124IdentityRestoreV2:tensors:124"/device:CPU:0*
T0*
_output_shapes
:Ф
AssignVariableOp_124AssignVariableOpQassignvariableop_124_adam_transformer_layer_1_multi_head_attention_value_kernel_vIdentity_124:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_125IdentityRestoreV2:tensors:125"/device:CPU:0*
T0*
_output_shapes
:Т
AssignVariableOp_125AssignVariableOpOassignvariableop_125_adam_transformer_layer_1_multi_head_attention_value_bias_vIdentity_125:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_126IdentityRestoreV2:tensors:126"/device:CPU:0*
T0*
_output_shapes
:Я
AssignVariableOp_126AssignVariableOp\assignvariableop_126_adam_transformer_layer_1_multi_head_attention_attention_output_kernel_vIdentity_126:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_127IdentityRestoreV2:tensors:127"/device:CPU:0*
T0*
_output_shapes
:Э
AssignVariableOp_127AssignVariableOpZassignvariableop_127_adam_transformer_layer_1_multi_head_attention_attention_output_bias_vIdentity_127:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_128IdentityRestoreV2:tensors:128"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_128AssignVariableOp*assignvariableop_128_adam_dense_1_kernel_vIdentity_128:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_129IdentityRestoreV2:tensors:129"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_129AssignVariableOp(assignvariableop_129_adam_dense_1_bias_vIdentity_129:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_130IdentityRestoreV2:tensors:130"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_130AssignVariableOp*assignvariableop_130_adam_dense_2_kernel_vIdentity_130:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_131IdentityRestoreV2:tensors:131"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_131AssignVariableOp(assignvariableop_131_adam_dense_2_bias_vIdentity_131:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_132IdentityRestoreV2:tensors:132"/device:CPU:0*
T0*
_output_shapes
:Ц
AssignVariableOp_132AssignVariableOpSassignvariableop_132_adam_transformer_layer_2_multi_head_attention_1_query_kernel_vIdentity_132:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_133IdentityRestoreV2:tensors:133"/device:CPU:0*
T0*
_output_shapes
:Ф
AssignVariableOp_133AssignVariableOpQassignvariableop_133_adam_transformer_layer_2_multi_head_attention_1_query_bias_vIdentity_133:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_134IdentityRestoreV2:tensors:134"/device:CPU:0*
T0*
_output_shapes
:Ф
AssignVariableOp_134AssignVariableOpQassignvariableop_134_adam_transformer_layer_2_multi_head_attention_1_key_kernel_vIdentity_134:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_135IdentityRestoreV2:tensors:135"/device:CPU:0*
T0*
_output_shapes
:Т
AssignVariableOp_135AssignVariableOpOassignvariableop_135_adam_transformer_layer_2_multi_head_attention_1_key_bias_vIdentity_135:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_136IdentityRestoreV2:tensors:136"/device:CPU:0*
T0*
_output_shapes
:Ц
AssignVariableOp_136AssignVariableOpSassignvariableop_136_adam_transformer_layer_2_multi_head_attention_1_value_kernel_vIdentity_136:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_137IdentityRestoreV2:tensors:137"/device:CPU:0*
T0*
_output_shapes
:Ф
AssignVariableOp_137AssignVariableOpQassignvariableop_137_adam_transformer_layer_2_multi_head_attention_1_value_bias_vIdentity_137:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_138IdentityRestoreV2:tensors:138"/device:CPU:0*
T0*
_output_shapes
:б
AssignVariableOp_138AssignVariableOp^assignvariableop_138_adam_transformer_layer_2_multi_head_attention_1_attention_output_kernel_vIdentity_138:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_139IdentityRestoreV2:tensors:139"/device:CPU:0*
T0*
_output_shapes
:Я
AssignVariableOp_139AssignVariableOp\assignvariableop_139_adam_transformer_layer_2_multi_head_attention_1_attention_output_bias_vIdentity_139:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_140IdentityRestoreV2:tensors:140"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_140AssignVariableOp*assignvariableop_140_adam_dense_3_kernel_vIdentity_140:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_141IdentityRestoreV2:tensors:141"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_141AssignVariableOp(assignvariableop_141_adam_dense_3_bias_vIdentity_141:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_142IdentityRestoreV2:tensors:142"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_142AssignVariableOp*assignvariableop_142_adam_dense_4_kernel_vIdentity_142:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_143IdentityRestoreV2:tensors:143"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_143AssignVariableOp(assignvariableop_143_adam_dense_4_bias_vIdentity_143:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 м
Identity_144Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_100^AssignVariableOp_101^AssignVariableOp_102^AssignVariableOp_103^AssignVariableOp_104^AssignVariableOp_105^AssignVariableOp_106^AssignVariableOp_107^AssignVariableOp_108^AssignVariableOp_109^AssignVariableOp_11^AssignVariableOp_110^AssignVariableOp_111^AssignVariableOp_112^AssignVariableOp_113^AssignVariableOp_114^AssignVariableOp_115^AssignVariableOp_116^AssignVariableOp_117^AssignVariableOp_118^AssignVariableOp_119^AssignVariableOp_12^AssignVariableOp_120^AssignVariableOp_121^AssignVariableOp_122^AssignVariableOp_123^AssignVariableOp_124^AssignVariableOp_125^AssignVariableOp_126^AssignVariableOp_127^AssignVariableOp_128^AssignVariableOp_129^AssignVariableOp_13^AssignVariableOp_130^AssignVariableOp_131^AssignVariableOp_132^AssignVariableOp_133^AssignVariableOp_134^AssignVariableOp_135^AssignVariableOp_136^AssignVariableOp_137^AssignVariableOp_138^AssignVariableOp_139^AssignVariableOp_14^AssignVariableOp_140^AssignVariableOp_141^AssignVariableOp_142^AssignVariableOp_143^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_72^AssignVariableOp_73^AssignVariableOp_74^AssignVariableOp_75^AssignVariableOp_76^AssignVariableOp_77^AssignVariableOp_78^AssignVariableOp_79^AssignVariableOp_8^AssignVariableOp_80^AssignVariableOp_81^AssignVariableOp_82^AssignVariableOp_83^AssignVariableOp_84^AssignVariableOp_85^AssignVariableOp_86^AssignVariableOp_87^AssignVariableOp_88^AssignVariableOp_89^AssignVariableOp_9^AssignVariableOp_90^AssignVariableOp_91^AssignVariableOp_92^AssignVariableOp_93^AssignVariableOp_94^AssignVariableOp_95^AssignVariableOp_96^AssignVariableOp_97^AssignVariableOp_98^AssignVariableOp_99^NoOp"/device:CPU:0*
T0*
_output_shapes
: Y
Identity_145IdentityIdentity_144:output:0^NoOp_1*
T0*
_output_shapes
: Ш
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_100^AssignVariableOp_101^AssignVariableOp_102^AssignVariableOp_103^AssignVariableOp_104^AssignVariableOp_105^AssignVariableOp_106^AssignVariableOp_107^AssignVariableOp_108^AssignVariableOp_109^AssignVariableOp_11^AssignVariableOp_110^AssignVariableOp_111^AssignVariableOp_112^AssignVariableOp_113^AssignVariableOp_114^AssignVariableOp_115^AssignVariableOp_116^AssignVariableOp_117^AssignVariableOp_118^AssignVariableOp_119^AssignVariableOp_12^AssignVariableOp_120^AssignVariableOp_121^AssignVariableOp_122^AssignVariableOp_123^AssignVariableOp_124^AssignVariableOp_125^AssignVariableOp_126^AssignVariableOp_127^AssignVariableOp_128^AssignVariableOp_129^AssignVariableOp_13^AssignVariableOp_130^AssignVariableOp_131^AssignVariableOp_132^AssignVariableOp_133^AssignVariableOp_134^AssignVariableOp_135^AssignVariableOp_136^AssignVariableOp_137^AssignVariableOp_138^AssignVariableOp_139^AssignVariableOp_14^AssignVariableOp_140^AssignVariableOp_141^AssignVariableOp_142^AssignVariableOp_143^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_72^AssignVariableOp_73^AssignVariableOp_74^AssignVariableOp_75^AssignVariableOp_76^AssignVariableOp_77^AssignVariableOp_78^AssignVariableOp_79^AssignVariableOp_8^AssignVariableOp_80^AssignVariableOp_81^AssignVariableOp_82^AssignVariableOp_83^AssignVariableOp_84^AssignVariableOp_85^AssignVariableOp_86^AssignVariableOp_87^AssignVariableOp_88^AssignVariableOp_89^AssignVariableOp_9^AssignVariableOp_90^AssignVariableOp_91^AssignVariableOp_92^AssignVariableOp_93^AssignVariableOp_94^AssignVariableOp_95^AssignVariableOp_96^AssignVariableOp_97^AssignVariableOp_98^AssignVariableOp_99*"
_acd_function_control_output(*
_output_shapes
 "%
identity_145Identity_145:output:0*З
_input_shapesЅ
Ђ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102,
AssignVariableOp_100AssignVariableOp_1002,
AssignVariableOp_101AssignVariableOp_1012,
AssignVariableOp_102AssignVariableOp_1022,
AssignVariableOp_103AssignVariableOp_1032,
AssignVariableOp_104AssignVariableOp_1042,
AssignVariableOp_105AssignVariableOp_1052,
AssignVariableOp_106AssignVariableOp_1062,
AssignVariableOp_107AssignVariableOp_1072,
AssignVariableOp_108AssignVariableOp_1082,
AssignVariableOp_109AssignVariableOp_1092*
AssignVariableOp_11AssignVariableOp_112,
AssignVariableOp_110AssignVariableOp_1102,
AssignVariableOp_111AssignVariableOp_1112,
AssignVariableOp_112AssignVariableOp_1122,
AssignVariableOp_113AssignVariableOp_1132,
AssignVariableOp_114AssignVariableOp_1142,
AssignVariableOp_115AssignVariableOp_1152,
AssignVariableOp_116AssignVariableOp_1162,
AssignVariableOp_117AssignVariableOp_1172,
AssignVariableOp_118AssignVariableOp_1182,
AssignVariableOp_119AssignVariableOp_1192*
AssignVariableOp_12AssignVariableOp_122,
AssignVariableOp_120AssignVariableOp_1202,
AssignVariableOp_121AssignVariableOp_1212,
AssignVariableOp_122AssignVariableOp_1222,
AssignVariableOp_123AssignVariableOp_1232,
AssignVariableOp_124AssignVariableOp_1242,
AssignVariableOp_125AssignVariableOp_1252,
AssignVariableOp_126AssignVariableOp_1262,
AssignVariableOp_127AssignVariableOp_1272,
AssignVariableOp_128AssignVariableOp_1282,
AssignVariableOp_129AssignVariableOp_1292*
AssignVariableOp_13AssignVariableOp_132,
AssignVariableOp_130AssignVariableOp_1302,
AssignVariableOp_131AssignVariableOp_1312,
AssignVariableOp_132AssignVariableOp_1322,
AssignVariableOp_133AssignVariableOp_1332,
AssignVariableOp_134AssignVariableOp_1342,
AssignVariableOp_135AssignVariableOp_1352,
AssignVariableOp_136AssignVariableOp_1362,
AssignVariableOp_137AssignVariableOp_1372,
AssignVariableOp_138AssignVariableOp_1382,
AssignVariableOp_139AssignVariableOp_1392*
AssignVariableOp_14AssignVariableOp_142,
AssignVariableOp_140AssignVariableOp_1402,
AssignVariableOp_141AssignVariableOp_1412,
AssignVariableOp_142AssignVariableOp_1422,
AssignVariableOp_143AssignVariableOp_1432*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442*
AssignVariableOp_45AssignVariableOp_452*
AssignVariableOp_46AssignVariableOp_462*
AssignVariableOp_47AssignVariableOp_472*
AssignVariableOp_48AssignVariableOp_482*
AssignVariableOp_49AssignVariableOp_492(
AssignVariableOp_5AssignVariableOp_52*
AssignVariableOp_50AssignVariableOp_502*
AssignVariableOp_51AssignVariableOp_512*
AssignVariableOp_52AssignVariableOp_522*
AssignVariableOp_53AssignVariableOp_532*
AssignVariableOp_54AssignVariableOp_542*
AssignVariableOp_55AssignVariableOp_552*
AssignVariableOp_56AssignVariableOp_562*
AssignVariableOp_57AssignVariableOp_572*
AssignVariableOp_58AssignVariableOp_582*
AssignVariableOp_59AssignVariableOp_592(
AssignVariableOp_6AssignVariableOp_62*
AssignVariableOp_60AssignVariableOp_602*
AssignVariableOp_61AssignVariableOp_612*
AssignVariableOp_62AssignVariableOp_622*
AssignVariableOp_63AssignVariableOp_632*
AssignVariableOp_64AssignVariableOp_642*
AssignVariableOp_65AssignVariableOp_652*
AssignVariableOp_66AssignVariableOp_662*
AssignVariableOp_67AssignVariableOp_672*
AssignVariableOp_68AssignVariableOp_682*
AssignVariableOp_69AssignVariableOp_692(
AssignVariableOp_7AssignVariableOp_72*
AssignVariableOp_70AssignVariableOp_702*
AssignVariableOp_71AssignVariableOp_712*
AssignVariableOp_72AssignVariableOp_722*
AssignVariableOp_73AssignVariableOp_732*
AssignVariableOp_74AssignVariableOp_742*
AssignVariableOp_75AssignVariableOp_752*
AssignVariableOp_76AssignVariableOp_762*
AssignVariableOp_77AssignVariableOp_772*
AssignVariableOp_78AssignVariableOp_782*
AssignVariableOp_79AssignVariableOp_792(
AssignVariableOp_8AssignVariableOp_82*
AssignVariableOp_80AssignVariableOp_802*
AssignVariableOp_81AssignVariableOp_812*
AssignVariableOp_82AssignVariableOp_822*
AssignVariableOp_83AssignVariableOp_832*
AssignVariableOp_84AssignVariableOp_842*
AssignVariableOp_85AssignVariableOp_852*
AssignVariableOp_86AssignVariableOp_862*
AssignVariableOp_87AssignVariableOp_872*
AssignVariableOp_88AssignVariableOp_882*
AssignVariableOp_89AssignVariableOp_892(
AssignVariableOp_9AssignVariableOp_92*
AssignVariableOp_90AssignVariableOp_902*
AssignVariableOp_91AssignVariableOp_912*
AssignVariableOp_92AssignVariableOp_922*
AssignVariableOp_93AssignVariableOp_932*
AssignVariableOp_94AssignVariableOp_942*
AssignVariableOp_95AssignVariableOp_952*
AssignVariableOp_96AssignVariableOp_962*
AssignVariableOp_97AssignVariableOp_972*
AssignVariableOp_98AssignVariableOp_982*
AssignVariableOp_99AssignVariableOp_99:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
	
є
,__inference_sequential_2_layer_call_fn_14080
conv3d_4_input&
unknown:@
	unknown_0:	)
	unknown_1:
	unknown_2:	
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallconv3d_4_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *P
fKRI
G__inference_sequential_2_layer_call_and_return_conditional_losses_14069|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:c _
3
_output_shapes!
:џџџџџџџџџ@
(
_user_specified_nameconv3d_4_input
џ
я
,__inference_sequential_1_layer_call_fn_13999
conv3d_2_input%
unknown: @
	unknown_0:@'
	unknown_1:@@
	unknown_2:@
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallconv3d_2_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *P
fKRI
G__inference_sequential_1_layer_call_and_return_conditional_losses_13975{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:c _
3
_output_shapes!
:џџџџџџџџџ 
(
_user_specified_nameconv3d_2_input
і
L
0__inference_time_distributed_layer_call_fn_13146

inputs
identityЧ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_time_distributed_layer_call_and_return_conditional_losses_11454n
IdentityIdentityPartitionedCall:output:0*
T0*5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'џџџџџџџџџџџџџџџџџџ:e a
=
_output_shapes+
):'џџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
Ѕ

C__inference_conv3d_2_layer_call_and_return_conditional_losses_13891

inputs<
conv3d_readvariableop_resource: @-
biasadd_readvariableop_resource:@
identityЂBiasAdd/ReadVariableOpЂConv3D/ReadVariableOp
Conv3D/ReadVariableOpReadVariableOpconv3d_readvariableop_resource**
_output_shapes
: @*
dtype0
Conv3DConv3DinputsConv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
BiasAddBiasAddConv3D:output:0BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@\
ReluReluBiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@m
IdentityIdentityRelu:activations:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv3D/ReadVariableOpConv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ 
 
_user_specified_nameinputs
Ч
й
,__inference_sequential_1_layer_call_fn_13633
dense_3_input
unknown:	@
	unknown_0:	
	unknown_1:	@
	unknown_2:@
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCalldense_3_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *P
fKRI
G__inference_sequential_1_layer_call_and_return_conditional_losses_13609s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Z V
+
_output_shapes
:џџџџџџџџџ@
'
_user_specified_namedense_3_input
ц
Т
E__inference_sequential_layer_call_and_return_conditional_losses_13873
conv3d_input*
conv3d_13862: 
conv3d_13864: ,
conv3d_1_13867:  
conv3d_1_13869: 
identityЂconv3d/StatefulPartitionedCallЂ conv3d_1/StatefulPartitionedCallњ
conv3d/StatefulPartitionedCallStatefulPartitionedCallconv3d_inputconv3d_13862conv3d_13864*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ   *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *J
fERC
A__inference_conv3d_layer_call_and_return_conditional_losses_13737
 conv3d_1/StatefulPartitionedCallStatefulPartitionedCall'conv3d/StatefulPartitionedCall:output:0conv3d_1_13867conv3d_1_13869*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ   *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_1_layer_call_and_return_conditional_losses_13754
IdentityIdentity)conv3d_1/StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   
NoOpNoOp^conv3d/StatefulPartitionedCall!^conv3d_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ  : : : : 2@
conv3d/StatefulPartitionedCallconv3d/StatefulPartitionedCall2D
 conv3d_1/StatefulPartitionedCall conv3d_1/StatefulPartitionedCall:a ]
3
_output_shapes!
:џџџџџџџџџ  
&
_user_specified_nameconv3d_input
ѓ
ъ
G__inference_sequential_1_layer_call_and_return_conditional_losses_14681

inputsE
'conv3d_2_conv3d_readvariableop_resource: @6
(conv3d_2_biasadd_readvariableop_resource:@E
'conv3d_3_conv3d_readvariableop_resource:@@6
(conv3d_3_biasadd_readvariableop_resource:@
identityЂconv3d_2/BiasAdd/ReadVariableOpЂconv3d_2/Conv3D/ReadVariableOpЂconv3d_3/BiasAdd/ReadVariableOpЂconv3d_3/Conv3D/ReadVariableOp
conv3d_2/Conv3D/ReadVariableOpReadVariableOp'conv3d_2_conv3d_readvariableop_resource**
_output_shapes
: @*
dtype0А
conv3d_2/Conv3DConv3Dinputs&conv3d_2/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	

conv3d_2/BiasAdd/ReadVariableOpReadVariableOp(conv3d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
conv3d_2/BiasAddBiasAddconv3d_2/Conv3D:output:0'conv3d_2/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@n
conv3d_2/ReluReluconv3d_2/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@
conv3d_3/Conv3D/ReadVariableOpReadVariableOp'conv3d_3_conv3d_readvariableop_resource**
_output_shapes
:@@*
dtype0Х
conv3d_3/Conv3DConv3Dconv3d_2/Relu:activations:0&conv3d_3/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	

conv3d_3/BiasAdd/ReadVariableOpReadVariableOp(conv3d_3_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
conv3d_3/BiasAddBiasAddconv3d_3/Conv3D:output:0'conv3d_3/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@n
conv3d_3/ReluReluconv3d_3/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@v
IdentityIdentityconv3d_3/Relu:activations:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@Ь
NoOpNoOp ^conv3d_2/BiasAdd/ReadVariableOp^conv3d_2/Conv3D/ReadVariableOp ^conv3d_3/BiasAdd/ReadVariableOp^conv3d_3/Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ : : : : 2B
conv3d_2/BiasAdd/ReadVariableOpconv3d_2/BiasAdd/ReadVariableOp2@
conv3d_2/Conv3D/ReadVariableOpconv3d_2/Conv3D/ReadVariableOp2B
conv3d_3/BiasAdd/ReadVariableOpconv3d_3/BiasAdd/ReadVariableOp2@
conv3d_3/Conv3D/ReadVariableOpconv3d_3/Conv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ 
 
_user_specified_nameinputs
Щ

7__inference_frame_position_embedding_layer_call_fn_2248

inputs
unknown:@
identityЂStatefulPartitionedCallс
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_frame_position_embedding_layer_call_and_return_conditional_losses_2242`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*,
_input_shapes
:џџџџџџџџџ@: 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs

З
M__inference_transformer_layer_2_layer_call_and_return_conditional_losses_1181

inputsX
Bmulti_head_attention_1_query_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_query_add_readvariableop_resource:@V
@multi_head_attention_1_key_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_1_key_add_readvariableop_resource:@X
Bmulti_head_attention_1_value_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_value_add_readvariableop_resource:@c
Mmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource:@@Q
Cmulti_head_attention_1_attention_output_add_readvariableop_resource:@I
6sequential_1_dense_3_tensordot_readvariableop_resource:	@C
4sequential_1_dense_3_biasadd_readvariableop_resource:	I
6sequential_1_dense_4_tensordot_readvariableop_resource:	@B
4sequential_1_dense_4_biasadd_readvariableop_resource:@
identityЂ:multi_head_attention_1/attention_output/add/ReadVariableOpЂDmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpЂ-multi_head_attention_1/key/add/ReadVariableOpЂ7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpЂ/multi_head_attention_1/query/add/ReadVariableOpЂ9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpЂ/multi_head_attention_1/value/add/ReadVariableOpЂ9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpЂ+sequential_1/dense_3/BiasAdd/ReadVariableOpЂ-sequential_1/dense_3/Tensordot/ReadVariableOpЂ+sequential_1/dense_4/BiasAdd/ReadVariableOpЂ-sequential_1/dense_4/Tensordot/ReadVariableOpР
9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0п
*multi_head_attention_1/query/einsum/EinsumEinsuminputsAmulti_head_attention_1/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЈ
/multi_head_attention_1/query/add/ReadVariableOpReadVariableOp8multi_head_attention_1_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0б
 multi_head_attention_1/query/addAddV23multi_head_attention_1/query/einsum/Einsum:output:07multi_head_attention_1/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@М
7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_1_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0л
(multi_head_attention_1/key/einsum/EinsumEinsuminputs?multi_head_attention_1/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЄ
-multi_head_attention_1/key/add/ReadVariableOpReadVariableOp6multi_head_attention_1_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ы
multi_head_attention_1/key/addAddV21multi_head_attention_1/key/einsum/Einsum:output:05multi_head_attention_1/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@Р
9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0п
*multi_head_attention_1/value/einsum/EinsumEinsuminputsAmulti_head_attention_1/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЈ
/multi_head_attention_1/value/add/ReadVariableOpReadVariableOp8multi_head_attention_1_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0б
 multi_head_attention_1/value/addAddV23multi_head_attention_1/value/einsum/Einsum:output:07multi_head_attention_1/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@a
multi_head_attention_1/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >Ј
multi_head_attention_1/MulMul$multi_head_attention_1/query/add:z:0%multi_head_attention_1/Mul/y:output:0*
T0*/
_output_shapes
:џџџџџџџџџ@д
$multi_head_attention_1/einsum/EinsumEinsum"multi_head_attention_1/key/add:z:0multi_head_attention_1/Mul:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ*
equationaecd,abcd->acbe
&multi_head_attention_1/softmax/SoftmaxSoftmax-multi_head_attention_1/einsum/Einsum:output:0*
T0*/
_output_shapes
:џџџџџџџџџъ
&multi_head_attention_1/einsum_1/EinsumEinsum0multi_head_attention_1/softmax/Softmax:softmax:0$multi_head_attention_1/value/add:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationacbe,aecd->abcdж
Dmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpMmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0
5multi_head_attention_1/attention_output/einsum/EinsumEinsum/multi_head_attention_1/einsum_1/Einsum:output:0Lmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:џџџџџџџџџ@*
equationabcd,cde->abeК
:multi_head_attention_1/attention_output/add/ReadVariableOpReadVariableOpCmulti_head_attention_1_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0ю
+multi_head_attention_1/attention_output/addAddV2>multi_head_attention_1/attention_output/einsum/Einsum:output:0Bmulti_head_attention_1/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@{
addAddV2inputs/multi_head_attention_1/attention_output/add:z:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ѕ
-sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0m
#sequential_1/dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:t
#sequential_1/dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       [
$sequential_1/dense_3/Tensordot/ShapeShapeadd:z:0*
T0*
_output_shapes
:n
,sequential_1/dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential_1/dense_3/Tensordot/GatherV2GatherV2-sequential_1/dense_3/Tensordot/Shape:output:0,sequential_1/dense_3/Tensordot/free:output:05sequential_1/dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
.sequential_1/dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
)sequential_1/dense_3/Tensordot/GatherV2_1GatherV2-sequential_1/dense_3/Tensordot/Shape:output:0,sequential_1/dense_3/Tensordot/axes:output:07sequential_1/dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
$sequential_1/dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ­
#sequential_1/dense_3/Tensordot/ProdProd0sequential_1/dense_3/Tensordot/GatherV2:output:0-sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: Г
%sequential_1/dense_3/Tensordot/Prod_1Prod2sequential_1/dense_3/Tensordot/GatherV2_1:output:0/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : №
%sequential_1/dense_3/Tensordot/concatConcatV2,sequential_1/dense_3/Tensordot/free:output:0,sequential_1/dense_3/Tensordot/axes:output:03sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:И
$sequential_1/dense_3/Tensordot/stackPack,sequential_1/dense_3/Tensordot/Prod:output:0.sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Є
(sequential_1/dense_3/Tensordot/transpose	Transposeadd:z:0.sequential_1/dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Щ
&sequential_1/dense_3/Tensordot/ReshapeReshape,sequential_1/dense_3/Tensordot/transpose:y:0-sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЪ
%sequential_1/dense_3/Tensordot/MatMulMatMul/sequential_1/dense_3/Tensordot/Reshape:output:05sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџq
&sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:n
,sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ћ
'sequential_1/dense_3/Tensordot/concat_1ConcatV20sequential_1/dense_3/Tensordot/GatherV2:output:0/sequential_1/dense_3/Tensordot/Const_2:output:05sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:У
sequential_1/dense_3/TensordotReshape/sequential_1/dense_3/Tensordot/MatMul:product:00sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
+sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0М
sequential_1/dense_3/BiasAddBiasAdd'sequential_1/dense_3/Tensordot:output:03sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџd
sequential_1/dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Ќ
sequential_1/dense_3/Gelu/mulMul(sequential_1/dense_3/Gelu/mul/x:output:0%sequential_1/dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџe
 sequential_1/dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?Е
!sequential_1/dense_3/Gelu/truedivRealDiv%sequential_1/dense_3/BiasAdd:output:0)sequential_1/dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
sequential_1/dense_3/Gelu/ErfErf%sequential_1/dense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџd
sequential_1/dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Њ
sequential_1/dense_3/Gelu/addAddV2(sequential_1/dense_3/Gelu/add/x:output:0!sequential_1/dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџЃ
sequential_1/dense_3/Gelu/mul_1Mul!sequential_1/dense_3/Gelu/mul:z:0!sequential_1/dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџЅ
-sequential_1/dense_4/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_4_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0m
#sequential_1/dense_4/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:t
#sequential_1/dense_4/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       w
$sequential_1/dense_4/Tensordot/ShapeShape#sequential_1/dense_3/Gelu/mul_1:z:0*
T0*
_output_shapes
:n
,sequential_1/dense_4/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential_1/dense_4/Tensordot/GatherV2GatherV2-sequential_1/dense_4/Tensordot/Shape:output:0,sequential_1/dense_4/Tensordot/free:output:05sequential_1/dense_4/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
.sequential_1/dense_4/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
)sequential_1/dense_4/Tensordot/GatherV2_1GatherV2-sequential_1/dense_4/Tensordot/Shape:output:0,sequential_1/dense_4/Tensordot/axes:output:07sequential_1/dense_4/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
$sequential_1/dense_4/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ­
#sequential_1/dense_4/Tensordot/ProdProd0sequential_1/dense_4/Tensordot/GatherV2:output:0-sequential_1/dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: Г
%sequential_1/dense_4/Tensordot/Prod_1Prod2sequential_1/dense_4/Tensordot/GatherV2_1:output:0/sequential_1/dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : №
%sequential_1/dense_4/Tensordot/concatConcatV2,sequential_1/dense_4/Tensordot/free:output:0,sequential_1/dense_4/Tensordot/axes:output:03sequential_1/dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:И
$sequential_1/dense_4/Tensordot/stackPack,sequential_1/dense_4/Tensordot/Prod:output:0.sequential_1/dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:С
(sequential_1/dense_4/Tensordot/transpose	Transpose#sequential_1/dense_3/Gelu/mul_1:z:0.sequential_1/dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџЩ
&sequential_1/dense_4/Tensordot/ReshapeReshape,sequential_1/dense_4/Tensordot/transpose:y:0-sequential_1/dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЩ
%sequential_1/dense_4/Tensordot/MatMulMatMul/sequential_1/dense_4/Tensordot/Reshape:output:05sequential_1/dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@p
&sequential_1/dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@n
,sequential_1/dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ћ
'sequential_1/dense_4/Tensordot/concat_1ConcatV20sequential_1/dense_4/Tensordot/GatherV2:output:0/sequential_1/dense_4/Tensordot/Const_2:output:05sequential_1/dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Т
sequential_1/dense_4/TensordotReshape/sequential_1/dense_4/Tensordot/MatMul:product:00sequential_1/dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
+sequential_1/dense_4/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Л
sequential_1/dense_4/BiasAddBiasAdd'sequential_1/dense_4/Tensordot:output:03sequential_1/dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@t
add_1AddV2add:z:0%sequential_1/dense_4/BiasAdd:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ь
NoOpNoOp;^multi_head_attention_1/attention_output/add/ReadVariableOpE^multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp.^multi_head_attention_1/key/add/ReadVariableOp8^multi_head_attention_1/key/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/query/add/ReadVariableOp:^multi_head_attention_1/query/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/value/add/ReadVariableOp:^multi_head_attention_1/value/einsum/Einsum/ReadVariableOp,^sequential_1/dense_3/BiasAdd/ReadVariableOp.^sequential_1/dense_3/Tensordot/ReadVariableOp,^sequential_1/dense_4/BiasAdd/ReadVariableOp.^sequential_1/dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 \
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 2x
:multi_head_attention_1/attention_output/add/ReadVariableOp:multi_head_attention_1/attention_output/add/ReadVariableOp2
Dmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpDmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp2^
-multi_head_attention_1/key/add/ReadVariableOp-multi_head_attention_1/key/add/ReadVariableOp2r
7multi_head_attention_1/key/einsum/Einsum/ReadVariableOp7multi_head_attention_1/key/einsum/Einsum/ReadVariableOp2b
/multi_head_attention_1/query/add/ReadVariableOp/multi_head_attention_1/query/add/ReadVariableOp2v
9multi_head_attention_1/query/einsum/Einsum/ReadVariableOp9multi_head_attention_1/query/einsum/Einsum/ReadVariableOp2b
/multi_head_attention_1/value/add/ReadVariableOp/multi_head_attention_1/value/add/ReadVariableOp2v
9multi_head_attention_1/value/einsum/Einsum/ReadVariableOp9multi_head_attention_1/value/einsum/Einsum/ReadVariableOp2Z
+sequential_1/dense_3/BiasAdd/ReadVariableOp+sequential_1/dense_3/BiasAdd/ReadVariableOp2^
-sequential_1/dense_3/Tensordot/ReadVariableOp-sequential_1/dense_3/Tensordot/ReadVariableOp2Z
+sequential_1/dense_4/BiasAdd/ReadVariableOp+sequential_1/dense_4/BiasAdd/ReadVariableOp2^
-sequential_1/dense_4/Tensordot/ReadVariableOp-sequential_1/dense_4/Tensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
џ
Ё
(__inference_conv3d_1_layer_call_fn_14944

inputs%
unknown:  
	unknown_0: 
identityЂStatefulPartitionedCallч
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ   *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_1_layer_call_and_return_conditional_losses_13754{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ   : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ   
 
_user_specified_nameinputs
f

@__inference_model_layer_call_and_return_conditional_losses_12968

inputs-
encoder3d_12834:
encoder3d_12836:-
encoder3d_12838: 
encoder3d_12840: -
encoder3d_12842:  
encoder3d_12844: -
encoder3d_12846: @
encoder3d_12848:@-
encoder3d_12850:@@
encoder3d_12852:@.
encoder3d_12854:@
encoder3d_12856:	/
encoder3d_12858:
encoder3d_12860:	J
7time_distributed_1_dense_matmul_readvariableop_resource:	@F
8time_distributed_1_dense_biasadd_readvariableop_resource:@0
frame_position_embedding_12891:@/
transformer_layer_1_12894:@@+
transformer_layer_1_12896:@/
transformer_layer_1_12898:@@+
transformer_layer_1_12900:@/
transformer_layer_1_12902:@@+
transformer_layer_1_12904:@/
transformer_layer_1_12906:@@'
transformer_layer_1_12908:@,
transformer_layer_1_12910:	@(
transformer_layer_1_12912:	,
transformer_layer_1_12914:	@'
transformer_layer_1_12916:@/
transformer_layer_2_12919:@@+
transformer_layer_2_12921:@/
transformer_layer_2_12923:@@+
transformer_layer_2_12925:@/
transformer_layer_2_12927:@@+
transformer_layer_2_12929:@/
transformer_layer_2_12931:@@'
transformer_layer_2_12933:@,
transformer_layer_2_12935:	@(
transformer_layer_2_12937:	,
transformer_layer_2_12939:	@'
transformer_layer_2_12941:@:
&dense_5_matmul_readvariableop_resource:
6
'dense_5_biasadd_readvariableop_resource:	9
&dense_6_matmul_readvariableop_resource:	5
'dense_6_biasadd_readvariableop_resource:
identityЂdense_5/BiasAdd/ReadVariableOpЂdense_5/MatMul/ReadVariableOpЂdense_6/BiasAdd/ReadVariableOpЂdense_6/MatMul/ReadVariableOpЂ!encoder3d/StatefulPartitionedCallЂ0frame_position_embedding/StatefulPartitionedCallЂ/time_distributed_1/dense/BiasAdd/ReadVariableOpЂ.time_distributed_1/dense/MatMul/ReadVariableOpЂ+transformer_layer_1/StatefulPartitionedCallЂ+transformer_layer_2/StatefulPartitionedCallЩ
!encoder3d/StatefulPartitionedCallStatefulPartitionedCallinputsencoder3d_12834encoder3d_12836encoder3d_12838encoder3d_12840encoder3d_12842encoder3d_12844encoder3d_12846encoder3d_12848encoder3d_12850encoder3d_12852encoder3d_12854encoder3d_12856encoder3d_12858encoder3d_12860*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11227w
time_distributed/Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"џџџџ         Г
time_distributed/ReshapeReshape*encoder3d/StatefulPartitionedCall:output:0'time_distributed/Reshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџo
time_distributed/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   Њ
 time_distributed/flatten/ReshapeReshape!time_distributed/Reshape:output:0'time_distributed/flatten/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџu
 time_distributed/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*!
valueB"џџџџ      В
time_distributed/Reshape_1Reshape)time_distributed/flatten/Reshape:output:0)time_distributed/Reshape_1/shape:output:0*
T0*,
_output_shapes
:џџџџџџџџџy
 time_distributed/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*%
valueB"џџџџ         З
time_distributed/Reshape_2Reshape*encoder3d/StatefulPartitionedCall:output:0)time_distributed/Reshape_2/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџq
 time_distributed_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   Ј
time_distributed_1/ReshapeReshape#time_distributed/Reshape_1:output:0)time_distributed_1/Reshape/shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџЇ
.time_distributed_1/dense/MatMul/ReadVariableOpReadVariableOp7time_distributed_1_dense_matmul_readvariableop_resource*
_output_shapes
:	@*
dtype0И
time_distributed_1/dense/MatMulMatMul#time_distributed_1/Reshape:output:06time_distributed_1/dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@Є
/time_distributed_1/dense/BiasAdd/ReadVariableOpReadVariableOp8time_distributed_1_dense_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0С
 time_distributed_1/dense/BiasAddBiasAdd)time_distributed_1/dense/MatMul:product:07time_distributed_1/dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@h
#time_distributed_1/dense/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Г
!time_distributed_1/dense/Gelu/mulMul,time_distributed_1/dense/Gelu/mul/x:output:0)time_distributed_1/dense/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ@i
$time_distributed_1/dense/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?М
%time_distributed_1/dense/Gelu/truedivRealDiv)time_distributed_1/dense/BiasAdd:output:0-time_distributed_1/dense/Gelu/Cast/x:output:0*
T0*'
_output_shapes
:џџџџџџџџџ@
!time_distributed_1/dense/Gelu/ErfErf)time_distributed_1/dense/Gelu/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџ@h
#time_distributed_1/dense/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Б
!time_distributed_1/dense/Gelu/addAddV2,time_distributed_1/dense/Gelu/add/x:output:0%time_distributed_1/dense/Gelu/Erf:y:0*
T0*'
_output_shapes
:џџџџџџџџџ@Њ
#time_distributed_1/dense/Gelu/mul_1Mul%time_distributed_1/dense/Gelu/mul:z:0%time_distributed_1/dense/Gelu/add:z:0*
T0*'
_output_shapes
:џџџџџџџџџ@w
"time_distributed_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*!
valueB"џџџџ   @   Г
time_distributed_1/Reshape_1Reshape'time_distributed_1/dense/Gelu/mul_1:z:0+time_distributed_1/Reshape_1/shape:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@s
"time_distributed_1/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   Ќ
time_distributed_1/Reshape_2Reshape#time_distributed/Reshape_1:output:0+time_distributed_1/Reshape_2/shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџ
0frame_position_embedding/StatefulPartitionedCallStatefulPartitionedCall%time_distributed_1/Reshape_1:output:0frame_position_embedding_12891*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11291Я
+transformer_layer_1/StatefulPartitionedCallStatefulPartitionedCall9frame_position_embedding/StatefulPartitionedCall:output:0transformer_layer_1_12894transformer_layer_1_12896transformer_layer_1_12898transformer_layer_1_12900transformer_layer_1_12902transformer_layer_1_12904transformer_layer_1_12906transformer_layer_1_12908transformer_layer_1_12910transformer_layer_1_12912transformer_layer_1_12914transformer_layer_1_12916*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11323Ъ
+transformer_layer_2/StatefulPartitionedCallStatefulPartitionedCall4transformer_layer_1/StatefulPartitionedCall:output:0transformer_layer_2_12919transformer_layer_2_12921transformer_layer_2_12923transformer_layer_2_12925transformer_layer_2_12927transformer_layer_2_12929transformer_layer_2_12931transformer_layer_2_12933transformer_layer_2_12935transformer_layer_2_12937transformer_layer_2_12939transformer_layer_2_12941*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11377`
flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   
flatten_1/ReshapeReshape4transformer_layer_2/StatefulPartitionedCall:output:0flatten_1/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџ
dense_5/MatMul/ReadVariableOpReadVariableOp&dense_5_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
dense_5/MatMulMatMulflatten_1/Reshape:output:0%dense_5/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџ
dense_5/BiasAdd/ReadVariableOpReadVariableOp'dense_5_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
dense_5/BiasAddBiasAdddense_5/MatMul:product:0&dense_5/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџW
dense_5/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?
dense_5/Gelu/mulMuldense_5/Gelu/mul/x:output:0dense_5/BiasAdd:output:0*
T0*(
_output_shapes
:џџџџџџџџџX
dense_5/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?
dense_5/Gelu/truedivRealDivdense_5/BiasAdd:output:0dense_5/Gelu/Cast/x:output:0*
T0*(
_output_shapes
:џџџџџџџџџd
dense_5/Gelu/ErfErfdense_5/Gelu/truediv:z:0*
T0*(
_output_shapes
:џџџџџџџџџW
dense_5/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
dense_5/Gelu/addAddV2dense_5/Gelu/add/x:output:0dense_5/Gelu/Erf:y:0*
T0*(
_output_shapes
:џџџџџџџџџx
dense_5/Gelu/mul_1Muldense_5/Gelu/mul:z:0dense_5/Gelu/add:z:0*
T0*(
_output_shapes
:џџџџџџџџџ
dense_6/MatMul/ReadVariableOpReadVariableOp&dense_6_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
dense_6/MatMulMatMuldense_5/Gelu/mul_1:z:0%dense_6/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ
dense_6/BiasAdd/ReadVariableOpReadVariableOp'dense_6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
dense_6/BiasAddBiasAdddense_6/MatMul:product:0&dense_6/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџf
dense_6/SoftmaxSoftmaxdense_6/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџh
IdentityIdentitydense_6/Softmax:softmax:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџо
NoOpNoOp^dense_5/BiasAdd/ReadVariableOp^dense_5/MatMul/ReadVariableOp^dense_6/BiasAdd/ReadVariableOp^dense_6/MatMul/ReadVariableOp"^encoder3d/StatefulPartitionedCall1^frame_position_embedding/StatefulPartitionedCall0^time_distributed_1/dense/BiasAdd/ReadVariableOp/^time_distributed_1/dense/MatMul/ReadVariableOp,^transformer_layer_1/StatefulPartitionedCall,^transformer_layer_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes{
y:џџџџџџџџџ  : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2@
dense_5/BiasAdd/ReadVariableOpdense_5/BiasAdd/ReadVariableOp2>
dense_5/MatMul/ReadVariableOpdense_5/MatMul/ReadVariableOp2@
dense_6/BiasAdd/ReadVariableOpdense_6/BiasAdd/ReadVariableOp2>
dense_6/MatMul/ReadVariableOpdense_6/MatMul/ReadVariableOp2F
!encoder3d/StatefulPartitionedCall!encoder3d/StatefulPartitionedCall2d
0frame_position_embedding/StatefulPartitionedCall0frame_position_embedding/StatefulPartitionedCall2b
/time_distributed_1/dense/BiasAdd/ReadVariableOp/time_distributed_1/dense/BiasAdd/ReadVariableOp2`
.time_distributed_1/dense/MatMul/ReadVariableOp.time_distributed_1/dense/MatMul/ReadVariableOp2Z
+transformer_layer_1/StatefulPartitionedCall+transformer_layer_1/StatefulPartitionedCall2Z
+transformer_layer_2/StatefulPartitionedCall+transformer_layer_2/StatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
Ч
й
,__inference_sequential_1_layer_call_fn_13560
dense_3_input
unknown:	@
	unknown_0:	
	unknown_1:	@
	unknown_2:@
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCalldense_3_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *P
fKRI
G__inference_sequential_1_layer_call_and_return_conditional_losses_13549s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Z V
+
_output_shapes
:џџџџџџџџџ@
'
_user_specified_namedense_3_input
д
М
E__inference_sequential_layer_call_and_return_conditional_losses_13761

inputs*
conv3d_13738: 
conv3d_13740: ,
conv3d_1_13755:  
conv3d_1_13757: 
identityЂconv3d/StatefulPartitionedCallЂ conv3d_1/StatefulPartitionedCallє
conv3d/StatefulPartitionedCallStatefulPartitionedCallinputsconv3d_13738conv3d_13740*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ   *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *J
fERC
A__inference_conv3d_layer_call_and_return_conditional_losses_13737
 conv3d_1/StatefulPartitionedCallStatefulPartitionedCall'conv3d/StatefulPartitionedCall:output:0conv3d_1_13755conv3d_1_13757*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ   *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_1_layer_call_and_return_conditional_losses_13754
IdentityIdentity)conv3d_1/StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   
NoOpNoOp^conv3d/StatefulPartitionedCall!^conv3d_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ  : : : : 2@
conv3d/StatefulPartitionedCallconv3d/StatefulPartitionedCall2D
 conv3d_1/StatefulPartitionedCall conv3d_1/StatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
ю
ь
,__inference_sequential_2_layer_call_fn_14707

inputs&
unknown:@
	unknown_0:	)
	unknown_1:
	unknown_2:	
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *P
fKRI
G__inference_sequential_2_layer_call_and_return_conditional_losses_14129|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ@
 
_user_specified_nameinputs
Ѕ

C__inference_conv3d_1_layer_call_and_return_conditional_losses_13754

inputs<
conv3d_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identityЂBiasAdd/ReadVariableOpЂConv3D/ReadVariableOp
Conv3D/ReadVariableOpReadVariableOpconv3d_readvariableop_resource**
_output_shapes
:  *
dtype0
Conv3DConv3DinputsConv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0
BiasAddBiasAddConv3D:output:0BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   \
ReluReluBiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   m
IdentityIdentityRelu:activations:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ   : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv3D/ReadVariableOpConv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ   
 
_user_specified_nameinputs
Ќ
Ў
E__inference_sequential_layer_call_and_return_conditional_losses_13461
dense_1_input 
dense_1_13450:	@
dense_1_13452:	 
dense_2_13455:	@
dense_2_13457:@
identityЂdense_1/StatefulPartitionedCallЂdense_2/StatefulPartitionedCallј
dense_1/StatefulPartitionedCallStatefulPartitionedCalldense_1_inputdense_1_13450dense_1_13452*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_13306
dense_2/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0dense_2_13455dense_2_13457*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_13342{
IdentityIdentity(dense_2/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@
NoOpNoOp ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall:Z V
+
_output_shapes
:џџџџџџџџџ@
'
_user_specified_namedense_1_input
К
З
M__inference_transformer_layer_2_layer_call_and_return_conditional_losses_5281

inputsX
Bmulti_head_attention_1_query_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_query_add_readvariableop_resource:@V
@multi_head_attention_1_key_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_1_key_add_readvariableop_resource:@X
Bmulti_head_attention_1_value_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_value_add_readvariableop_resource:@c
Mmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource:@@Q
Cmulti_head_attention_1_attention_output_add_readvariableop_resource:@I
6sequential_1_dense_3_tensordot_readvariableop_resource:	@C
4sequential_1_dense_3_biasadd_readvariableop_resource:	I
6sequential_1_dense_4_tensordot_readvariableop_resource:	@B
4sequential_1_dense_4_biasadd_readvariableop_resource:@
identityЂ:multi_head_attention_1/attention_output/add/ReadVariableOpЂDmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpЂ-multi_head_attention_1/key/add/ReadVariableOpЂ7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpЂ/multi_head_attention_1/query/add/ReadVariableOpЂ9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpЂ/multi_head_attention_1/value/add/ReadVariableOpЂ9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpЂ+sequential_1/dense_3/BiasAdd/ReadVariableOpЂ-sequential_1/dense_3/Tensordot/ReadVariableOpЂ+sequential_1/dense_4/BiasAdd/ReadVariableOpЂ-sequential_1/dense_4/Tensordot/ReadVariableOpР
9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0п
*multi_head_attention_1/query/einsum/EinsumEinsuminputsAmulti_head_attention_1/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЈ
/multi_head_attention_1/query/add/ReadVariableOpReadVariableOp8multi_head_attention_1_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0б
 multi_head_attention_1/query/addAddV23multi_head_attention_1/query/einsum/Einsum:output:07multi_head_attention_1/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@М
7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_1_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0л
(multi_head_attention_1/key/einsum/EinsumEinsuminputs?multi_head_attention_1/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЄ
-multi_head_attention_1/key/add/ReadVariableOpReadVariableOp6multi_head_attention_1_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ы
multi_head_attention_1/key/addAddV21multi_head_attention_1/key/einsum/Einsum:output:05multi_head_attention_1/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@Р
9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0п
*multi_head_attention_1/value/einsum/EinsumEinsuminputsAmulti_head_attention_1/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЈ
/multi_head_attention_1/value/add/ReadVariableOpReadVariableOp8multi_head_attention_1_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0б
 multi_head_attention_1/value/addAddV23multi_head_attention_1/value/einsum/Einsum:output:07multi_head_attention_1/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@a
multi_head_attention_1/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >Ј
multi_head_attention_1/MulMul$multi_head_attention_1/query/add:z:0%multi_head_attention_1/Mul/y:output:0*
T0*/
_output_shapes
:џџџџџџџџџ@д
$multi_head_attention_1/einsum/EinsumEinsum"multi_head_attention_1/key/add:z:0multi_head_attention_1/Mul:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ*
equationaecd,abcd->acbe
&multi_head_attention_1/softmax/SoftmaxSoftmax-multi_head_attention_1/einsum/Einsum:output:0*
T0*/
_output_shapes
:џџџџџџџџџ
'multi_head_attention_1/dropout/IdentityIdentity0multi_head_attention_1/softmax/Softmax:softmax:0*
T0*/
_output_shapes
:џџџџџџџџџъ
&multi_head_attention_1/einsum_1/EinsumEinsum0multi_head_attention_1/dropout/Identity:output:0$multi_head_attention_1/value/add:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationacbe,aecd->abcdж
Dmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpMmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0
5multi_head_attention_1/attention_output/einsum/EinsumEinsum/multi_head_attention_1/einsum_1/Einsum:output:0Lmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:џџџџџџџџџ@*
equationabcd,cde->abeК
:multi_head_attention_1/attention_output/add/ReadVariableOpReadVariableOpCmulti_head_attention_1_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0ю
+multi_head_attention_1/attention_output/addAddV2>multi_head_attention_1/attention_output/einsum/Einsum:output:0Bmulti_head_attention_1/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@{
addAddV2inputs/multi_head_attention_1/attention_output/add:z:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ѕ
-sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0m
#sequential_1/dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:t
#sequential_1/dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       [
$sequential_1/dense_3/Tensordot/ShapeShapeadd:z:0*
T0*
_output_shapes
:n
,sequential_1/dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential_1/dense_3/Tensordot/GatherV2GatherV2-sequential_1/dense_3/Tensordot/Shape:output:0,sequential_1/dense_3/Tensordot/free:output:05sequential_1/dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
.sequential_1/dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
)sequential_1/dense_3/Tensordot/GatherV2_1GatherV2-sequential_1/dense_3/Tensordot/Shape:output:0,sequential_1/dense_3/Tensordot/axes:output:07sequential_1/dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
$sequential_1/dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ­
#sequential_1/dense_3/Tensordot/ProdProd0sequential_1/dense_3/Tensordot/GatherV2:output:0-sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: Г
%sequential_1/dense_3/Tensordot/Prod_1Prod2sequential_1/dense_3/Tensordot/GatherV2_1:output:0/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : №
%sequential_1/dense_3/Tensordot/concatConcatV2,sequential_1/dense_3/Tensordot/free:output:0,sequential_1/dense_3/Tensordot/axes:output:03sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:И
$sequential_1/dense_3/Tensordot/stackPack,sequential_1/dense_3/Tensordot/Prod:output:0.sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Є
(sequential_1/dense_3/Tensordot/transpose	Transposeadd:z:0.sequential_1/dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Щ
&sequential_1/dense_3/Tensordot/ReshapeReshape,sequential_1/dense_3/Tensordot/transpose:y:0-sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЪ
%sequential_1/dense_3/Tensordot/MatMulMatMul/sequential_1/dense_3/Tensordot/Reshape:output:05sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџq
&sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:n
,sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ћ
'sequential_1/dense_3/Tensordot/concat_1ConcatV20sequential_1/dense_3/Tensordot/GatherV2:output:0/sequential_1/dense_3/Tensordot/Const_2:output:05sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:У
sequential_1/dense_3/TensordotReshape/sequential_1/dense_3/Tensordot/MatMul:product:00sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
+sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0М
sequential_1/dense_3/BiasAddBiasAdd'sequential_1/dense_3/Tensordot:output:03sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџd
sequential_1/dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Ќ
sequential_1/dense_3/Gelu/mulMul(sequential_1/dense_3/Gelu/mul/x:output:0%sequential_1/dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџe
 sequential_1/dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?Е
!sequential_1/dense_3/Gelu/truedivRealDiv%sequential_1/dense_3/BiasAdd:output:0)sequential_1/dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
sequential_1/dense_3/Gelu/ErfErf%sequential_1/dense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџd
sequential_1/dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Њ
sequential_1/dense_3/Gelu/addAddV2(sequential_1/dense_3/Gelu/add/x:output:0!sequential_1/dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџЃ
sequential_1/dense_3/Gelu/mul_1Mul!sequential_1/dense_3/Gelu/mul:z:0!sequential_1/dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџЅ
-sequential_1/dense_4/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_4_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0m
#sequential_1/dense_4/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:t
#sequential_1/dense_4/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       w
$sequential_1/dense_4/Tensordot/ShapeShape#sequential_1/dense_3/Gelu/mul_1:z:0*
T0*
_output_shapes
:n
,sequential_1/dense_4/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential_1/dense_4/Tensordot/GatherV2GatherV2-sequential_1/dense_4/Tensordot/Shape:output:0,sequential_1/dense_4/Tensordot/free:output:05sequential_1/dense_4/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
.sequential_1/dense_4/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
)sequential_1/dense_4/Tensordot/GatherV2_1GatherV2-sequential_1/dense_4/Tensordot/Shape:output:0,sequential_1/dense_4/Tensordot/axes:output:07sequential_1/dense_4/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
$sequential_1/dense_4/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ­
#sequential_1/dense_4/Tensordot/ProdProd0sequential_1/dense_4/Tensordot/GatherV2:output:0-sequential_1/dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: Г
%sequential_1/dense_4/Tensordot/Prod_1Prod2sequential_1/dense_4/Tensordot/GatherV2_1:output:0/sequential_1/dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : №
%sequential_1/dense_4/Tensordot/concatConcatV2,sequential_1/dense_4/Tensordot/free:output:0,sequential_1/dense_4/Tensordot/axes:output:03sequential_1/dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:И
$sequential_1/dense_4/Tensordot/stackPack,sequential_1/dense_4/Tensordot/Prod:output:0.sequential_1/dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:С
(sequential_1/dense_4/Tensordot/transpose	Transpose#sequential_1/dense_3/Gelu/mul_1:z:0.sequential_1/dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџЩ
&sequential_1/dense_4/Tensordot/ReshapeReshape,sequential_1/dense_4/Tensordot/transpose:y:0-sequential_1/dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЩ
%sequential_1/dense_4/Tensordot/MatMulMatMul/sequential_1/dense_4/Tensordot/Reshape:output:05sequential_1/dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@p
&sequential_1/dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@n
,sequential_1/dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ћ
'sequential_1/dense_4/Tensordot/concat_1ConcatV20sequential_1/dense_4/Tensordot/GatherV2:output:0/sequential_1/dense_4/Tensordot/Const_2:output:05sequential_1/dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Т
sequential_1/dense_4/TensordotReshape/sequential_1/dense_4/Tensordot/MatMul:product:00sequential_1/dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
+sequential_1/dense_4/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Л
sequential_1/dense_4/BiasAddBiasAdd'sequential_1/dense_4/Tensordot:output:03sequential_1/dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@t
add_1AddV2add:z:0%sequential_1/dense_4/BiasAdd:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ь
NoOpNoOp;^multi_head_attention_1/attention_output/add/ReadVariableOpE^multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp.^multi_head_attention_1/key/add/ReadVariableOp8^multi_head_attention_1/key/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/query/add/ReadVariableOp:^multi_head_attention_1/query/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/value/add/ReadVariableOp:^multi_head_attention_1/value/einsum/Einsum/ReadVariableOp,^sequential_1/dense_3/BiasAdd/ReadVariableOp.^sequential_1/dense_3/Tensordot/ReadVariableOp,^sequential_1/dense_4/BiasAdd/ReadVariableOp.^sequential_1/dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 \
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 2x
:multi_head_attention_1/attention_output/add/ReadVariableOp:multi_head_attention_1/attention_output/add/ReadVariableOp2
Dmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpDmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp2^
-multi_head_attention_1/key/add/ReadVariableOp-multi_head_attention_1/key/add/ReadVariableOp2r
7multi_head_attention_1/key/einsum/Einsum/ReadVariableOp7multi_head_attention_1/key/einsum/Einsum/ReadVariableOp2b
/multi_head_attention_1/query/add/ReadVariableOp/multi_head_attention_1/query/add/ReadVariableOp2v
9multi_head_attention_1/query/einsum/Einsum/ReadVariableOp9multi_head_attention_1/query/einsum/Einsum/ReadVariableOp2b
/multi_head_attention_1/value/add/ReadVariableOp/multi_head_attention_1/value/add/ReadVariableOp2v
9multi_head_attention_1/value/einsum/Einsum/ReadVariableOp9multi_head_attention_1/value/einsum/Einsum/ReadVariableOp2Z
+sequential_1/dense_3/BiasAdd/ReadVariableOp+sequential_1/dense_3/BiasAdd/ReadVariableOp2^
-sequential_1/dense_3/Tensordot/ReadVariableOp-sequential_1/dense_3/Tensordot/ReadVariableOp2Z
+sequential_1/dense_4/BiasAdd/ReadVariableOp+sequential_1/dense_4/BiasAdd/ReadVariableOp2^
-sequential_1/dense_4/Tensordot/ReadVariableOp-sequential_1/dense_4/Tensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
Ю
њ
B__inference_dense_2_layer_call_and_return_conditional_losses_14829

inputs4
!tensordot_readvariableop_resource:	@-
biasadd_readvariableop_resource:@
identityЂBiasAdd/ReadVariableOpЂTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : Л
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : П
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:z
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@[
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ї
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0|
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@c
IdentityIdentityBiasAdd:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Ц
л
%__inference_model_layer_call_fn_12831

inputs%
unknown:
	unknown_0:'
	unknown_1: 
	unknown_2: '
	unknown_3:  
	unknown_4: '
	unknown_5: @
	unknown_6:@'
	unknown_7:@@
	unknown_8:@(
	unknown_9:@

unknown_10:	*

unknown_11:

unknown_12:	

unknown_13:	@

unknown_14:@

unknown_15:@ 

unknown_16:@@

unknown_17:@ 

unknown_18:@@

unknown_19:@ 

unknown_20:@@

unknown_21:@ 

unknown_22:@@

unknown_23:@

unknown_24:	@

unknown_25:	

unknown_26:	@

unknown_27:@ 

unknown_28:@@

unknown_29:@ 

unknown_30:@@

unknown_31:@ 

unknown_32:@@

unknown_33:@ 

unknown_34:@@

unknown_35:@

unknown_36:	@

unknown_37:	

unknown_38:	@

unknown_39:@

unknown_40:


unknown_41:	

unknown_42:	

unknown_43:
identityЂStatefulPartitionedCallЉ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43*9
Tin2
02.*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*O
_read_only_resource_inputs1
/-	
 !"#$%&'()*+,-*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_12136o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes{
y:џџџџџџџџџ  : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
Ю
њ
B__inference_dense_4_layer_call_and_return_conditional_losses_14915

inputs4
!tensordot_readvariableop_resource:	@-
biasadd_readvariableop_resource:@
identityЂBiasAdd/ReadVariableOpЂTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : Л
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : П
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:z
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@[
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ї
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0|
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@c
IdentityIdentityBiasAdd:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
ѕ
ы
*__inference_sequential_layer_call_fn_13845
conv3d_input%
unknown: 
	unknown_0: '
	unknown_1:  
	unknown_2: 
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallconv3d_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ   *&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_13821{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ  : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:a ]
3
_output_shapes!
:џџџџџџџџџ  
&
_user_specified_nameconv3d_input
Ф

'__inference_dense_6_layer_call_fn_13708

inputs
unknown:	
	unknown_0:
identityЂStatefulPartitionedCallк
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_6_layer_call_and_return_conditional_losses_11715o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:џџџџџџџџџ: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Щ
м
%__inference_model_layer_call_fn_12324
input_1%
unknown:
	unknown_0:'
	unknown_1: 
	unknown_2: '
	unknown_3:  
	unknown_4: '
	unknown_5: @
	unknown_6:@'
	unknown_7:@@
	unknown_8:@(
	unknown_9:@

unknown_10:	*

unknown_11:

unknown_12:	

unknown_13:	@

unknown_14:@

unknown_15:@ 

unknown_16:@@

unknown_17:@ 

unknown_18:@@

unknown_19:@ 

unknown_20:@@

unknown_21:@ 

unknown_22:@@

unknown_23:@

unknown_24:	@

unknown_25:	

unknown_26:	@

unknown_27:@ 

unknown_28:@@

unknown_29:@ 

unknown_30:@@

unknown_31:@ 

unknown_32:@@

unknown_33:@ 

unknown_34:@@

unknown_35:@

unknown_36:	@

unknown_37:	

unknown_38:	@

unknown_39:@

unknown_40:


unknown_41:	

unknown_42:	

unknown_43:
identityЂStatefulPartitionedCallЊ
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43*9
Tin2
02.*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*O
_read_only_resource_inputs1
/-	
 !"#$%&'()*+,-*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_12136o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes{
y:џџџџџџџџџ  : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
3
_output_shapes!
:џџџџџџџџџ  
!
_user_specified_name	input_1
з
f
J__inference_max_pooling3d_1_layer_call_and_return_conditional_losses_13126

inputs
identityН
	MaxPool3D	MaxPool3Dinputs*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ*
ksize	
*
paddingSAME*
strides	

IdentityIdentityMaxPool3D:output:0*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ: {
W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
д

'__inference_dense_4_layer_call_fn_14885

inputs
unknown:	@
	unknown_0:@
identityЂStatefulPartitionedCallо
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_13542s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:џџџџџџџџџ: : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
ь
Ф
G__inference_sequential_1_layer_call_and_return_conditional_losses_13915

inputs,
conv3d_2_13892: @
conv3d_2_13894:@,
conv3d_3_13909:@@
conv3d_3_13911:@
identityЂ conv3d_2/StatefulPartitionedCallЂ conv3d_3/StatefulPartitionedCallќ
 conv3d_2/StatefulPartitionedCallStatefulPartitionedCallinputsconv3d_2_13892conv3d_2_13894*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_2_layer_call_and_return_conditional_losses_13891
 conv3d_3/StatefulPartitionedCallStatefulPartitionedCall)conv3d_2/StatefulPartitionedCall:output:0conv3d_3_13909conv3d_3_13911*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_3_layer_call_and_return_conditional_losses_13908
IdentityIdentity)conv3d_3/StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@
NoOpNoOp!^conv3d_2/StatefulPartitionedCall!^conv3d_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ : : : : 2D
 conv3d_2/StatefulPartitionedCall conv3d_2/StatefulPartitionedCall2D
 conv3d_3/StatefulPartitionedCall conv3d_3/StatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ 
 
_user_specified_nameinputs
њo
ѕ
C__inference_encoder3d_layer_call_and_return_conditional_losses_2972

inputsW
9spatial_attention_conv3d_6_conv3d_readvariableop_resource:H
:spatial_attention_conv3d_6_biasadd_readvariableop_resource:[
=conv2_plus1d_sequential_conv3d_conv3d_readvariableop_resource: L
>conv2_plus1d_sequential_conv3d_biasadd_readvariableop_resource: ]
?conv2_plus1d_sequential_conv3d_1_conv3d_readvariableop_resource:  N
@conv2_plus1d_sequential_conv3d_1_biasadd_readvariableop_resource: a
Cconv2_plus1d_1_sequential_1_conv3d_2_conv3d_readvariableop_resource: @R
Dconv2_plus1d_1_sequential_1_conv3d_2_biasadd_readvariableop_resource:@a
Cconv2_plus1d_1_sequential_1_conv3d_3_conv3d_readvariableop_resource:@@R
Dconv2_plus1d_1_sequential_1_conv3d_3_biasadd_readvariableop_resource:@b
Cconv2_plus1d_2_sequential_2_conv3d_4_conv3d_readvariableop_resource:@S
Dconv2_plus1d_2_sequential_2_conv3d_4_biasadd_readvariableop_resource:	c
Cconv2_plus1d_2_sequential_2_conv3d_5_conv3d_readvariableop_resource:S
Dconv2_plus1d_2_sequential_2_conv3d_5_biasadd_readvariableop_resource:	
identityЂ5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOpЂ4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOpЂ7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOpЂ6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOpЂ;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOpЂ:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOpЂ;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOpЂ:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOpЂ;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOpЂ:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOpЂ;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOpЂ:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOpЂ1spatial_attention/conv3d_6/BiasAdd/ReadVariableOpЂ0spatial_attention/conv3d_6/Conv3D/ReadVariableOpЖ
0spatial_attention/conv3d_6/Conv3D/ReadVariableOpReadVariableOp9spatial_attention_conv3d_6_conv3d_readvariableop_resource**
_output_shapes
:*
dtype0д
!spatial_attention/conv3d_6/Conv3DConv3Dinputs8spatial_attention/conv3d_6/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ  *
paddingSAME*
strides	
Ј
1spatial_attention/conv3d_6/BiasAdd/ReadVariableOpReadVariableOp:spatial_attention_conv3d_6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0в
"spatial_attention/conv3d_6/BiasAddBiasAdd*spatial_attention/conv3d_6/Conv3D:output:09spatial_attention/conv3d_6/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ  j
%spatial_attention/conv3d_6/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Х
#spatial_attention/conv3d_6/Gelu/mulMul.spatial_attention/conv3d_6/Gelu/mul/x:output:0+spatial_attention/conv3d_6/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ  k
&spatial_attention/conv3d_6/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?Ю
'spatial_attention/conv3d_6/Gelu/truedivRealDiv+spatial_attention/conv3d_6/BiasAdd:output:0/spatial_attention/conv3d_6/Gelu/Cast/x:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ  
#spatial_attention/conv3d_6/Gelu/ErfErf+spatial_attention/conv3d_6/Gelu/truediv:z:0*
T0*3
_output_shapes!
:џџџџџџџџџ  j
%spatial_attention/conv3d_6/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?У
#spatial_attention/conv3d_6/Gelu/addAddV2.spatial_attention/conv3d_6/Gelu/add/x:output:0'spatial_attention/conv3d_6/Gelu/Erf:y:0*
T0*3
_output_shapes!
:џџџџџџџџџ  М
%spatial_attention/conv3d_6/Gelu/mul_1Mul'spatial_attention/conv3d_6/Gelu/mul:z:0'spatial_attention/conv3d_6/Gelu/add:z:0*
T0*3
_output_shapes!
:џџџџџџџџџ  
spatial_attention/multiply/mulMulinputs)spatial_attention/conv3d_6/Gelu/mul_1:z:0*
T0*3
_output_shapes!
:џџџџџџџџџ  О
4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOpReadVariableOp=conv2_plus1d_sequential_conv3d_conv3d_readvariableop_resource**
_output_shapes
: *
dtype0ј
%conv2_plus1d/sequential/conv3d/Conv3DConv3D"spatial_attention/multiply/mul:z:0<conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	
А
5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOpReadVariableOp>conv2_plus1d_sequential_conv3d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0о
&conv2_plus1d/sequential/conv3d/BiasAddBiasAdd.conv2_plus1d/sequential/conv3d/Conv3D:output:0=conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   
#conv2_plus1d/sequential/conv3d/ReluRelu/conv2_plus1d/sequential/conv3d/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   Т
6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOpReadVariableOp?conv2_plus1d_sequential_conv3d_1_conv3d_readvariableop_resource**
_output_shapes
:  *
dtype0
'conv2_plus1d/sequential/conv3d_1/Conv3DConv3D1conv2_plus1d/sequential/conv3d/Relu:activations:0>conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	
Д
7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOpReadVariableOp@conv2_plus1d_sequential_conv3d_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ф
(conv2_plus1d/sequential/conv3d_1/BiasAddBiasAdd0conv2_plus1d/sequential/conv3d_1/Conv3D:output:0?conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   
%conv2_plus1d/sequential/conv3d_1/ReluRelu1conv2_plus1d/sequential/conv3d_1/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   д
max_pooling3d/MaxPool3D	MaxPool3D3conv2_plus1d/sequential/conv3d_1/Relu:activations:0*
T0*3
_output_shapes!
:џџџџџџџџџ *
ksize	
*
paddingSAME*
strides	
Ъ
:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_1_sequential_1_conv3d_2_conv3d_readvariableop_resource**
_output_shapes
: @*
dtype0
+conv2_plus1d_1/sequential_1/conv3d_2/Conv3DConv3D max_pooling3d/MaxPool3D:output:0Bconv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	
М
;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_1_sequential_1_conv3d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0№
,conv2_plus1d_1/sequential_1/conv3d_2/BiasAddBiasAdd4conv2_plus1d_1/sequential_1/conv3d_2/Conv3D:output:0Cconv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@І
)conv2_plus1d_1/sequential_1/conv3d_2/ReluRelu5conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@Ъ
:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_1_sequential_1_conv3d_3_conv3d_readvariableop_resource**
_output_shapes
:@@*
dtype0
+conv2_plus1d_1/sequential_1/conv3d_3/Conv3DConv3D7conv2_plus1d_1/sequential_1/conv3d_2/Relu:activations:0Bconv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	
М
;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_1_sequential_1_conv3d_3_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0№
,conv2_plus1d_1/sequential_1/conv3d_3/BiasAddBiasAdd4conv2_plus1d_1/sequential_1/conv3d_3/Conv3D:output:0Cconv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@І
)conv2_plus1d_1/sequential_1/conv3d_3/ReluRelu5conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@к
max_pooling3d_1/MaxPool3D	MaxPool3D7conv2_plus1d_1/sequential_1/conv3d_3/Relu:activations:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
ksize	
*
paddingSAME*
strides	
Ы
:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_2_sequential_2_conv3d_4_conv3d_readvariableop_resource*+
_output_shapes
:@*
dtype0
+conv2_plus1d_2/sequential_2/conv3d_4/Conv3DConv3D"max_pooling3d_1/MaxPool3D:output:0Bconv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	
Н
;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_2_sequential_2_conv3d_4_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0ё
,conv2_plus1d_2/sequential_2/conv3d_4/BiasAddBiasAdd4conv2_plus1d_2/sequential_2/conv3d_4/Conv3D:output:0Cconv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџЇ
)conv2_plus1d_2/sequential_2/conv3d_4/ReluRelu5conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџЬ
:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_2_sequential_2_conv3d_5_conv3d_readvariableop_resource*,
_output_shapes
:*
dtype0
+conv2_plus1d_2/sequential_2/conv3d_5/Conv3DConv3D7conv2_plus1d_2/sequential_2/conv3d_4/Relu:activations:0Bconv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	
Н
;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_2_sequential_2_conv3d_5_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0ё
,conv2_plus1d_2/sequential_2/conv3d_5/BiasAddBiasAdd4conv2_plus1d_2/sequential_2/conv3d_5/Conv3D:output:0Cconv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџЇ
)conv2_plus1d_2/sequential_2/conv3d_5/ReluRelu5conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџл
max_pooling3d_2/MaxPool3D	MaxPool3D7conv2_plus1d_2/sequential_2/conv3d_5/Relu:activations:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
ksize	
*
paddingSAME*
strides	
ћ
NoOpNoOp6^conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp5^conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp8^conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp7^conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp<^conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp;^conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp<^conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp;^conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp<^conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp;^conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp<^conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp;^conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp2^spatial_attention/conv3d_6/BiasAdd/ReadVariableOp1^spatial_attention/conv3d_6/Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ~
IdentityIdentity"max_pooling3d_2/MaxPool3D:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:џџџџџџџџџ  : : : : : : : : : : : : : : 2n
5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp2l
4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp2r
7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp2p
6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp2z
;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp2x
:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp2z
;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp2x
:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp2z
;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp2x
:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp2z
;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp2x
:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp2f
1spatial_attention/conv3d_6/BiasAdd/ReadVariableOp1spatial_attention/conv3d_6/BiasAdd/ReadVariableOp2d
0spatial_attention/conv3d_6/Conv3D/ReadVariableOp0spatial_attention/conv3d_6/Conv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
Т
і
B__inference_dense_5_layer_call_and_return_conditional_losses_11698

inputs2
matmul_readvariableop_resource:
.
biasadd_readvariableop_resource:	
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџO

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?i
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*(
_output_shapes
:џџџџџџџџџP
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?r
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*(
_output_shapes
:џџџџџџџџџT
Gelu/ErfErfGelu/truediv:z:0*
T0*(
_output_shapes
:џџџџџџџџџO

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?g
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*(
_output_shapes
:џџџџџџџџџ`

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*(
_output_shapes
:џџџџџџџџџ^
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*(
_output_shapes
:џџџџџџџџџw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Д
ђ
@__inference_dense_layer_call_and_return_conditional_losses_11516

inputs1
matmul_readvariableop_resource:	@-
biasadd_readvariableop_resource:@
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@O

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?h
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ@P
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?q
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*'
_output_shapes
:џџџџџџџџџ@S
Gelu/ErfErfGelu/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџ@O

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?f
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*'
_output_shapes
:џџџџџџџџџ@_

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*'
_output_shapes
:џџџџџџџџџ@]
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ@w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Х
р
E__inference_sequential_layer_call_and_return_conditional_losses_14601

inputsC
%conv3d_conv3d_readvariableop_resource: 4
&conv3d_biasadd_readvariableop_resource: E
'conv3d_1_conv3d_readvariableop_resource:  6
(conv3d_1_biasadd_readvariableop_resource: 
identityЂconv3d/BiasAdd/ReadVariableOpЂconv3d/Conv3D/ReadVariableOpЂconv3d_1/BiasAdd/ReadVariableOpЂconv3d_1/Conv3D/ReadVariableOp
conv3d/Conv3D/ReadVariableOpReadVariableOp%conv3d_conv3d_readvariableop_resource**
_output_shapes
: *
dtype0Ќ
conv3d/Conv3DConv3Dinputs$conv3d/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	

conv3d/BiasAdd/ReadVariableOpReadVariableOp&conv3d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0
conv3d/BiasAddBiasAddconv3d/Conv3D:output:0%conv3d/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   j
conv3d/ReluReluconv3d/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   
conv3d_1/Conv3D/ReadVariableOpReadVariableOp'conv3d_1_conv3d_readvariableop_resource**
_output_shapes
:  *
dtype0У
conv3d_1/Conv3DConv3Dconv3d/Relu:activations:0&conv3d_1/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	

conv3d_1/BiasAdd/ReadVariableOpReadVariableOp(conv3d_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0
conv3d_1/BiasAddBiasAddconv3d_1/Conv3D:output:0'conv3d_1/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   n
conv3d_1/ReluReluconv3d_1/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   v
IdentityIdentityconv3d_1/Relu:activations:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   Ш
NoOpNoOp^conv3d/BiasAdd/ReadVariableOp^conv3d/Conv3D/ReadVariableOp ^conv3d_1/BiasAdd/ReadVariableOp^conv3d_1/Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ  : : : : 2>
conv3d/BiasAdd/ReadVariableOpconv3d/BiasAdd/ReadVariableOp2<
conv3d/Conv3D/ReadVariableOpconv3d/Conv3D/ReadVariableOp2B
conv3d_1/BiasAdd/ReadVariableOpconv3d_1/BiasAdd/ReadVariableOp2@
conv3d_1/Conv3D/ReadVariableOpconv3d_1/Conv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
Д
ђ
@__inference_dense_layer_call_and_return_conditional_losses_14249

inputs1
matmul_readvariableop_resource:	@-
biasadd_readvariableop_resource:@
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@O

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?h
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ@P
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?q
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*'
_output_shapes
:џџџџџџџџџ@S
Gelu/ErfErfGelu/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџ@O

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?f
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*'
_output_shapes
:џџџџџџџџџ@_

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*'
_output_shapes
:џџџџџџџџџ@]
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ@w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
У
з
*__inference_sequential_layer_call_fn_13360
dense_1_input
unknown:	@
	unknown_0:	
	unknown_1:	@
	unknown_2:@
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCalldense_1_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_13349s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Z V
+
_output_shapes
:џџџџџџџџџ@
'
_user_specified_namedense_1_input
Њ
E
)__inference_flatten_1_layer_call_fn_13666

inputs
identityГ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_flatten_1_layer_call_and_return_conditional_losses_11678a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ@:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
њ
g
K__inference_time_distributed_layer_call_and_return_conditional_losses_13168

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:б
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"џџџџ         m
ReshapeReshapeinputsReshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџ^
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   w
flatten/ReshapeReshapeReshape:output:0flatten/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџ\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџT
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value
B :
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:
	Reshape_1Reshapeflatten/Reshape:output:0Reshape_1/shape:output:0*
T0*5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџh
IdentityIdentityReshape_1:output:0*
T0*5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'џџџџџџџџџџџџџџџџџџ:e a
=
_output_shapes+
):'џџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs

|
(__inference_restored_function_body_11291

inputs
unknown:@
identityЂStatefulPartitionedCallТ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*+
_output_shapes
:џџџџџџџџџ@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *[
fVRT
R__inference_frame_position_embedding_layer_call_and_return_conditional_losses_3199s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*,
_input_shapes
:џџџџџџџџџ@: 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs

Љ
G__inference_sequential_1_layer_call_and_return_conditional_losses_13609

inputs 
dense_3_13598:	@
dense_3_13600:	 
dense_4_13603:	@
dense_4_13605:@
identityЂdense_3/StatefulPartitionedCallЂdense_4/StatefulPartitionedCallё
dense_3/StatefulPartitionedCallStatefulPartitionedCallinputsdense_3_13598dense_3_13600*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_13506
dense_4/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0dense_4_13603dense_4_13605*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_13542{
IdentityIdentity(dense_4/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@
NoOpNoOp ^dense_3/StatefulPartitionedCall ^dense_4/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
Щ
м
%__inference_model_layer_call_fn_11815
input_1%
unknown:
	unknown_0:'
	unknown_1: 
	unknown_2: '
	unknown_3:  
	unknown_4: '
	unknown_5: @
	unknown_6:@'
	unknown_7:@@
	unknown_8:@(
	unknown_9:@

unknown_10:	*

unknown_11:

unknown_12:	

unknown_13:	@

unknown_14:@

unknown_15:@ 

unknown_16:@@

unknown_17:@ 

unknown_18:@@

unknown_19:@ 

unknown_20:@@

unknown_21:@ 

unknown_22:@@

unknown_23:@

unknown_24:	@

unknown_25:	

unknown_26:	@

unknown_27:@ 

unknown_28:@@

unknown_29:@ 

unknown_30:@@

unknown_31:@ 

unknown_32:@@

unknown_33:@ 

unknown_34:@@

unknown_35:@

unknown_36:	@

unknown_37:	

unknown_38:	@

unknown_39:@

unknown_40:


unknown_41:	

unknown_42:	

unknown_43:
identityЂStatefulPartitionedCallЊ
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43*9
Tin2
02.*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*O
_read_only_resource_inputs1
/-	
 !"#$%&'()*+,-*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_11722o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes{
y:џџџџџџџџџ  : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
3
_output_shapes!
:џџџџџџџџџ  
!
_user_specified_name	input_1
Ў
а
*__inference_sequential_layer_call_fn_14262

inputs
unknown:	@
	unknown_0:	
	unknown_1:	@
	unknown_2:@
identityЂStatefulPartitionedCallћ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_13349s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
з
f
J__inference_max_pooling3d_2_layer_call_and_return_conditional_losses_14211

inputs
identityН
	MaxPool3D	MaxPool3Dinputs*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ*
ksize	
*
paddingSAME*
strides	

IdentityIdentityMaxPool3D:output:0*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ: {
W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
ћ

&__inference_conv3d_layer_call_fn_14924

inputs%
unknown: 
	unknown_0: 
identityЂStatefulPartitionedCallх
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ   *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *J
fERC
A__inference_conv3d_layer_call_and_return_conditional_losses_13737{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ  : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
Ю
њ
B__inference_dense_4_layer_call_and_return_conditional_losses_13542

inputs4
!tensordot_readvariableop_resource:	@-
biasadd_readvariableop_resource:@
identityЂBiasAdd/ReadVariableOpЂTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : Л
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : П
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:z
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@[
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ї
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0|
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@c
IdentityIdentityBiasAdd:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
џD
з
E__inference_sequential_layer_call_and_return_conditional_losses_14403

inputs<
)dense_1_tensordot_readvariableop_resource:	@6
'dense_1_biasadd_readvariableop_resource:	<
)dense_2_tensordot_readvariableop_resource:	@5
'dense_2_biasadd_readvariableop_resource:@
identityЂdense_1/BiasAdd/ReadVariableOpЂ dense_1/Tensordot/ReadVariableOpЂdense_2/BiasAdd/ReadVariableOpЂ dense_2/Tensordot/ReadVariableOp
 dense_1/Tensordot/ReadVariableOpReadVariableOp)dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0`
dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       M
dense_1/Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:a
dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : л
dense_1/Tensordot/GatherV2GatherV2 dense_1/Tensordot/Shape:output:0dense_1/Tensordot/free:output:0(dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : п
dense_1/Tensordot/GatherV2_1GatherV2 dense_1/Tensordot/Shape:output:0dense_1/Tensordot/axes:output:0*dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
dense_1/Tensordot/ProdProd#dense_1/Tensordot/GatherV2:output:0 dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 
dense_1/Tensordot/Prod_1Prod%dense_1/Tensordot/GatherV2_1:output:0"dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : М
dense_1/Tensordot/concatConcatV2dense_1/Tensordot/free:output:0dense_1/Tensordot/axes:output:0&dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:
dense_1/Tensordot/stackPackdense_1/Tensordot/Prod:output:0!dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:
dense_1/Tensordot/transpose	Transposeinputs!dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ђ
dense_1/Tensordot/ReshapeReshapedense_1/Tensordot/transpose:y:0 dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЃ
dense_1/Tensordot/MatMulMatMul"dense_1/Tensordot/Reshape:output:0(dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџd
dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:a
dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ч
dense_1/Tensordot/concat_1ConcatV2#dense_1/Tensordot/GatherV2:output:0"dense_1/Tensordot/Const_2:output:0(dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
dense_1/TensordotReshape"dense_1/Tensordot/MatMul:product:0#dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
dense_1/BiasAddBiasAdddense_1/Tensordot:output:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџW
dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?
dense_1/Gelu/mulMuldense_1/Gelu/mul/x:output:0dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџX
dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?
dense_1/Gelu/truedivRealDivdense_1/BiasAdd:output:0dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџh
dense_1/Gelu/ErfErfdense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџW
dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
dense_1/Gelu/addAddV2dense_1/Gelu/add/x:output:0dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџ|
dense_1/Gelu/mul_1Muldense_1/Gelu/mul:z:0dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџ
 dense_2/Tensordot/ReadVariableOpReadVariableOp)dense_2_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0`
dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ]
dense_2/Tensordot/ShapeShapedense_1/Gelu/mul_1:z:0*
T0*
_output_shapes
:a
dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : л
dense_2/Tensordot/GatherV2GatherV2 dense_2/Tensordot/Shape:output:0dense_2/Tensordot/free:output:0(dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : п
dense_2/Tensordot/GatherV2_1GatherV2 dense_2/Tensordot/Shape:output:0dense_2/Tensordot/axes:output:0*dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
dense_2/Tensordot/ProdProd#dense_2/Tensordot/GatherV2:output:0 dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 
dense_2/Tensordot/Prod_1Prod%dense_2/Tensordot/GatherV2_1:output:0"dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : М
dense_2/Tensordot/concatConcatV2dense_2/Tensordot/free:output:0dense_2/Tensordot/axes:output:0&dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:
dense_2/Tensordot/stackPackdense_2/Tensordot/Prod:output:0!dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:
dense_2/Tensordot/transpose	Transposedense_1/Gelu/mul_1:z:0!dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџЂ
dense_2/Tensordot/ReshapeReshapedense_2/Tensordot/transpose:y:0 dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЂ
dense_2/Tensordot/MatMulMatMul"dense_2/Tensordot/Reshape:output:0(dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@c
dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@a
dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ч
dense_2/Tensordot/concat_1ConcatV2#dense_2/Tensordot/GatherV2:output:0"dense_2/Tensordot/Const_2:output:0(dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
dense_2/TensordotReshape"dense_2/Tensordot/MatMul:product:0#dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
dense_2/BiasAddBiasAdddense_2/Tensordot:output:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@k
IdentityIdentitydense_2/BiasAdd:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@Ю
NoOpNoOp^dense_1/BiasAdd/ReadVariableOp!^dense_1/Tensordot/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp!^dense_2/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2D
 dense_1/Tensordot/ReadVariableOp dense_1/Tensordot/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2D
 dense_2/Tensordot/ReadVariableOp dense_2/Tensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
О
`
D__inference_flatten_1_layer_call_and_return_conditional_losses_11678

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:џџџџџџџџџY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ@:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
Ђ

є
B__inference_dense_6_layer_call_and_return_conditional_losses_11715

inputs1
matmul_readvariableop_resource:	-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџV
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ`
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
Ќ
Э
2__inference_transformer_layer_1_layer_call_fn_3699

inputs
unknown:@@
	unknown_0:@
	unknown_1:@@
	unknown_2:@
	unknown_3:@@
	unknown_4:@
	unknown_5:@@
	unknown_6:@
	unknown_7:	@
	unknown_8:	
	unknown_9:	@

unknown_10:@
identityЂStatefulPartitionedCallь
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *V
fQRO
M__inference_transformer_layer_1_layer_call_and_return_conditional_losses_3682`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs

У
(__inference_restored_function_body_11323

inputs
unknown:@@
	unknown_0:@
	unknown_1:@@
	unknown_2:@
	unknown_3:@@
	unknown_4:@
	unknown_5:@@
	unknown_6:@
	unknown_7:	@
	unknown_8:	
	unknown_9:	@

unknown_10:@
identityЂStatefulPartitionedCallЭ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *V
fQRO
M__inference_transformer_layer_1_layer_call_and_return_conditional_losses_2344s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
е
d
H__inference_max_pooling3d_layer_call_and_return_conditional_losses_14191

inputs
identityН
	MaxPool3D	MaxPool3Dinputs*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ*
ksize	
*
paddingSAME*
strides	

IdentityIdentityMaxPool3D:output:0*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ: {
W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
Ю
њ
B__inference_dense_2_layer_call_and_return_conditional_losses_13342

inputs4
!tensordot_readvariableop_resource:	@-
biasadd_readvariableop_resource:@
identityЂBiasAdd/ReadVariableOpЂTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : Л
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : П
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:z
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@[
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ї
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0|
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@c
IdentityIdentityBiasAdd:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs

Љ
G__inference_sequential_1_layer_call_and_return_conditional_losses_13549

inputs 
dense_3_13507:	@
dense_3_13509:	 
dense_4_13543:	@
dense_4_13545:@
identityЂdense_3/StatefulPartitionedCallЂdense_4/StatefulPartitionedCallё
dense_3/StatefulPartitionedCallStatefulPartitionedCallinputsdense_3_13507dense_3_13509*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_13506
dense_4/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0dense_4_13543dense_4_13545*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_13542{
IdentityIdentity(dense_4/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@
NoOpNoOp ^dense_3/StatefulPartitionedCall ^dense_4/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
њ
g
K__inference_time_distributed_layer_call_and_return_conditional_losses_13185

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:б
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"џџџџ         m
ReshapeReshapeinputsReshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџ^
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   w
flatten/ReshapeReshapeReshape:output:0flatten/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџ\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџT
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value
B :
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:
	Reshape_1Reshapeflatten/Reshape:output:0Reshape_1/shape:output:0*
T0*5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџh
IdentityIdentityReshape_1:output:0*
T0*5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'џџџџџџџџџџџџџџџџџџ:e a
=
_output_shapes+
):'џџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
ѕ
ы
*__inference_sequential_layer_call_fn_13772
conv3d_input%
unknown: 
	unknown_0: '
	unknown_1:  
	unknown_2: 
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallconv3d_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ   *&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_13761{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ  : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:a ]
3
_output_shapes!
:џџџџџџџџџ  
&
_user_specified_nameconv3d_input
н

M__inference_transformer_layer_1_layer_call_and_return_conditional_losses_3682

inputsV
@multi_head_attention_query_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_query_add_readvariableop_resource:@T
>multi_head_attention_key_einsum_einsum_readvariableop_resource:@@F
4multi_head_attention_key_add_readvariableop_resource:@V
@multi_head_attention_value_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_value_add_readvariableop_resource:@a
Kmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource:@@O
Amulti_head_attention_attention_output_add_readvariableop_resource:@G
4sequential_dense_1_tensordot_readvariableop_resource:	@A
2sequential_dense_1_biasadd_readvariableop_resource:	G
4sequential_dense_2_tensordot_readvariableop_resource:	@@
2sequential_dense_2_biasadd_readvariableop_resource:@
identityЂ8multi_head_attention/attention_output/add/ReadVariableOpЂBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpЂ+multi_head_attention/key/add/ReadVariableOpЂ5multi_head_attention/key/einsum/Einsum/ReadVariableOpЂ-multi_head_attention/query/add/ReadVariableOpЂ7multi_head_attention/query/einsum/Einsum/ReadVariableOpЂ-multi_head_attention/value/add/ReadVariableOpЂ7multi_head_attention/value/einsum/Einsum/ReadVariableOpЂ)sequential/dense_1/BiasAdd/ReadVariableOpЂ+sequential/dense_1/Tensordot/ReadVariableOpЂ)sequential/dense_2/BiasAdd/ReadVariableOpЂ+sequential/dense_2/Tensordot/ReadVariableOpМ
7multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0л
(multi_head_attention/query/einsum/EinsumEinsuminputs?multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЄ
-multi_head_attention/query/add/ReadVariableOpReadVariableOp6multi_head_attention_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ы
multi_head_attention/query/addAddV21multi_head_attention/query/einsum/Einsum:output:05multi_head_attention/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@И
5multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOp>multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0з
&multi_head_attention/key/einsum/EinsumEinsuminputs=multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abde 
+multi_head_attention/key/add/ReadVariableOpReadVariableOp4multi_head_attention_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Х
multi_head_attention/key/addAddV2/multi_head_attention/key/einsum/Einsum:output:03multi_head_attention/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@М
7multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0л
(multi_head_attention/value/einsum/EinsumEinsuminputs?multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЄ
-multi_head_attention/value/add/ReadVariableOpReadVariableOp6multi_head_attention_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ы
multi_head_attention/value/addAddV21multi_head_attention/value/einsum/Einsum:output:05multi_head_attention/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@_
multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >Ђ
multi_head_attention/MulMul"multi_head_attention/query/add:z:0#multi_head_attention/Mul/y:output:0*
T0*/
_output_shapes
:џџџџџџџџџ@Ю
"multi_head_attention/einsum/EinsumEinsum multi_head_attention/key/add:z:0multi_head_attention/Mul:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ*
equationaecd,abcd->acbe
$multi_head_attention/softmax/SoftmaxSoftmax+multi_head_attention/einsum/Einsum:output:0*
T0*/
_output_shapes
:џџџџџџџџџ
%multi_head_attention/dropout/IdentityIdentity.multi_head_attention/softmax/Softmax:softmax:0*
T0*/
_output_shapes
:џџџџџџџџџф
$multi_head_attention/einsum_1/EinsumEinsum.multi_head_attention/dropout/Identity:output:0"multi_head_attention/value/add:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationacbe,aecd->abcdв
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpKmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0
3multi_head_attention/attention_output/einsum/EinsumEinsum-multi_head_attention/einsum_1/Einsum:output:0Jmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:џџџџџџџџџ@*
equationabcd,cde->abeЖ
8multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpAmulti_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0ш
)multi_head_attention/attention_output/addAddV2<multi_head_attention/attention_output/einsum/Einsum:output:0@multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@y
addAddV2inputs-multi_head_attention/attention_output/add:z:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ё
+sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0k
!sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:r
!sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Y
"sequential/dense_1/Tensordot/ShapeShapeadd:z:0*
T0*
_output_shapes
:l
*sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
%sequential/dense_1/Tensordot/GatherV2GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/free:output:03sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
,sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential/dense_1/Tensordot/GatherV2_1GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/axes:output:05sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
"sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: Ї
!sequential/dense_1/Tensordot/ProdProd.sequential/dense_1/Tensordot/GatherV2:output:0+sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ­
#sequential/dense_1/Tensordot/Prod_1Prod0sequential/dense_1/Tensordot/GatherV2_1:output:0-sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ш
#sequential/dense_1/Tensordot/concatConcatV2*sequential/dense_1/Tensordot/free:output:0*sequential/dense_1/Tensordot/axes:output:01sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:В
"sequential/dense_1/Tensordot/stackPack*sequential/dense_1/Tensordot/Prod:output:0,sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
: 
&sequential/dense_1/Tensordot/transpose	Transposeadd:z:0,sequential/dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@У
$sequential/dense_1/Tensordot/ReshapeReshape*sequential/dense_1/Tensordot/transpose:y:0+sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџФ
#sequential/dense_1/Tensordot/MatMulMatMul-sequential/dense_1/Tensordot/Reshape:output:03sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџo
$sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:l
*sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ѓ
%sequential/dense_1/Tensordot/concat_1ConcatV2.sequential/dense_1/Tensordot/GatherV2:output:0-sequential/dense_1/Tensordot/Const_2:output:03sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Н
sequential/dense_1/TensordotReshape-sequential/dense_1/Tensordot/MatMul:product:0.sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0Ж
sequential/dense_1/BiasAddBiasAdd%sequential/dense_1/Tensordot:output:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџb
sequential/dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?І
sequential/dense_1/Gelu/mulMul&sequential/dense_1/Gelu/mul/x:output:0#sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџc
sequential/dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?Џ
sequential/dense_1/Gelu/truedivRealDiv#sequential/dense_1/BiasAdd:output:0'sequential/dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџ~
sequential/dense_1/Gelu/ErfErf#sequential/dense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџb
sequential/dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Є
sequential/dense_1/Gelu/addAddV2&sequential/dense_1/Gelu/add/x:output:0sequential/dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџ
sequential/dense_1/Gelu/mul_1Mulsequential/dense_1/Gelu/mul:z:0sequential/dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџЁ
+sequential/dense_2/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_2_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0k
!sequential/dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:r
!sequential/dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       s
"sequential/dense_2/Tensordot/ShapeShape!sequential/dense_1/Gelu/mul_1:z:0*
T0*
_output_shapes
:l
*sequential/dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
%sequential/dense_2/Tensordot/GatherV2GatherV2+sequential/dense_2/Tensordot/Shape:output:0*sequential/dense_2/Tensordot/free:output:03sequential/dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
,sequential/dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential/dense_2/Tensordot/GatherV2_1GatherV2+sequential/dense_2/Tensordot/Shape:output:0*sequential/dense_2/Tensordot/axes:output:05sequential/dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
"sequential/dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: Ї
!sequential/dense_2/Tensordot/ProdProd.sequential/dense_2/Tensordot/GatherV2:output:0+sequential/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ­
#sequential/dense_2/Tensordot/Prod_1Prod0sequential/dense_2/Tensordot/GatherV2_1:output:0-sequential/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ш
#sequential/dense_2/Tensordot/concatConcatV2*sequential/dense_2/Tensordot/free:output:0*sequential/dense_2/Tensordot/axes:output:01sequential/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:В
"sequential/dense_2/Tensordot/stackPack*sequential/dense_2/Tensordot/Prod:output:0,sequential/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Л
&sequential/dense_2/Tensordot/transpose	Transpose!sequential/dense_1/Gelu/mul_1:z:0,sequential/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџУ
$sequential/dense_2/Tensordot/ReshapeReshape*sequential/dense_2/Tensordot/transpose:y:0+sequential/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџУ
#sequential/dense_2/Tensordot/MatMulMatMul-sequential/dense_2/Tensordot/Reshape:output:03sequential/dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@n
$sequential/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@l
*sequential/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ѓ
%sequential/dense_2/Tensordot/concat_1ConcatV2.sequential/dense_2/Tensordot/GatherV2:output:0-sequential/dense_2/Tensordot/Const_2:output:03sequential/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:М
sequential/dense_2/TensordotReshape-sequential/dense_2/Tensordot/MatMul:product:0.sequential/dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
)sequential/dense_2/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Е
sequential/dense_2/BiasAddBiasAdd%sequential/dense_2/Tensordot:output:01sequential/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@r
add_1AddV2add:z:0#sequential/dense_2/BiasAdd:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Д
NoOpNoOp9^multi_head_attention/attention_output/add/ReadVariableOpC^multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp,^multi_head_attention/key/add/ReadVariableOp6^multi_head_attention/key/einsum/Einsum/ReadVariableOp.^multi_head_attention/query/add/ReadVariableOp8^multi_head_attention/query/einsum/Einsum/ReadVariableOp.^multi_head_attention/value/add/ReadVariableOp8^multi_head_attention/value/einsum/Einsum/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp,^sequential/dense_1/Tensordot/ReadVariableOp*^sequential/dense_2/BiasAdd/ReadVariableOp,^sequential/dense_2/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 \
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 2t
8multi_head_attention/attention_output/add/ReadVariableOp8multi_head_attention/attention_output/add/ReadVariableOp2
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp2Z
+multi_head_attention/key/add/ReadVariableOp+multi_head_attention/key/add/ReadVariableOp2n
5multi_head_attention/key/einsum/Einsum/ReadVariableOp5multi_head_attention/key/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/query/add/ReadVariableOp-multi_head_attention/query/add/ReadVariableOp2r
7multi_head_attention/query/einsum/Einsum/ReadVariableOp7multi_head_attention/query/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/value/add/ReadVariableOp-multi_head_attention/value/add/ReadVariableOp2r
7multi_head_attention/value/einsum/Einsum/ReadVariableOp7multi_head_attention/value/einsum/Einsum/ReadVariableOp2V
)sequential/dense_1/BiasAdd/ReadVariableOp)sequential/dense_1/BiasAdd/ReadVariableOp2Z
+sequential/dense_1/Tensordot/ReadVariableOp+sequential/dense_1/Tensordot/ReadVariableOp2V
)sequential/dense_2/BiasAdd/ReadVariableOp)sequential/dense_2/BiasAdd/ReadVariableOp2Z
+sequential/dense_2/Tensordot/ReadVariableOp+sequential/dense_2/Tensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
Б

C__inference_conv3d_5_layer_call_and_return_conditional_losses_14062

inputs>
conv3d_readvariableop_resource:.
biasadd_readvariableop_resource:	
identityЂBiasAdd/ReadVariableOpЂConv3D/ReadVariableOp
Conv3D/ReadVariableOpReadVariableOpconv3d_readvariableop_resource*,
_output_shapes
:*
dtype0
Conv3DConv3DinputsConv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	
s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
BiasAddBiasAddConv3D:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ]
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџn
IdentityIdentityRelu:activations:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџw
NoOpNoOp^BiasAdd/ReadVariableOp^Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv3D/ReadVariableOpConv3D/ReadVariableOp:\ X
4
_output_shapes"
 :џџџџџџџџџ
 
_user_specified_nameinputs
E
й
G__inference_sequential_1_layer_call_and_return_conditional_losses_14493

inputs<
)dense_3_tensordot_readvariableop_resource:	@6
'dense_3_biasadd_readvariableop_resource:	<
)dense_4_tensordot_readvariableop_resource:	@5
'dense_4_biasadd_readvariableop_resource:@
identityЂdense_3/BiasAdd/ReadVariableOpЂ dense_3/Tensordot/ReadVariableOpЂdense_4/BiasAdd/ReadVariableOpЂ dense_4/Tensordot/ReadVariableOp
 dense_3/Tensordot/ReadVariableOpReadVariableOp)dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0`
dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       M
dense_3/Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:a
dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : л
dense_3/Tensordot/GatherV2GatherV2 dense_3/Tensordot/Shape:output:0dense_3/Tensordot/free:output:0(dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : п
dense_3/Tensordot/GatherV2_1GatherV2 dense_3/Tensordot/Shape:output:0dense_3/Tensordot/axes:output:0*dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
dense_3/Tensordot/ProdProd#dense_3/Tensordot/GatherV2:output:0 dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 
dense_3/Tensordot/Prod_1Prod%dense_3/Tensordot/GatherV2_1:output:0"dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : М
dense_3/Tensordot/concatConcatV2dense_3/Tensordot/free:output:0dense_3/Tensordot/axes:output:0&dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:
dense_3/Tensordot/stackPackdense_3/Tensordot/Prod:output:0!dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:
dense_3/Tensordot/transpose	Transposeinputs!dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ђ
dense_3/Tensordot/ReshapeReshapedense_3/Tensordot/transpose:y:0 dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЃ
dense_3/Tensordot/MatMulMatMul"dense_3/Tensordot/Reshape:output:0(dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџd
dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:a
dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ч
dense_3/Tensordot/concat_1ConcatV2#dense_3/Tensordot/GatherV2:output:0"dense_3/Tensordot/Const_2:output:0(dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
dense_3/TensordotReshape"dense_3/Tensordot/MatMul:product:0#dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
dense_3/BiasAddBiasAdddense_3/Tensordot:output:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџW
dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?
dense_3/Gelu/mulMuldense_3/Gelu/mul/x:output:0dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџX
dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?
dense_3/Gelu/truedivRealDivdense_3/BiasAdd:output:0dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџh
dense_3/Gelu/ErfErfdense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџW
dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
dense_3/Gelu/addAddV2dense_3/Gelu/add/x:output:0dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџ|
dense_3/Gelu/mul_1Muldense_3/Gelu/mul:z:0dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџ
 dense_4/Tensordot/ReadVariableOpReadVariableOp)dense_4_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0`
dense_4/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_4/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ]
dense_4/Tensordot/ShapeShapedense_3/Gelu/mul_1:z:0*
T0*
_output_shapes
:a
dense_4/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : л
dense_4/Tensordot/GatherV2GatherV2 dense_4/Tensordot/Shape:output:0dense_4/Tensordot/free:output:0(dense_4/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_4/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : п
dense_4/Tensordot/GatherV2_1GatherV2 dense_4/Tensordot/Shape:output:0dense_4/Tensordot/axes:output:0*dense_4/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_4/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
dense_4/Tensordot/ProdProd#dense_4/Tensordot/GatherV2:output:0 dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 
dense_4/Tensordot/Prod_1Prod%dense_4/Tensordot/GatherV2_1:output:0"dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : М
dense_4/Tensordot/concatConcatV2dense_4/Tensordot/free:output:0dense_4/Tensordot/axes:output:0&dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:
dense_4/Tensordot/stackPackdense_4/Tensordot/Prod:output:0!dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:
dense_4/Tensordot/transpose	Transposedense_3/Gelu/mul_1:z:0!dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџЂ
dense_4/Tensordot/ReshapeReshapedense_4/Tensordot/transpose:y:0 dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЂ
dense_4/Tensordot/MatMulMatMul"dense_4/Tensordot/Reshape:output:0(dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@c
dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@a
dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ч
dense_4/Tensordot/concat_1ConcatV2#dense_4/Tensordot/GatherV2:output:0"dense_4/Tensordot/Const_2:output:0(dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
dense_4/TensordotReshape"dense_4/Tensordot/MatMul:product:0#dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
dense_4/BiasAdd/ReadVariableOpReadVariableOp'dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
dense_4/BiasAddBiasAdddense_4/Tensordot:output:0&dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@k
IdentityIdentitydense_4/BiasAdd:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@Ю
NoOpNoOp^dense_3/BiasAdd/ReadVariableOp!^dense_3/Tensordot/ReadVariableOp^dense_4/BiasAdd/ReadVariableOp!^dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2D
 dense_3/Tensordot/ReadVariableOp dense_3/Tensordot/ReadVariableOp2@
dense_4/BiasAdd/ReadVariableOpdense_4/BiasAdd/ReadVariableOp2D
 dense_4/Tensordot/ReadVariableOp dense_4/Tensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
л
Т
R__inference_frame_position_embedding_layer_call_and_return_conditional_losses_2242

inputs2
 embedding_embedding_lookup_72932:@
identityЂembedding/embedding_lookup;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:б
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskM
range/startConst*
_output_shapes
: *
dtype0*
value	B : M
range/deltaConst*
_output_shapes
: *
dtype0*
value	B :n
rangeRangerange/start:output:0strided_slice:output:0range/delta:output:0*
_output_shapes
:а
embedding/embedding_lookupResourceGather embedding_embedding_lookup_72932range:output:0*
Tindices0*3
_class)
'%loc:@embedding/embedding_lookup/72932*
_output_shapes

:@*
dtype0В
#embedding/embedding_lookup/IdentityIdentity#embedding/embedding_lookup:output:0*
T0*3
_class)
'%loc:@embedding/embedding_lookup/72932*
_output_shapes

:@
%embedding/embedding_lookup/Identity_1Identity,embedding/embedding_lookup/Identity:output:0*
T0*
_output_shapes

:@z
addAddV2inputs.embedding/embedding_lookup/Identity_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@c
NoOpNoOp^embedding/embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 Z
IdentityIdentityadd:z:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*,
_input_shapes
:џџџџџџџџџ@: 28
embedding/embedding_lookupembedding/embedding_lookup:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
Р

%__inference_dense_layer_call_fn_14231

inputs
unknown:	@
	unknown_0:@
identityЂStatefulPartitionedCallи
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_11516o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:џџџџџџџџџ: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
я
g
K__inference_time_distributed_layer_call_and_return_conditional_losses_11454

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:б
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"џџџџ         m
ReshapeReshapeinputsReshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџУ
flatten/PartitionedCallPartitionedCallReshape:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_flatten_layer_call_and_return_conditional_losses_11447\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџT
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value
B :
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:
	Reshape_1Reshape flatten/PartitionedCall:output:0Reshape_1/shape:output:0*
T0*5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџh
IdentityIdentityReshape_1:output:0*
T0*5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'џџџџџџџџџџџџџџџџџџ:e a
=
_output_shapes+
):'џџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
Ў
А
G__inference_sequential_1_layer_call_and_return_conditional_losses_13661
dense_3_input 
dense_3_13650:	@
dense_3_13652:	 
dense_4_13655:	@
dense_4_13657:@
identityЂdense_3/StatefulPartitionedCallЂdense_4/StatefulPartitionedCallј
dense_3/StatefulPartitionedCallStatefulPartitionedCalldense_3_inputdense_3_13650dense_3_13652*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_13506
dense_4/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0dense_4_13655dense_4_13657*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_13542{
IdentityIdentity(dense_4/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@
NoOpNoOp ^dense_3/StatefulPartitionedCall ^dense_4/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall:Z V
+
_output_shapes
:џџџџџџџџџ@
'
_user_specified_namedense_3_input
л
Т
R__inference_frame_position_embedding_layer_call_and_return_conditional_losses_3199

inputs2
 embedding_embedding_lookup_75658:@
identityЂembedding/embedding_lookup;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:б
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskM
range/startConst*
_output_shapes
: *
dtype0*
value	B : M
range/deltaConst*
_output_shapes
: *
dtype0*
value	B :n
rangeRangerange/start:output:0strided_slice:output:0range/delta:output:0*
_output_shapes
:а
embedding/embedding_lookupResourceGather embedding_embedding_lookup_75658range:output:0*
Tindices0*3
_class)
'%loc:@embedding/embedding_lookup/75658*
_output_shapes

:@*
dtype0В
#embedding/embedding_lookup/IdentityIdentity#embedding/embedding_lookup:output:0*
T0*3
_class)
'%loc:@embedding/embedding_lookup/75658*
_output_shapes

:@
%embedding/embedding_lookup/Identity_1Identity,embedding/embedding_lookup/Identity:output:0*
T0*
_output_shapes

:@z
addAddV2inputs.embedding/embedding_lookup/Identity_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@c
NoOpNoOp^embedding/embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 Z
IdentityIdentityadd:z:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*,
_input_shapes
:џџџџџџџџџ@: 28
embedding/embedding_lookupembedding/embedding_lookup:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs

Ж
L__inference_transformer_layer_2_layer_call_and_return_conditional_losses_673

inputsX
Bmulti_head_attention_1_query_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_query_add_readvariableop_resource:@V
@multi_head_attention_1_key_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_1_key_add_readvariableop_resource:@X
Bmulti_head_attention_1_value_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_value_add_readvariableop_resource:@c
Mmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource:@@Q
Cmulti_head_attention_1_attention_output_add_readvariableop_resource:@I
6sequential_1_dense_3_tensordot_readvariableop_resource:	@C
4sequential_1_dense_3_biasadd_readvariableop_resource:	I
6sequential_1_dense_4_tensordot_readvariableop_resource:	@B
4sequential_1_dense_4_biasadd_readvariableop_resource:@
identityЂ:multi_head_attention_1/attention_output/add/ReadVariableOpЂDmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpЂ-multi_head_attention_1/key/add/ReadVariableOpЂ7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpЂ/multi_head_attention_1/query/add/ReadVariableOpЂ9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpЂ/multi_head_attention_1/value/add/ReadVariableOpЂ9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpЂ+sequential_1/dense_3/BiasAdd/ReadVariableOpЂ-sequential_1/dense_3/Tensordot/ReadVariableOpЂ+sequential_1/dense_4/BiasAdd/ReadVariableOpЂ-sequential_1/dense_4/Tensordot/ReadVariableOpР
9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0п
*multi_head_attention_1/query/einsum/EinsumEinsuminputsAmulti_head_attention_1/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЈ
/multi_head_attention_1/query/add/ReadVariableOpReadVariableOp8multi_head_attention_1_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0б
 multi_head_attention_1/query/addAddV23multi_head_attention_1/query/einsum/Einsum:output:07multi_head_attention_1/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@М
7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_1_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0л
(multi_head_attention_1/key/einsum/EinsumEinsuminputs?multi_head_attention_1/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЄ
-multi_head_attention_1/key/add/ReadVariableOpReadVariableOp6multi_head_attention_1_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ы
multi_head_attention_1/key/addAddV21multi_head_attention_1/key/einsum/Einsum:output:05multi_head_attention_1/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@Р
9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0п
*multi_head_attention_1/value/einsum/EinsumEinsuminputsAmulti_head_attention_1/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЈ
/multi_head_attention_1/value/add/ReadVariableOpReadVariableOp8multi_head_attention_1_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0б
 multi_head_attention_1/value/addAddV23multi_head_attention_1/value/einsum/Einsum:output:07multi_head_attention_1/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@a
multi_head_attention_1/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >Ј
multi_head_attention_1/MulMul$multi_head_attention_1/query/add:z:0%multi_head_attention_1/Mul/y:output:0*
T0*/
_output_shapes
:џџџџџџџџџ@д
$multi_head_attention_1/einsum/EinsumEinsum"multi_head_attention_1/key/add:z:0multi_head_attention_1/Mul:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ*
equationaecd,abcd->acbe
&multi_head_attention_1/softmax/SoftmaxSoftmax-multi_head_attention_1/einsum/Einsum:output:0*
T0*/
_output_shapes
:џџџџџџџџџъ
&multi_head_attention_1/einsum_1/EinsumEinsum0multi_head_attention_1/softmax/Softmax:softmax:0$multi_head_attention_1/value/add:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationacbe,aecd->abcdж
Dmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpMmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0
5multi_head_attention_1/attention_output/einsum/EinsumEinsum/multi_head_attention_1/einsum_1/Einsum:output:0Lmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:џџџџџџџџџ@*
equationabcd,cde->abeК
:multi_head_attention_1/attention_output/add/ReadVariableOpReadVariableOpCmulti_head_attention_1_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0ю
+multi_head_attention_1/attention_output/addAddV2>multi_head_attention_1/attention_output/einsum/Einsum:output:0Bmulti_head_attention_1/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@{
addAddV2inputs/multi_head_attention_1/attention_output/add:z:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ѕ
-sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0m
#sequential_1/dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:t
#sequential_1/dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       [
$sequential_1/dense_3/Tensordot/ShapeShapeadd:z:0*
T0*
_output_shapes
:n
,sequential_1/dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential_1/dense_3/Tensordot/GatherV2GatherV2-sequential_1/dense_3/Tensordot/Shape:output:0,sequential_1/dense_3/Tensordot/free:output:05sequential_1/dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
.sequential_1/dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
)sequential_1/dense_3/Tensordot/GatherV2_1GatherV2-sequential_1/dense_3/Tensordot/Shape:output:0,sequential_1/dense_3/Tensordot/axes:output:07sequential_1/dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
$sequential_1/dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ­
#sequential_1/dense_3/Tensordot/ProdProd0sequential_1/dense_3/Tensordot/GatherV2:output:0-sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: Г
%sequential_1/dense_3/Tensordot/Prod_1Prod2sequential_1/dense_3/Tensordot/GatherV2_1:output:0/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : №
%sequential_1/dense_3/Tensordot/concatConcatV2,sequential_1/dense_3/Tensordot/free:output:0,sequential_1/dense_3/Tensordot/axes:output:03sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:И
$sequential_1/dense_3/Tensordot/stackPack,sequential_1/dense_3/Tensordot/Prod:output:0.sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Є
(sequential_1/dense_3/Tensordot/transpose	Transposeadd:z:0.sequential_1/dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Щ
&sequential_1/dense_3/Tensordot/ReshapeReshape,sequential_1/dense_3/Tensordot/transpose:y:0-sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЪ
%sequential_1/dense_3/Tensordot/MatMulMatMul/sequential_1/dense_3/Tensordot/Reshape:output:05sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџq
&sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:n
,sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ћ
'sequential_1/dense_3/Tensordot/concat_1ConcatV20sequential_1/dense_3/Tensordot/GatherV2:output:0/sequential_1/dense_3/Tensordot/Const_2:output:05sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:У
sequential_1/dense_3/TensordotReshape/sequential_1/dense_3/Tensordot/MatMul:product:00sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
+sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0М
sequential_1/dense_3/BiasAddBiasAdd'sequential_1/dense_3/Tensordot:output:03sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџd
sequential_1/dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Ќ
sequential_1/dense_3/Gelu/mulMul(sequential_1/dense_3/Gelu/mul/x:output:0%sequential_1/dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџe
 sequential_1/dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?Е
!sequential_1/dense_3/Gelu/truedivRealDiv%sequential_1/dense_3/BiasAdd:output:0)sequential_1/dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
sequential_1/dense_3/Gelu/ErfErf%sequential_1/dense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџd
sequential_1/dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Њ
sequential_1/dense_3/Gelu/addAddV2(sequential_1/dense_3/Gelu/add/x:output:0!sequential_1/dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџЃ
sequential_1/dense_3/Gelu/mul_1Mul!sequential_1/dense_3/Gelu/mul:z:0!sequential_1/dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџЅ
-sequential_1/dense_4/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_4_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0m
#sequential_1/dense_4/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:t
#sequential_1/dense_4/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       w
$sequential_1/dense_4/Tensordot/ShapeShape#sequential_1/dense_3/Gelu/mul_1:z:0*
T0*
_output_shapes
:n
,sequential_1/dense_4/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential_1/dense_4/Tensordot/GatherV2GatherV2-sequential_1/dense_4/Tensordot/Shape:output:0,sequential_1/dense_4/Tensordot/free:output:05sequential_1/dense_4/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
.sequential_1/dense_4/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
)sequential_1/dense_4/Tensordot/GatherV2_1GatherV2-sequential_1/dense_4/Tensordot/Shape:output:0,sequential_1/dense_4/Tensordot/axes:output:07sequential_1/dense_4/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
$sequential_1/dense_4/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ­
#sequential_1/dense_4/Tensordot/ProdProd0sequential_1/dense_4/Tensordot/GatherV2:output:0-sequential_1/dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: Г
%sequential_1/dense_4/Tensordot/Prod_1Prod2sequential_1/dense_4/Tensordot/GatherV2_1:output:0/sequential_1/dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : №
%sequential_1/dense_4/Tensordot/concatConcatV2,sequential_1/dense_4/Tensordot/free:output:0,sequential_1/dense_4/Tensordot/axes:output:03sequential_1/dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:И
$sequential_1/dense_4/Tensordot/stackPack,sequential_1/dense_4/Tensordot/Prod:output:0.sequential_1/dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:С
(sequential_1/dense_4/Tensordot/transpose	Transpose#sequential_1/dense_3/Gelu/mul_1:z:0.sequential_1/dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџЩ
&sequential_1/dense_4/Tensordot/ReshapeReshape,sequential_1/dense_4/Tensordot/transpose:y:0-sequential_1/dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЩ
%sequential_1/dense_4/Tensordot/MatMulMatMul/sequential_1/dense_4/Tensordot/Reshape:output:05sequential_1/dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@p
&sequential_1/dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@n
,sequential_1/dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ћ
'sequential_1/dense_4/Tensordot/concat_1ConcatV20sequential_1/dense_4/Tensordot/GatherV2:output:0/sequential_1/dense_4/Tensordot/Const_2:output:05sequential_1/dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Т
sequential_1/dense_4/TensordotReshape/sequential_1/dense_4/Tensordot/MatMul:product:00sequential_1/dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
+sequential_1/dense_4/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Л
sequential_1/dense_4/BiasAddBiasAdd'sequential_1/dense_4/Tensordot:output:03sequential_1/dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@t
add_1AddV2add:z:0%sequential_1/dense_4/BiasAdd:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ь
NoOpNoOp;^multi_head_attention_1/attention_output/add/ReadVariableOpE^multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp.^multi_head_attention_1/key/add/ReadVariableOp8^multi_head_attention_1/key/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/query/add/ReadVariableOp:^multi_head_attention_1/query/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/value/add/ReadVariableOp:^multi_head_attention_1/value/einsum/Einsum/ReadVariableOp,^sequential_1/dense_3/BiasAdd/ReadVariableOp.^sequential_1/dense_3/Tensordot/ReadVariableOp,^sequential_1/dense_4/BiasAdd/ReadVariableOp.^sequential_1/dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 \
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 2x
:multi_head_attention_1/attention_output/add/ReadVariableOp:multi_head_attention_1/attention_output/add/ReadVariableOp2
Dmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpDmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp2^
-multi_head_attention_1/key/add/ReadVariableOp-multi_head_attention_1/key/add/ReadVariableOp2r
7multi_head_attention_1/key/einsum/Einsum/ReadVariableOp7multi_head_attention_1/key/einsum/Einsum/ReadVariableOp2b
/multi_head_attention_1/query/add/ReadVariableOp/multi_head_attention_1/query/add/ReadVariableOp2v
9multi_head_attention_1/query/einsum/Einsum/ReadVariableOp9multi_head_attention_1/query/einsum/Einsum/ReadVariableOp2b
/multi_head_attention_1/value/add/ReadVariableOp/multi_head_attention_1/value/add/ReadVariableOp2v
9multi_head_attention_1/value/einsum/Einsum/ReadVariableOp9multi_head_attention_1/value/einsum/Einsum/ReadVariableOp2Z
+sequential_1/dense_3/BiasAdd/ReadVariableOp+sequential_1/dense_3/BiasAdd/ReadVariableOp2^
-sequential_1/dense_3/Tensordot/ReadVariableOp-sequential_1/dense_3/Tensordot/ReadVariableOp2Z
+sequential_1/dense_4/BiasAdd/ReadVariableOp+sequential_1/dense_4/BiasAdd/ReadVariableOp2^
-sequential_1/dense_4/Tensordot/ReadVariableOp-sequential_1/dense_4/Tensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
Ў
А
G__inference_sequential_1_layer_call_and_return_conditional_losses_13647
dense_3_input 
dense_3_13636:	@
dense_3_13638:	 
dense_4_13641:	@
dense_4_13643:@
identityЂdense_3/StatefulPartitionedCallЂdense_4/StatefulPartitionedCallј
dense_3/StatefulPartitionedCallStatefulPartitionedCalldense_3_inputdense_3_13636dense_3_13638*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_13506
dense_4/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0dense_4_13641dense_4_13643*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_13542{
IdentityIdentity(dense_4/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@
NoOpNoOp ^dense_3/StatefulPartitionedCall ^dense_4/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall:Z V
+
_output_shapes
:џџџџџџџџџ@
'
_user_specified_namedense_3_input

Ч
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_11566

inputs
dense_11556:	@
dense_11558:@
identityЂdense/StatefulPartitionedCall;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:б
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask^
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   e
ReshapeReshapeinputsReshape/shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџю
dense/StatefulPartitionedCallStatefulPartitionedCallReshape:output:0dense_11556dense_11558*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_11516\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџS
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value	B :@
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:
	Reshape_1Reshape&dense/StatefulPartitionedCall:output:0Reshape_1/shape:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ@n
IdentityIdentityReshape_1:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ@f
NoOpNoOp^dense/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:џџџџџџџџџџџџџџџџџџ: : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall:] Y
5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
у
х
*__inference_sequential_layer_call_fn_14583

inputs%
unknown: 
	unknown_0: '
	unknown_1:  
	unknown_2: 
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ   *&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_13821{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ  : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
е

'__inference_dense_3_layer_call_fn_14838

inputs
unknown:	@
	unknown_0:	
identityЂStatefulPartitionedCallп
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_13506t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ@: : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
є
Щ
G__inference_sequential_2_layer_call_and_return_conditional_losses_14129

inputs-
conv3d_4_14118:@
conv3d_4_14120:	.
conv3d_5_14123:
conv3d_5_14125:	
identityЂ conv3d_4/StatefulPartitionedCallЂ conv3d_5/StatefulPartitionedCall§
 conv3d_4/StatefulPartitionedCallStatefulPartitionedCallinputsconv3d_4_14118conv3d_4_14120*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_4_layer_call_and_return_conditional_losses_14045 
 conv3d_5/StatefulPartitionedCallStatefulPartitionedCall)conv3d_4/StatefulPartitionedCall:output:0conv3d_5_14123conv3d_5_14125*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_5_layer_call_and_return_conditional_losses_14062
IdentityIdentity)conv3d_5/StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ
NoOpNoOp!^conv3d_4/StatefulPartitionedCall!^conv3d_5/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ@: : : : 2D
 conv3d_4/StatefulPartitionedCall conv3d_4/StatefulPartitionedCall2D
 conv3d_5/StatefulPartitionedCall conv3d_5/StatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ@
 
_user_specified_nameinputs
є
Щ
G__inference_sequential_2_layer_call_and_return_conditional_losses_14069

inputs-
conv3d_4_14046:@
conv3d_4_14048:	.
conv3d_5_14063:
conv3d_5_14065:	
identityЂ conv3d_4/StatefulPartitionedCallЂ conv3d_5/StatefulPartitionedCall§
 conv3d_4/StatefulPartitionedCallStatefulPartitionedCallinputsconv3d_4_14046conv3d_4_14048*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_4_layer_call_and_return_conditional_losses_14045 
 conv3d_5/StatefulPartitionedCallStatefulPartitionedCall)conv3d_4/StatefulPartitionedCall:output:0conv3d_5_14063conv3d_5_14065*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_5_layer_call_and_return_conditional_losses_14062
IdentityIdentity)conv3d_5/StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ
NoOpNoOp!^conv3d_4/StatefulPartitionedCall!^conv3d_5/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ@: : : : 2D
 conv3d_4/StatefulPartitionedCall conv3d_4/StatefulPartitionedCall2D
 conv3d_5/StatefulPartitionedCall conv3d_5/StatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ@
 
_user_specified_nameinputs
і
L
0__inference_time_distributed_layer_call_fn_13151

inputs
identityЧ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_time_distributed_layer_call_and_return_conditional_losses_11481n
IdentityIdentityPartitionedCall:output:0*
T0*5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'џџџџџџџџџџџџџџџџџџ:e a
=
_output_shapes+
):'џџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
E
й
G__inference_sequential_1_layer_call_and_return_conditional_losses_14557

inputs<
)dense_3_tensordot_readvariableop_resource:	@6
'dense_3_biasadd_readvariableop_resource:	<
)dense_4_tensordot_readvariableop_resource:	@5
'dense_4_biasadd_readvariableop_resource:@
identityЂdense_3/BiasAdd/ReadVariableOpЂ dense_3/Tensordot/ReadVariableOpЂdense_4/BiasAdd/ReadVariableOpЂ dense_4/Tensordot/ReadVariableOp
 dense_3/Tensordot/ReadVariableOpReadVariableOp)dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0`
dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       M
dense_3/Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:a
dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : л
dense_3/Tensordot/GatherV2GatherV2 dense_3/Tensordot/Shape:output:0dense_3/Tensordot/free:output:0(dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : п
dense_3/Tensordot/GatherV2_1GatherV2 dense_3/Tensordot/Shape:output:0dense_3/Tensordot/axes:output:0*dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
dense_3/Tensordot/ProdProd#dense_3/Tensordot/GatherV2:output:0 dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 
dense_3/Tensordot/Prod_1Prod%dense_3/Tensordot/GatherV2_1:output:0"dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : М
dense_3/Tensordot/concatConcatV2dense_3/Tensordot/free:output:0dense_3/Tensordot/axes:output:0&dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:
dense_3/Tensordot/stackPackdense_3/Tensordot/Prod:output:0!dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:
dense_3/Tensordot/transpose	Transposeinputs!dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ђ
dense_3/Tensordot/ReshapeReshapedense_3/Tensordot/transpose:y:0 dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЃ
dense_3/Tensordot/MatMulMatMul"dense_3/Tensordot/Reshape:output:0(dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџd
dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:a
dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ч
dense_3/Tensordot/concat_1ConcatV2#dense_3/Tensordot/GatherV2:output:0"dense_3/Tensordot/Const_2:output:0(dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
dense_3/TensordotReshape"dense_3/Tensordot/MatMul:product:0#dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
dense_3/BiasAddBiasAdddense_3/Tensordot:output:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџW
dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?
dense_3/Gelu/mulMuldense_3/Gelu/mul/x:output:0dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџX
dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?
dense_3/Gelu/truedivRealDivdense_3/BiasAdd:output:0dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџh
dense_3/Gelu/ErfErfdense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџW
dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
dense_3/Gelu/addAddV2dense_3/Gelu/add/x:output:0dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџ|
dense_3/Gelu/mul_1Muldense_3/Gelu/mul:z:0dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџ
 dense_4/Tensordot/ReadVariableOpReadVariableOp)dense_4_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0`
dense_4/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_4/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ]
dense_4/Tensordot/ShapeShapedense_3/Gelu/mul_1:z:0*
T0*
_output_shapes
:a
dense_4/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : л
dense_4/Tensordot/GatherV2GatherV2 dense_4/Tensordot/Shape:output:0dense_4/Tensordot/free:output:0(dense_4/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_4/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : п
dense_4/Tensordot/GatherV2_1GatherV2 dense_4/Tensordot/Shape:output:0dense_4/Tensordot/axes:output:0*dense_4/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_4/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
dense_4/Tensordot/ProdProd#dense_4/Tensordot/GatherV2:output:0 dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 
dense_4/Tensordot/Prod_1Prod%dense_4/Tensordot/GatherV2_1:output:0"dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : М
dense_4/Tensordot/concatConcatV2dense_4/Tensordot/free:output:0dense_4/Tensordot/axes:output:0&dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:
dense_4/Tensordot/stackPackdense_4/Tensordot/Prod:output:0!dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:
dense_4/Tensordot/transpose	Transposedense_3/Gelu/mul_1:z:0!dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџЂ
dense_4/Tensordot/ReshapeReshapedense_4/Tensordot/transpose:y:0 dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЂ
dense_4/Tensordot/MatMulMatMul"dense_4/Tensordot/Reshape:output:0(dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@c
dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@a
dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ч
dense_4/Tensordot/concat_1ConcatV2#dense_4/Tensordot/GatherV2:output:0"dense_4/Tensordot/Const_2:output:0(dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
dense_4/TensordotReshape"dense_4/Tensordot/MatMul:product:0#dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
dense_4/BiasAdd/ReadVariableOpReadVariableOp'dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
dense_4/BiasAddBiasAdddense_4/Tensordot:output:0&dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@k
IdentityIdentitydense_4/BiasAdd:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@Ю
NoOpNoOp^dense_3/BiasAdd/ReadVariableOp!^dense_3/Tensordot/ReadVariableOp^dense_4/BiasAdd/ReadVariableOp!^dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2D
 dense_3/Tensordot/ReadVariableOp dense_3/Tensordot/ReadVariableOp2@
dense_4/BiasAdd/ReadVariableOpdense_4/BiasAdd/ReadVariableOp2D
 dense_4/Tensordot/ReadVariableOp dense_4/Tensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
П

M__inference_transformer_layer_1_layer_call_and_return_conditional_losses_1329

inputsV
@multi_head_attention_query_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_query_add_readvariableop_resource:@T
>multi_head_attention_key_einsum_einsum_readvariableop_resource:@@F
4multi_head_attention_key_add_readvariableop_resource:@V
@multi_head_attention_value_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_value_add_readvariableop_resource:@a
Kmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource:@@O
Amulti_head_attention_attention_output_add_readvariableop_resource:@G
4sequential_dense_1_tensordot_readvariableop_resource:	@A
2sequential_dense_1_biasadd_readvariableop_resource:	G
4sequential_dense_2_tensordot_readvariableop_resource:	@@
2sequential_dense_2_biasadd_readvariableop_resource:@
identityЂ8multi_head_attention/attention_output/add/ReadVariableOpЂBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpЂ+multi_head_attention/key/add/ReadVariableOpЂ5multi_head_attention/key/einsum/Einsum/ReadVariableOpЂ-multi_head_attention/query/add/ReadVariableOpЂ7multi_head_attention/query/einsum/Einsum/ReadVariableOpЂ-multi_head_attention/value/add/ReadVariableOpЂ7multi_head_attention/value/einsum/Einsum/ReadVariableOpЂ)sequential/dense_1/BiasAdd/ReadVariableOpЂ+sequential/dense_1/Tensordot/ReadVariableOpЂ)sequential/dense_2/BiasAdd/ReadVariableOpЂ+sequential/dense_2/Tensordot/ReadVariableOpМ
7multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0л
(multi_head_attention/query/einsum/EinsumEinsuminputs?multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЄ
-multi_head_attention/query/add/ReadVariableOpReadVariableOp6multi_head_attention_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ы
multi_head_attention/query/addAddV21multi_head_attention/query/einsum/Einsum:output:05multi_head_attention/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@И
5multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOp>multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0з
&multi_head_attention/key/einsum/EinsumEinsuminputs=multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abde 
+multi_head_attention/key/add/ReadVariableOpReadVariableOp4multi_head_attention_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Х
multi_head_attention/key/addAddV2/multi_head_attention/key/einsum/Einsum:output:03multi_head_attention/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@М
7multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0л
(multi_head_attention/value/einsum/EinsumEinsuminputs?multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЄ
-multi_head_attention/value/add/ReadVariableOpReadVariableOp6multi_head_attention_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ы
multi_head_attention/value/addAddV21multi_head_attention/value/einsum/Einsum:output:05multi_head_attention/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@_
multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >Ђ
multi_head_attention/MulMul"multi_head_attention/query/add:z:0#multi_head_attention/Mul/y:output:0*
T0*/
_output_shapes
:џџџџџџџџџ@Ю
"multi_head_attention/einsum/EinsumEinsum multi_head_attention/key/add:z:0multi_head_attention/Mul:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ*
equationaecd,abcd->acbe
$multi_head_attention/softmax/SoftmaxSoftmax+multi_head_attention/einsum/Einsum:output:0*
T0*/
_output_shapes
:џџџџџџџџџф
$multi_head_attention/einsum_1/EinsumEinsum.multi_head_attention/softmax/Softmax:softmax:0"multi_head_attention/value/add:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationacbe,aecd->abcdв
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpKmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0
3multi_head_attention/attention_output/einsum/EinsumEinsum-multi_head_attention/einsum_1/Einsum:output:0Jmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:џџџџџџџџџ@*
equationabcd,cde->abeЖ
8multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpAmulti_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0ш
)multi_head_attention/attention_output/addAddV2<multi_head_attention/attention_output/einsum/Einsum:output:0@multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@y
addAddV2inputs-multi_head_attention/attention_output/add:z:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ё
+sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0k
!sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:r
!sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Y
"sequential/dense_1/Tensordot/ShapeShapeadd:z:0*
T0*
_output_shapes
:l
*sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
%sequential/dense_1/Tensordot/GatherV2GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/free:output:03sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
,sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential/dense_1/Tensordot/GatherV2_1GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/axes:output:05sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
"sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: Ї
!sequential/dense_1/Tensordot/ProdProd.sequential/dense_1/Tensordot/GatherV2:output:0+sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ­
#sequential/dense_1/Tensordot/Prod_1Prod0sequential/dense_1/Tensordot/GatherV2_1:output:0-sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ш
#sequential/dense_1/Tensordot/concatConcatV2*sequential/dense_1/Tensordot/free:output:0*sequential/dense_1/Tensordot/axes:output:01sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:В
"sequential/dense_1/Tensordot/stackPack*sequential/dense_1/Tensordot/Prod:output:0,sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
: 
&sequential/dense_1/Tensordot/transpose	Transposeadd:z:0,sequential/dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@У
$sequential/dense_1/Tensordot/ReshapeReshape*sequential/dense_1/Tensordot/transpose:y:0+sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџФ
#sequential/dense_1/Tensordot/MatMulMatMul-sequential/dense_1/Tensordot/Reshape:output:03sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџo
$sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:l
*sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ѓ
%sequential/dense_1/Tensordot/concat_1ConcatV2.sequential/dense_1/Tensordot/GatherV2:output:0-sequential/dense_1/Tensordot/Const_2:output:03sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Н
sequential/dense_1/TensordotReshape-sequential/dense_1/Tensordot/MatMul:product:0.sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0Ж
sequential/dense_1/BiasAddBiasAdd%sequential/dense_1/Tensordot:output:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџb
sequential/dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?І
sequential/dense_1/Gelu/mulMul&sequential/dense_1/Gelu/mul/x:output:0#sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџc
sequential/dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?Џ
sequential/dense_1/Gelu/truedivRealDiv#sequential/dense_1/BiasAdd:output:0'sequential/dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџ~
sequential/dense_1/Gelu/ErfErf#sequential/dense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџb
sequential/dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Є
sequential/dense_1/Gelu/addAddV2&sequential/dense_1/Gelu/add/x:output:0sequential/dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџ
sequential/dense_1/Gelu/mul_1Mulsequential/dense_1/Gelu/mul:z:0sequential/dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџЁ
+sequential/dense_2/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_2_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0k
!sequential/dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:r
!sequential/dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       s
"sequential/dense_2/Tensordot/ShapeShape!sequential/dense_1/Gelu/mul_1:z:0*
T0*
_output_shapes
:l
*sequential/dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
%sequential/dense_2/Tensordot/GatherV2GatherV2+sequential/dense_2/Tensordot/Shape:output:0*sequential/dense_2/Tensordot/free:output:03sequential/dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
,sequential/dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential/dense_2/Tensordot/GatherV2_1GatherV2+sequential/dense_2/Tensordot/Shape:output:0*sequential/dense_2/Tensordot/axes:output:05sequential/dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
"sequential/dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: Ї
!sequential/dense_2/Tensordot/ProdProd.sequential/dense_2/Tensordot/GatherV2:output:0+sequential/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ­
#sequential/dense_2/Tensordot/Prod_1Prod0sequential/dense_2/Tensordot/GatherV2_1:output:0-sequential/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ш
#sequential/dense_2/Tensordot/concatConcatV2*sequential/dense_2/Tensordot/free:output:0*sequential/dense_2/Tensordot/axes:output:01sequential/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:В
"sequential/dense_2/Tensordot/stackPack*sequential/dense_2/Tensordot/Prod:output:0,sequential/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Л
&sequential/dense_2/Tensordot/transpose	Transpose!sequential/dense_1/Gelu/mul_1:z:0,sequential/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџУ
$sequential/dense_2/Tensordot/ReshapeReshape*sequential/dense_2/Tensordot/transpose:y:0+sequential/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџУ
#sequential/dense_2/Tensordot/MatMulMatMul-sequential/dense_2/Tensordot/Reshape:output:03sequential/dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@n
$sequential/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@l
*sequential/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ѓ
%sequential/dense_2/Tensordot/concat_1ConcatV2.sequential/dense_2/Tensordot/GatherV2:output:0-sequential/dense_2/Tensordot/Const_2:output:03sequential/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:М
sequential/dense_2/TensordotReshape-sequential/dense_2/Tensordot/MatMul:product:0.sequential/dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
)sequential/dense_2/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Е
sequential/dense_2/BiasAddBiasAdd%sequential/dense_2/Tensordot:output:01sequential/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@r
add_1AddV2add:z:0#sequential/dense_2/BiasAdd:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Д
NoOpNoOp9^multi_head_attention/attention_output/add/ReadVariableOpC^multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp,^multi_head_attention/key/add/ReadVariableOp6^multi_head_attention/key/einsum/Einsum/ReadVariableOp.^multi_head_attention/query/add/ReadVariableOp8^multi_head_attention/query/einsum/Einsum/ReadVariableOp.^multi_head_attention/value/add/ReadVariableOp8^multi_head_attention/value/einsum/Einsum/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp,^sequential/dense_1/Tensordot/ReadVariableOp*^sequential/dense_2/BiasAdd/ReadVariableOp,^sequential/dense_2/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 \
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 2t
8multi_head_attention/attention_output/add/ReadVariableOp8multi_head_attention/attention_output/add/ReadVariableOp2
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp2Z
+multi_head_attention/key/add/ReadVariableOp+multi_head_attention/key/add/ReadVariableOp2n
5multi_head_attention/key/einsum/Einsum/ReadVariableOp5multi_head_attention/key/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/query/add/ReadVariableOp-multi_head_attention/query/add/ReadVariableOp2r
7multi_head_attention/query/einsum/Einsum/ReadVariableOp7multi_head_attention/query/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/value/add/ReadVariableOp-multi_head_attention/value/add/ReadVariableOp2r
7multi_head_attention/value/einsum/Einsum/ReadVariableOp7multi_head_attention/value/einsum/Einsum/ReadVariableOp2V
)sequential/dense_1/BiasAdd/ReadVariableOp)sequential/dense_1/BiasAdd/ReadVariableOp2Z
+sequential/dense_1/Tensordot/ReadVariableOp+sequential/dense_1/Tensordot/ReadVariableOp2V
)sequential/dense_2/BiasAdd/ReadVariableOp)sequential/dense_2/BiasAdd/ReadVariableOp2Z
+sequential/dense_2/Tensordot/ReadVariableOp+sequential/dense_2/Tensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
Ќ
Е
(__inference_restored_function_body_11973

inputs%
unknown:
	unknown_0:'
	unknown_1: 
	unknown_2: '
	unknown_3:  
	unknown_4: '
	unknown_5: @
	unknown_6:@'
	unknown_7:@@
	unknown_8:@(
	unknown_9:@

unknown_10:	*

unknown_11:

unknown_12:	
identityЂStatefulPartitionedCallч
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*4
_output_shapes"
 :џџџџџџџџџ*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_encoder3d_layer_call_and_return_conditional_losses_578|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:џџџџџџџџџ  : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
јЁ
ѓK
__inference__traced_save_15490
file_prefix-
)savev2_dense_5_kernel_read_readvariableop+
'savev2_dense_5_bias_read_readvariableop-
)savev2_dense_6_kernel_read_readvariableop+
'savev2_dense_6_bias_read_readvariableopJ
Fsavev2_encoder3d_spatial_attention_conv3d_6_kernel_read_readvariableopH
Dsavev2_encoder3d_spatial_attention_conv3d_6_bias_read_readvariableop,
(savev2_conv3d_kernel_read_readvariableop*
&savev2_conv3d_bias_read_readvariableop.
*savev2_conv3d_1_kernel_read_readvariableop,
(savev2_conv3d_1_bias_read_readvariableop.
*savev2_conv3d_2_kernel_read_readvariableop,
(savev2_conv3d_2_bias_read_readvariableop.
*savev2_conv3d_3_kernel_read_readvariableop,
(savev2_conv3d_3_bias_read_readvariableop.
*savev2_conv3d_4_kernel_read_readvariableop,
(savev2_conv3d_4_bias_read_readvariableop.
*savev2_conv3d_5_kernel_read_readvariableop,
(savev2_conv3d_5_bias_read_readvariableop8
4savev2_time_distributed_1_kernel_read_readvariableop6
2savev2_time_distributed_1_bias_read_readvariableopL
Hsavev2_frame_position_embedding_embedding_embeddings_read_readvariableopT
Psavev2_transformer_layer_1_multi_head_attention_query_kernel_read_readvariableopR
Nsavev2_transformer_layer_1_multi_head_attention_query_bias_read_readvariableopR
Nsavev2_transformer_layer_1_multi_head_attention_key_kernel_read_readvariableopP
Lsavev2_transformer_layer_1_multi_head_attention_key_bias_read_readvariableopT
Psavev2_transformer_layer_1_multi_head_attention_value_kernel_read_readvariableopR
Nsavev2_transformer_layer_1_multi_head_attention_value_bias_read_readvariableop_
[savev2_transformer_layer_1_multi_head_attention_attention_output_kernel_read_readvariableop]
Ysavev2_transformer_layer_1_multi_head_attention_attention_output_bias_read_readvariableop-
)savev2_dense_1_kernel_read_readvariableop+
'savev2_dense_1_bias_read_readvariableop-
)savev2_dense_2_kernel_read_readvariableop+
'savev2_dense_2_bias_read_readvariableopV
Rsavev2_transformer_layer_2_multi_head_attention_1_query_kernel_read_readvariableopT
Psavev2_transformer_layer_2_multi_head_attention_1_query_bias_read_readvariableopT
Psavev2_transformer_layer_2_multi_head_attention_1_key_kernel_read_readvariableopR
Nsavev2_transformer_layer_2_multi_head_attention_1_key_bias_read_readvariableopV
Rsavev2_transformer_layer_2_multi_head_attention_1_value_kernel_read_readvariableopT
Psavev2_transformer_layer_2_multi_head_attention_1_value_bias_read_readvariableopa
]savev2_transformer_layer_2_multi_head_attention_1_attention_output_kernel_read_readvariableop_
[savev2_transformer_layer_2_multi_head_attention_1_attention_output_bias_read_readvariableop-
)savev2_dense_3_kernel_read_readvariableop+
'savev2_dense_3_bias_read_readvariableop-
)savev2_dense_4_kernel_read_readvariableop+
'savev2_dense_4_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop4
0savev2_adam_dense_5_kernel_m_read_readvariableop2
.savev2_adam_dense_5_bias_m_read_readvariableop4
0savev2_adam_dense_6_kernel_m_read_readvariableop2
.savev2_adam_dense_6_bias_m_read_readvariableopQ
Msavev2_adam_encoder3d_spatial_attention_conv3d_6_kernel_m_read_readvariableopO
Ksavev2_adam_encoder3d_spatial_attention_conv3d_6_bias_m_read_readvariableop3
/savev2_adam_conv3d_kernel_m_read_readvariableop1
-savev2_adam_conv3d_bias_m_read_readvariableop5
1savev2_adam_conv3d_1_kernel_m_read_readvariableop3
/savev2_adam_conv3d_1_bias_m_read_readvariableop5
1savev2_adam_conv3d_2_kernel_m_read_readvariableop3
/savev2_adam_conv3d_2_bias_m_read_readvariableop5
1savev2_adam_conv3d_3_kernel_m_read_readvariableop3
/savev2_adam_conv3d_3_bias_m_read_readvariableop5
1savev2_adam_conv3d_4_kernel_m_read_readvariableop3
/savev2_adam_conv3d_4_bias_m_read_readvariableop5
1savev2_adam_conv3d_5_kernel_m_read_readvariableop3
/savev2_adam_conv3d_5_bias_m_read_readvariableop?
;savev2_adam_time_distributed_1_kernel_m_read_readvariableop=
9savev2_adam_time_distributed_1_bias_m_read_readvariableopS
Osavev2_adam_frame_position_embedding_embedding_embeddings_m_read_readvariableop[
Wsavev2_adam_transformer_layer_1_multi_head_attention_query_kernel_m_read_readvariableopY
Usavev2_adam_transformer_layer_1_multi_head_attention_query_bias_m_read_readvariableopY
Usavev2_adam_transformer_layer_1_multi_head_attention_key_kernel_m_read_readvariableopW
Ssavev2_adam_transformer_layer_1_multi_head_attention_key_bias_m_read_readvariableop[
Wsavev2_adam_transformer_layer_1_multi_head_attention_value_kernel_m_read_readvariableopY
Usavev2_adam_transformer_layer_1_multi_head_attention_value_bias_m_read_readvariableopf
bsavev2_adam_transformer_layer_1_multi_head_attention_attention_output_kernel_m_read_readvariableopd
`savev2_adam_transformer_layer_1_multi_head_attention_attention_output_bias_m_read_readvariableop4
0savev2_adam_dense_1_kernel_m_read_readvariableop2
.savev2_adam_dense_1_bias_m_read_readvariableop4
0savev2_adam_dense_2_kernel_m_read_readvariableop2
.savev2_adam_dense_2_bias_m_read_readvariableop]
Ysavev2_adam_transformer_layer_2_multi_head_attention_1_query_kernel_m_read_readvariableop[
Wsavev2_adam_transformer_layer_2_multi_head_attention_1_query_bias_m_read_readvariableop[
Wsavev2_adam_transformer_layer_2_multi_head_attention_1_key_kernel_m_read_readvariableopY
Usavev2_adam_transformer_layer_2_multi_head_attention_1_key_bias_m_read_readvariableop]
Ysavev2_adam_transformer_layer_2_multi_head_attention_1_value_kernel_m_read_readvariableop[
Wsavev2_adam_transformer_layer_2_multi_head_attention_1_value_bias_m_read_readvariableoph
dsavev2_adam_transformer_layer_2_multi_head_attention_1_attention_output_kernel_m_read_readvariableopf
bsavev2_adam_transformer_layer_2_multi_head_attention_1_attention_output_bias_m_read_readvariableop4
0savev2_adam_dense_3_kernel_m_read_readvariableop2
.savev2_adam_dense_3_bias_m_read_readvariableop4
0savev2_adam_dense_4_kernel_m_read_readvariableop2
.savev2_adam_dense_4_bias_m_read_readvariableop4
0savev2_adam_dense_5_kernel_v_read_readvariableop2
.savev2_adam_dense_5_bias_v_read_readvariableop4
0savev2_adam_dense_6_kernel_v_read_readvariableop2
.savev2_adam_dense_6_bias_v_read_readvariableopQ
Msavev2_adam_encoder3d_spatial_attention_conv3d_6_kernel_v_read_readvariableopO
Ksavev2_adam_encoder3d_spatial_attention_conv3d_6_bias_v_read_readvariableop3
/savev2_adam_conv3d_kernel_v_read_readvariableop1
-savev2_adam_conv3d_bias_v_read_readvariableop5
1savev2_adam_conv3d_1_kernel_v_read_readvariableop3
/savev2_adam_conv3d_1_bias_v_read_readvariableop5
1savev2_adam_conv3d_2_kernel_v_read_readvariableop3
/savev2_adam_conv3d_2_bias_v_read_readvariableop5
1savev2_adam_conv3d_3_kernel_v_read_readvariableop3
/savev2_adam_conv3d_3_bias_v_read_readvariableop5
1savev2_adam_conv3d_4_kernel_v_read_readvariableop3
/savev2_adam_conv3d_4_bias_v_read_readvariableop5
1savev2_adam_conv3d_5_kernel_v_read_readvariableop3
/savev2_adam_conv3d_5_bias_v_read_readvariableop?
;savev2_adam_time_distributed_1_kernel_v_read_readvariableop=
9savev2_adam_time_distributed_1_bias_v_read_readvariableopS
Osavev2_adam_frame_position_embedding_embedding_embeddings_v_read_readvariableop[
Wsavev2_adam_transformer_layer_1_multi_head_attention_query_kernel_v_read_readvariableopY
Usavev2_adam_transformer_layer_1_multi_head_attention_query_bias_v_read_readvariableopY
Usavev2_adam_transformer_layer_1_multi_head_attention_key_kernel_v_read_readvariableopW
Ssavev2_adam_transformer_layer_1_multi_head_attention_key_bias_v_read_readvariableop[
Wsavev2_adam_transformer_layer_1_multi_head_attention_value_kernel_v_read_readvariableopY
Usavev2_adam_transformer_layer_1_multi_head_attention_value_bias_v_read_readvariableopf
bsavev2_adam_transformer_layer_1_multi_head_attention_attention_output_kernel_v_read_readvariableopd
`savev2_adam_transformer_layer_1_multi_head_attention_attention_output_bias_v_read_readvariableop4
0savev2_adam_dense_1_kernel_v_read_readvariableop2
.savev2_adam_dense_1_bias_v_read_readvariableop4
0savev2_adam_dense_2_kernel_v_read_readvariableop2
.savev2_adam_dense_2_bias_v_read_readvariableop]
Ysavev2_adam_transformer_layer_2_multi_head_attention_1_query_kernel_v_read_readvariableop[
Wsavev2_adam_transformer_layer_2_multi_head_attention_1_query_bias_v_read_readvariableop[
Wsavev2_adam_transformer_layer_2_multi_head_attention_1_key_kernel_v_read_readvariableopY
Usavev2_adam_transformer_layer_2_multi_head_attention_1_key_bias_v_read_readvariableop]
Ysavev2_adam_transformer_layer_2_multi_head_attention_1_value_kernel_v_read_readvariableop[
Wsavev2_adam_transformer_layer_2_multi_head_attention_1_value_bias_v_read_readvariableoph
dsavev2_adam_transformer_layer_2_multi_head_attention_1_attention_output_kernel_v_read_readvariableopf
bsavev2_adam_transformer_layer_2_multi_head_attention_1_attention_output_bias_v_read_readvariableop4
0savev2_adam_dense_3_kernel_v_read_readvariableop2
.savev2_adam_dense_3_bias_v_read_readvariableop4
0savev2_adam_dense_4_kernel_v_read_readvariableop2
.savev2_adam_dense_4_bias_v_read_readvariableop
savev2_const

identity_1ЂMergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: ЪD
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes	
:*
dtype0*ђC
valueшCBхCB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB'variables/10/.ATTRIBUTES/VARIABLE_VALUEB'variables/11/.ATTRIBUTES/VARIABLE_VALUEB'variables/12/.ATTRIBUTES/VARIABLE_VALUEB'variables/13/.ATTRIBUTES/VARIABLE_VALUEB'variables/14/.ATTRIBUTES/VARIABLE_VALUEB'variables/15/.ATTRIBUTES/VARIABLE_VALUEB'variables/16/.ATTRIBUTES/VARIABLE_VALUEB'variables/17/.ATTRIBUTES/VARIABLE_VALUEB'variables/18/.ATTRIBUTES/VARIABLE_VALUEB'variables/19/.ATTRIBUTES/VARIABLE_VALUEB'variables/20/.ATTRIBUTES/VARIABLE_VALUEB'variables/21/.ATTRIBUTES/VARIABLE_VALUEB'variables/22/.ATTRIBUTES/VARIABLE_VALUEB'variables/23/.ATTRIBUTES/VARIABLE_VALUEB'variables/24/.ATTRIBUTES/VARIABLE_VALUEB'variables/25/.ATTRIBUTES/VARIABLE_VALUEB'variables/26/.ATTRIBUTES/VARIABLE_VALUEB'variables/27/.ATTRIBUTES/VARIABLE_VALUEB'variables/28/.ATTRIBUTES/VARIABLE_VALUEB'variables/29/.ATTRIBUTES/VARIABLE_VALUEB'variables/30/.ATTRIBUTES/VARIABLE_VALUEB'variables/31/.ATTRIBUTES/VARIABLE_VALUEB'variables/32/.ATTRIBUTES/VARIABLE_VALUEB'variables/33/.ATTRIBUTES/VARIABLE_VALUEB'variables/34/.ATTRIBUTES/VARIABLE_VALUEB'variables/35/.ATTRIBUTES/VARIABLE_VALUEB'variables/36/.ATTRIBUTES/VARIABLE_VALUEB'variables/37/.ATTRIBUTES/VARIABLE_VALUEB'variables/38/.ATTRIBUTES/VARIABLE_VALUEB'variables/39/.ATTRIBUTES/VARIABLE_VALUEB'variables/40/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/7/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/8/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/9/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/10/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/11/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/12/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/13/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/14/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/15/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/16/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/17/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/18/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/19/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/20/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/21/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/22/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/23/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/24/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/25/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/26/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/27/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/28/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/29/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/30/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/31/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/32/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/33/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/34/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/35/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/36/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/37/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/38/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/39/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/40/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/7/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/8/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/9/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/10/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/11/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/12/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/13/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/14/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/15/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/16/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/17/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/18/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/19/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/20/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/21/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/22/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/23/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/24/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/25/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/26/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/27/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/28/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/29/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/30/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/31/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/32/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/33/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/34/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/35/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/36/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/37/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/38/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/39/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/40/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes	
:*
dtype0*И
valueЎBЋB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B I
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0)savev2_dense_5_kernel_read_readvariableop'savev2_dense_5_bias_read_readvariableop)savev2_dense_6_kernel_read_readvariableop'savev2_dense_6_bias_read_readvariableopFsavev2_encoder3d_spatial_attention_conv3d_6_kernel_read_readvariableopDsavev2_encoder3d_spatial_attention_conv3d_6_bias_read_readvariableop(savev2_conv3d_kernel_read_readvariableop&savev2_conv3d_bias_read_readvariableop*savev2_conv3d_1_kernel_read_readvariableop(savev2_conv3d_1_bias_read_readvariableop*savev2_conv3d_2_kernel_read_readvariableop(savev2_conv3d_2_bias_read_readvariableop*savev2_conv3d_3_kernel_read_readvariableop(savev2_conv3d_3_bias_read_readvariableop*savev2_conv3d_4_kernel_read_readvariableop(savev2_conv3d_4_bias_read_readvariableop*savev2_conv3d_5_kernel_read_readvariableop(savev2_conv3d_5_bias_read_readvariableop4savev2_time_distributed_1_kernel_read_readvariableop2savev2_time_distributed_1_bias_read_readvariableopHsavev2_frame_position_embedding_embedding_embeddings_read_readvariableopPsavev2_transformer_layer_1_multi_head_attention_query_kernel_read_readvariableopNsavev2_transformer_layer_1_multi_head_attention_query_bias_read_readvariableopNsavev2_transformer_layer_1_multi_head_attention_key_kernel_read_readvariableopLsavev2_transformer_layer_1_multi_head_attention_key_bias_read_readvariableopPsavev2_transformer_layer_1_multi_head_attention_value_kernel_read_readvariableopNsavev2_transformer_layer_1_multi_head_attention_value_bias_read_readvariableop[savev2_transformer_layer_1_multi_head_attention_attention_output_kernel_read_readvariableopYsavev2_transformer_layer_1_multi_head_attention_attention_output_bias_read_readvariableop)savev2_dense_1_kernel_read_readvariableop'savev2_dense_1_bias_read_readvariableop)savev2_dense_2_kernel_read_readvariableop'savev2_dense_2_bias_read_readvariableopRsavev2_transformer_layer_2_multi_head_attention_1_query_kernel_read_readvariableopPsavev2_transformer_layer_2_multi_head_attention_1_query_bias_read_readvariableopPsavev2_transformer_layer_2_multi_head_attention_1_key_kernel_read_readvariableopNsavev2_transformer_layer_2_multi_head_attention_1_key_bias_read_readvariableopRsavev2_transformer_layer_2_multi_head_attention_1_value_kernel_read_readvariableopPsavev2_transformer_layer_2_multi_head_attention_1_value_bias_read_readvariableop]savev2_transformer_layer_2_multi_head_attention_1_attention_output_kernel_read_readvariableop[savev2_transformer_layer_2_multi_head_attention_1_attention_output_bias_read_readvariableop)savev2_dense_3_kernel_read_readvariableop'savev2_dense_3_bias_read_readvariableop)savev2_dense_4_kernel_read_readvariableop'savev2_dense_4_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop0savev2_adam_dense_5_kernel_m_read_readvariableop.savev2_adam_dense_5_bias_m_read_readvariableop0savev2_adam_dense_6_kernel_m_read_readvariableop.savev2_adam_dense_6_bias_m_read_readvariableopMsavev2_adam_encoder3d_spatial_attention_conv3d_6_kernel_m_read_readvariableopKsavev2_adam_encoder3d_spatial_attention_conv3d_6_bias_m_read_readvariableop/savev2_adam_conv3d_kernel_m_read_readvariableop-savev2_adam_conv3d_bias_m_read_readvariableop1savev2_adam_conv3d_1_kernel_m_read_readvariableop/savev2_adam_conv3d_1_bias_m_read_readvariableop1savev2_adam_conv3d_2_kernel_m_read_readvariableop/savev2_adam_conv3d_2_bias_m_read_readvariableop1savev2_adam_conv3d_3_kernel_m_read_readvariableop/savev2_adam_conv3d_3_bias_m_read_readvariableop1savev2_adam_conv3d_4_kernel_m_read_readvariableop/savev2_adam_conv3d_4_bias_m_read_readvariableop1savev2_adam_conv3d_5_kernel_m_read_readvariableop/savev2_adam_conv3d_5_bias_m_read_readvariableop;savev2_adam_time_distributed_1_kernel_m_read_readvariableop9savev2_adam_time_distributed_1_bias_m_read_readvariableopOsavev2_adam_frame_position_embedding_embedding_embeddings_m_read_readvariableopWsavev2_adam_transformer_layer_1_multi_head_attention_query_kernel_m_read_readvariableopUsavev2_adam_transformer_layer_1_multi_head_attention_query_bias_m_read_readvariableopUsavev2_adam_transformer_layer_1_multi_head_attention_key_kernel_m_read_readvariableopSsavev2_adam_transformer_layer_1_multi_head_attention_key_bias_m_read_readvariableopWsavev2_adam_transformer_layer_1_multi_head_attention_value_kernel_m_read_readvariableopUsavev2_adam_transformer_layer_1_multi_head_attention_value_bias_m_read_readvariableopbsavev2_adam_transformer_layer_1_multi_head_attention_attention_output_kernel_m_read_readvariableop`savev2_adam_transformer_layer_1_multi_head_attention_attention_output_bias_m_read_readvariableop0savev2_adam_dense_1_kernel_m_read_readvariableop.savev2_adam_dense_1_bias_m_read_readvariableop0savev2_adam_dense_2_kernel_m_read_readvariableop.savev2_adam_dense_2_bias_m_read_readvariableopYsavev2_adam_transformer_layer_2_multi_head_attention_1_query_kernel_m_read_readvariableopWsavev2_adam_transformer_layer_2_multi_head_attention_1_query_bias_m_read_readvariableopWsavev2_adam_transformer_layer_2_multi_head_attention_1_key_kernel_m_read_readvariableopUsavev2_adam_transformer_layer_2_multi_head_attention_1_key_bias_m_read_readvariableopYsavev2_adam_transformer_layer_2_multi_head_attention_1_value_kernel_m_read_readvariableopWsavev2_adam_transformer_layer_2_multi_head_attention_1_value_bias_m_read_readvariableopdsavev2_adam_transformer_layer_2_multi_head_attention_1_attention_output_kernel_m_read_readvariableopbsavev2_adam_transformer_layer_2_multi_head_attention_1_attention_output_bias_m_read_readvariableop0savev2_adam_dense_3_kernel_m_read_readvariableop.savev2_adam_dense_3_bias_m_read_readvariableop0savev2_adam_dense_4_kernel_m_read_readvariableop.savev2_adam_dense_4_bias_m_read_readvariableop0savev2_adam_dense_5_kernel_v_read_readvariableop.savev2_adam_dense_5_bias_v_read_readvariableop0savev2_adam_dense_6_kernel_v_read_readvariableop.savev2_adam_dense_6_bias_v_read_readvariableopMsavev2_adam_encoder3d_spatial_attention_conv3d_6_kernel_v_read_readvariableopKsavev2_adam_encoder3d_spatial_attention_conv3d_6_bias_v_read_readvariableop/savev2_adam_conv3d_kernel_v_read_readvariableop-savev2_adam_conv3d_bias_v_read_readvariableop1savev2_adam_conv3d_1_kernel_v_read_readvariableop/savev2_adam_conv3d_1_bias_v_read_readvariableop1savev2_adam_conv3d_2_kernel_v_read_readvariableop/savev2_adam_conv3d_2_bias_v_read_readvariableop1savev2_adam_conv3d_3_kernel_v_read_readvariableop/savev2_adam_conv3d_3_bias_v_read_readvariableop1savev2_adam_conv3d_4_kernel_v_read_readvariableop/savev2_adam_conv3d_4_bias_v_read_readvariableop1savev2_adam_conv3d_5_kernel_v_read_readvariableop/savev2_adam_conv3d_5_bias_v_read_readvariableop;savev2_adam_time_distributed_1_kernel_v_read_readvariableop9savev2_adam_time_distributed_1_bias_v_read_readvariableopOsavev2_adam_frame_position_embedding_embedding_embeddings_v_read_readvariableopWsavev2_adam_transformer_layer_1_multi_head_attention_query_kernel_v_read_readvariableopUsavev2_adam_transformer_layer_1_multi_head_attention_query_bias_v_read_readvariableopUsavev2_adam_transformer_layer_1_multi_head_attention_key_kernel_v_read_readvariableopSsavev2_adam_transformer_layer_1_multi_head_attention_key_bias_v_read_readvariableopWsavev2_adam_transformer_layer_1_multi_head_attention_value_kernel_v_read_readvariableopUsavev2_adam_transformer_layer_1_multi_head_attention_value_bias_v_read_readvariableopbsavev2_adam_transformer_layer_1_multi_head_attention_attention_output_kernel_v_read_readvariableop`savev2_adam_transformer_layer_1_multi_head_attention_attention_output_bias_v_read_readvariableop0savev2_adam_dense_1_kernel_v_read_readvariableop.savev2_adam_dense_1_bias_v_read_readvariableop0savev2_adam_dense_2_kernel_v_read_readvariableop.savev2_adam_dense_2_bias_v_read_readvariableopYsavev2_adam_transformer_layer_2_multi_head_attention_1_query_kernel_v_read_readvariableopWsavev2_adam_transformer_layer_2_multi_head_attention_1_query_bias_v_read_readvariableopWsavev2_adam_transformer_layer_2_multi_head_attention_1_key_kernel_v_read_readvariableopUsavev2_adam_transformer_layer_2_multi_head_attention_1_key_bias_v_read_readvariableopYsavev2_adam_transformer_layer_2_multi_head_attention_1_value_kernel_v_read_readvariableopWsavev2_adam_transformer_layer_2_multi_head_attention_1_value_bias_v_read_readvariableopdsavev2_adam_transformer_layer_2_multi_head_attention_1_attention_output_kernel_v_read_readvariableopbsavev2_adam_transformer_layer_2_multi_head_attention_1_attention_output_bias_v_read_readvariableop0savev2_adam_dense_3_kernel_v_read_readvariableop.savev2_adam_dense_3_bias_v_read_readvariableop0savev2_adam_dense_4_kernel_v_read_readvariableop.savev2_adam_dense_4_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *Ђ
dtypes
2	
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*Н
_input_shapesЋ
Ј: :
::	:::: : :  : : @:@:@@:@:@::::	@:@:@:@@:@:@@:@:@@:@:@@:@:	@::	@:@:@@:@:@@:@:@@:@:@@:@:	@::	@:@: : : : : : : : : :
::	:::: : :  : : @:@:@@:@:@::::	@:@:@:@@:@:@@:@:@@:@:@@:@:	@::	@:@:@@:@:@@:@:@@:@:@@:@:	@::	@:@:
::	:::: : :  : : @:@:@@:@:@::::	@:@:@:@@:@:@@:@:@@:@:@@:@:	@::	@:@:@@:@:@@:@:@@:@:@@:@:	@::	@:@: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:&"
 
_output_shapes
:
:!

_output_shapes	
::%!

_output_shapes
:	: 

_output_shapes
::0,
*
_output_shapes
:: 

_output_shapes
::0,
*
_output_shapes
: : 

_output_shapes
: :0	,
*
_output_shapes
:  : 


_output_shapes
: :0,
*
_output_shapes
: @: 

_output_shapes
:@:0,
*
_output_shapes
:@@: 

_output_shapes
:@:1-
+
_output_shapes
:@:!

_output_shapes	
::2.
,
_output_shapes
::!

_output_shapes	
::%!

_output_shapes
:	@: 

_output_shapes
:@:$ 

_output_shapes

:@:($
"
_output_shapes
:@@:$ 

_output_shapes

:@:($
"
_output_shapes
:@@:$ 

_output_shapes

:@:($
"
_output_shapes
:@@:$ 

_output_shapes

:@:($
"
_output_shapes
:@@: 

_output_shapes
:@:%!

_output_shapes
:	@:!

_output_shapes	
::% !

_output_shapes
:	@: !

_output_shapes
:@:("$
"
_output_shapes
:@@:$# 

_output_shapes

:@:($$
"
_output_shapes
:@@:$% 

_output_shapes

:@:(&$
"
_output_shapes
:@@:$' 

_output_shapes

:@:(($
"
_output_shapes
:@@: )

_output_shapes
:@:%*!

_output_shapes
:	@:!+

_output_shapes	
::%,!

_output_shapes
:	@: -

_output_shapes
:@:.

_output_shapes
: :/

_output_shapes
: :0

_output_shapes
: :1

_output_shapes
: :2

_output_shapes
: :3

_output_shapes
: :4

_output_shapes
: :5

_output_shapes
: :6

_output_shapes
: :&7"
 
_output_shapes
:
:!8

_output_shapes	
::%9!

_output_shapes
:	: :

_output_shapes
::0;,
*
_output_shapes
:: <

_output_shapes
::0=,
*
_output_shapes
: : >

_output_shapes
: :0?,
*
_output_shapes
:  : @

_output_shapes
: :0A,
*
_output_shapes
: @: B

_output_shapes
:@:0C,
*
_output_shapes
:@@: D

_output_shapes
:@:1E-
+
_output_shapes
:@:!F

_output_shapes	
::2G.
,
_output_shapes
::!H

_output_shapes	
::%I!

_output_shapes
:	@: J

_output_shapes
:@:$K 

_output_shapes

:@:(L$
"
_output_shapes
:@@:$M 

_output_shapes

:@:(N$
"
_output_shapes
:@@:$O 

_output_shapes

:@:(P$
"
_output_shapes
:@@:$Q 

_output_shapes

:@:(R$
"
_output_shapes
:@@: S

_output_shapes
:@:%T!

_output_shapes
:	@:!U

_output_shapes	
::%V!

_output_shapes
:	@: W

_output_shapes
:@:(X$
"
_output_shapes
:@@:$Y 

_output_shapes

:@:(Z$
"
_output_shapes
:@@:$[ 

_output_shapes

:@:(\$
"
_output_shapes
:@@:$] 

_output_shapes

:@:(^$
"
_output_shapes
:@@: _

_output_shapes
:@:%`!

_output_shapes
:	@:!a

_output_shapes	
::%b!

_output_shapes
:	@: c

_output_shapes
:@:&d"
 
_output_shapes
:
:!e

_output_shapes	
::%f!

_output_shapes
:	: g

_output_shapes
::0h,
*
_output_shapes
:: i

_output_shapes
::0j,
*
_output_shapes
: : k

_output_shapes
: :0l,
*
_output_shapes
:  : m

_output_shapes
: :0n,
*
_output_shapes
: @: o

_output_shapes
:@:0p,
*
_output_shapes
:@@: q

_output_shapes
:@:1r-
+
_output_shapes
:@:!s

_output_shapes	
::2t.
,
_output_shapes
::!u

_output_shapes	
::%v!

_output_shapes
:	@: w

_output_shapes
:@:$x 

_output_shapes

:@:(y$
"
_output_shapes
:@@:$z 

_output_shapes

:@:({$
"
_output_shapes
:@@:$| 

_output_shapes

:@:(}$
"
_output_shapes
:@@:$~ 

_output_shapes

:@:($
"
_output_shapes
:@@:!

_output_shapes
:@:&!

_output_shapes
:	@:"

_output_shapes	
::&!

_output_shapes
:	@:!

_output_shapes
:@:)$
"
_output_shapes
:@@:% 

_output_shapes

:@:)$
"
_output_shapes
:@@:% 

_output_shapes

:@:)$
"
_output_shapes
:@@:% 

_output_shapes

:@:)$
"
_output_shapes
:@@:!

_output_shapes
:@:&!

_output_shapes
:	@:"

_output_shapes	
::&!

_output_shapes
:	@:!

_output_shapes
:@:

_output_shapes
: 
Ќ
Ў
E__inference_sequential_layer_call_and_return_conditional_losses_13447
dense_1_input 
dense_1_13436:	@
dense_1_13438:	 
dense_2_13441:	@
dense_2_13443:@
identityЂdense_1/StatefulPartitionedCallЂdense_2/StatefulPartitionedCallј
dense_1/StatefulPartitionedCallStatefulPartitionedCalldense_1_inputdense_1_13436dense_1_13438*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_13306
dense_2/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0dense_2_13441dense_2_13443*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_13342{
IdentityIdentity(dense_2/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@
NoOpNoOp ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall:Z V
+
_output_shapes
:џџџџџџџџџ@
'
_user_specified_namedense_1_input


M__inference_time_distributed_1_layer_call_and_return_conditional_losses_13261

inputs7
$dense_matmul_readvariableop_resource:	@3
%dense_biasadd_readvariableop_resource:@
identityЂdense/BiasAdd/ReadVariableOpЂdense/MatMul/ReadVariableOp;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:б
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask^
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   e
ReshapeReshapeinputsReshape/shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџ
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource*
_output_shapes
:	@*
dtype0
dense/MatMulMatMulReshape:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@~
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@U
dense/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?z
dense/Gelu/mulMuldense/Gelu/mul/x:output:0dense/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ@V
dense/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?
dense/Gelu/truedivRealDivdense/BiasAdd:output:0dense/Gelu/Cast/x:output:0*
T0*'
_output_shapes
:џџџџџџџџџ@_
dense/Gelu/ErfErfdense/Gelu/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџ@U
dense/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?x
dense/Gelu/addAddV2dense/Gelu/add/x:output:0dense/Gelu/Erf:y:0*
T0*'
_output_shapes
:џџџџџџџџџ@q
dense/Gelu/mul_1Muldense/Gelu/mul:z:0dense/Gelu/add:z:0*
T0*'
_output_shapes
:џџџџџџџџџ@\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџS
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value	B :@
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:
	Reshape_1Reshapedense/Gelu/mul_1:z:0Reshape_1/shape:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ@n
IdentityIdentityReshape_1:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ@
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:џџџџџџџџџџџџџџџџџџ: : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp:] Y
5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
Ѕ

C__inference_conv3d_2_layer_call_and_return_conditional_losses_14975

inputs<
conv3d_readvariableop_resource: @-
biasadd_readvariableop_resource:@
identityЂBiasAdd/ReadVariableOpЂConv3D/ReadVariableOp
Conv3D/ReadVariableOpReadVariableOpconv3d_readvariableop_resource**
_output_shapes
: @*
dtype0
Conv3DConv3DinputsConv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
BiasAddBiasAddConv3D:output:0BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@\
ReluReluBiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@m
IdentityIdentityRelu:activations:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv3D/ReadVariableOpConv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ 
 
_user_specified_nameinputs
Ѕ

C__inference_conv3d_1_layer_call_and_return_conditional_losses_14955

inputs<
conv3d_readvariableop_resource:  -
biasadd_readvariableop_resource: 
identityЂBiasAdd/ReadVariableOpЂConv3D/ReadVariableOp
Conv3D/ReadVariableOpReadVariableOpconv3d_readvariableop_resource**
_output_shapes
:  *
dtype0
Conv3DConv3DinputsConv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0
BiasAddBiasAddConv3D:output:0BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   \
ReluReluBiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   m
IdentityIdentityRelu:activations:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ   : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv3D/ReadVariableOpConv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ   
 
_user_specified_nameinputs
Ь
Е
(__inference_encoder3d_layer_call_fn_3895

inputs%
unknown:
	unknown_0:'
	unknown_1: 
	unknown_2: '
	unknown_3:  
	unknown_4: '
	unknown_5: @
	unknown_6:@'
	unknown_7:@@
	unknown_8:@(
	unknown_9:@

unknown_10:	*

unknown_11:

unknown_12:	
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_encoder3d_layer_call_and_return_conditional_losses_3876`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 |
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:џџџџџџџџџ  : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
Ш

'__inference_dense_5_layer_call_fn_13681

inputs
unknown:

	unknown_0:	
identityЂStatefulPartitionedCallл
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_11698p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:џџџџџџџџџ: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
ѕC
ї
@__inference_model_layer_call_and_return_conditional_losses_11722

inputs-
encoder3d_11580:
encoder3d_11582:-
encoder3d_11584: 
encoder3d_11586: -
encoder3d_11588:  
encoder3d_11590: -
encoder3d_11592: @
encoder3d_11594:@-
encoder3d_11596:@@
encoder3d_11598:@.
encoder3d_11600:@
encoder3d_11602:	/
encoder3d_11604:
encoder3d_11606:	+
time_distributed_1_11612:	@&
time_distributed_1_11614:@0
frame_position_embedding_11619:@/
transformer_layer_1_11622:@@+
transformer_layer_1_11624:@/
transformer_layer_1_11626:@@+
transformer_layer_1_11628:@/
transformer_layer_1_11630:@@+
transformer_layer_1_11632:@/
transformer_layer_1_11634:@@'
transformer_layer_1_11636:@,
transformer_layer_1_11638:	@(
transformer_layer_1_11640:	,
transformer_layer_1_11642:	@'
transformer_layer_1_11644:@/
transformer_layer_2_11647:@@+
transformer_layer_2_11649:@/
transformer_layer_2_11651:@@+
transformer_layer_2_11653:@/
transformer_layer_2_11655:@@+
transformer_layer_2_11657:@/
transformer_layer_2_11659:@@'
transformer_layer_2_11661:@,
transformer_layer_2_11663:	@(
transformer_layer_2_11665:	,
transformer_layer_2_11667:	@'
transformer_layer_2_11669:@!
dense_5_11699:

dense_5_11701:	 
dense_6_11716:	
dense_6_11718:
identityЂdense_5/StatefulPartitionedCallЂdense_6/StatefulPartitionedCallЂ!encoder3d/StatefulPartitionedCallЂ0frame_position_embedding/StatefulPartitionedCallЂ*time_distributed_1/StatefulPartitionedCallЂ+transformer_layer_1/StatefulPartitionedCallЂ+transformer_layer_2/StatefulPartitionedCallЩ
!encoder3d/StatefulPartitionedCallStatefulPartitionedCallinputsencoder3d_11580encoder3d_11582encoder3d_11584encoder3d_11586encoder3d_11588encoder3d_11590encoder3d_11592encoder3d_11594encoder3d_11596encoder3d_11598encoder3d_11600encoder3d_11602encoder3d_11604encoder3d_11606*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11227ѓ
 time_distributed/PartitionedCallPartitionedCall*encoder3d/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_time_distributed_layer_call_and_return_conditional_losses_11454w
time_distributed/Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"џџџџ         Г
time_distributed/ReshapeReshape*encoder3d/StatefulPartitionedCall:output:0'time_distributed/Reshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџП
*time_distributed_1/StatefulPartitionedCallStatefulPartitionedCall)time_distributed/PartitionedCall:output:0time_distributed_1_11612time_distributed_1_11614*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *V
fQRO
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_11527q
 time_distributed_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   Ў
time_distributed_1/ReshapeReshape)time_distributed/PartitionedCall:output:0)time_distributed_1/Reshape/shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџ
0frame_position_embedding/StatefulPartitionedCallStatefulPartitionedCall3time_distributed_1/StatefulPartitionedCall:output:0frame_position_embedding_11619*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11291Я
+transformer_layer_1/StatefulPartitionedCallStatefulPartitionedCall9frame_position_embedding/StatefulPartitionedCall:output:0transformer_layer_1_11622transformer_layer_1_11624transformer_layer_1_11626transformer_layer_1_11628transformer_layer_1_11630transformer_layer_1_11632transformer_layer_1_11634transformer_layer_1_11636transformer_layer_1_11638transformer_layer_1_11640transformer_layer_1_11642transformer_layer_1_11644*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11323Ъ
+transformer_layer_2/StatefulPartitionedCallStatefulPartitionedCall4transformer_layer_1/StatefulPartitionedCall:output:0transformer_layer_2_11647transformer_layer_2_11649transformer_layer_2_11651transformer_layer_2_11653transformer_layer_2_11655transformer_layer_2_11657transformer_layer_2_11659transformer_layer_2_11661transformer_layer_2_11663transformer_layer_2_11665transformer_layer_2_11667transformer_layer_2_11669*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11377ы
flatten_1/PartitionedCallPartitionedCall4transformer_layer_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_flatten_1_layer_call_and_return_conditional_losses_11678
dense_5/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_5_11699dense_5_11701*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_11698
dense_6/StatefulPartitionedCallStatefulPartitionedCall(dense_5/StatefulPartitionedCall:output:0dense_6_11716dense_6_11718*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_6_layer_call_and_return_conditional_losses_11715w
IdentityIdentity(dense_6/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџъ
NoOpNoOp ^dense_5/StatefulPartitionedCall ^dense_6/StatefulPartitionedCall"^encoder3d/StatefulPartitionedCall1^frame_position_embedding/StatefulPartitionedCall+^time_distributed_1/StatefulPartitionedCall,^transformer_layer_1/StatefulPartitionedCall,^transformer_layer_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes{
y:џџџџџџџџџ  : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2B
dense_6/StatefulPartitionedCalldense_6/StatefulPartitionedCall2F
!encoder3d/StatefulPartitionedCall!encoder3d/StatefulPartitionedCall2d
0frame_position_embedding/StatefulPartitionedCall0frame_position_embedding/StatefulPartitionedCall2X
*time_distributed_1/StatefulPartitionedCall*time_distributed_1/StatefulPartitionedCall2Z
+transformer_layer_1/StatefulPartitionedCall+transformer_layer_1/StatefulPartitionedCall2Z
+transformer_layer_2/StatefulPartitionedCall+transformer_layer_2/StatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
џD
з
E__inference_sequential_layer_call_and_return_conditional_losses_14339

inputs<
)dense_1_tensordot_readvariableop_resource:	@6
'dense_1_biasadd_readvariableop_resource:	<
)dense_2_tensordot_readvariableop_resource:	@5
'dense_2_biasadd_readvariableop_resource:@
identityЂdense_1/BiasAdd/ReadVariableOpЂ dense_1/Tensordot/ReadVariableOpЂdense_2/BiasAdd/ReadVariableOpЂ dense_2/Tensordot/ReadVariableOp
 dense_1/Tensordot/ReadVariableOpReadVariableOp)dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0`
dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       M
dense_1/Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:a
dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : л
dense_1/Tensordot/GatherV2GatherV2 dense_1/Tensordot/Shape:output:0dense_1/Tensordot/free:output:0(dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : п
dense_1/Tensordot/GatherV2_1GatherV2 dense_1/Tensordot/Shape:output:0dense_1/Tensordot/axes:output:0*dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
dense_1/Tensordot/ProdProd#dense_1/Tensordot/GatherV2:output:0 dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 
dense_1/Tensordot/Prod_1Prod%dense_1/Tensordot/GatherV2_1:output:0"dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : М
dense_1/Tensordot/concatConcatV2dense_1/Tensordot/free:output:0dense_1/Tensordot/axes:output:0&dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:
dense_1/Tensordot/stackPackdense_1/Tensordot/Prod:output:0!dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:
dense_1/Tensordot/transpose	Transposeinputs!dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ђ
dense_1/Tensordot/ReshapeReshapedense_1/Tensordot/transpose:y:0 dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЃ
dense_1/Tensordot/MatMulMatMul"dense_1/Tensordot/Reshape:output:0(dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџd
dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:a
dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ч
dense_1/Tensordot/concat_1ConcatV2#dense_1/Tensordot/GatherV2:output:0"dense_1/Tensordot/Const_2:output:0(dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
dense_1/TensordotReshape"dense_1/Tensordot/MatMul:product:0#dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
dense_1/BiasAddBiasAdddense_1/Tensordot:output:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџW
dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?
dense_1/Gelu/mulMuldense_1/Gelu/mul/x:output:0dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџX
dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?
dense_1/Gelu/truedivRealDivdense_1/BiasAdd:output:0dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџh
dense_1/Gelu/ErfErfdense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџW
dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
dense_1/Gelu/addAddV2dense_1/Gelu/add/x:output:0dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџ|
dense_1/Gelu/mul_1Muldense_1/Gelu/mul:z:0dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџ
 dense_2/Tensordot/ReadVariableOpReadVariableOp)dense_2_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0`
dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:g
dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       ]
dense_2/Tensordot/ShapeShapedense_1/Gelu/mul_1:z:0*
T0*
_output_shapes
:a
dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : л
dense_2/Tensordot/GatherV2GatherV2 dense_2/Tensordot/Shape:output:0dense_2/Tensordot/free:output:0(dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:c
!dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : п
dense_2/Tensordot/GatherV2_1GatherV2 dense_2/Tensordot/Shape:output:0dense_2/Tensordot/axes:output:0*dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:a
dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: 
dense_2/Tensordot/ProdProd#dense_2/Tensordot/GatherV2:output:0 dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: 
dense_2/Tensordot/Prod_1Prod%dense_2/Tensordot/GatherV2_1:output:0"dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : М
dense_2/Tensordot/concatConcatV2dense_2/Tensordot/free:output:0dense_2/Tensordot/axes:output:0&dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:
dense_2/Tensordot/stackPackdense_2/Tensordot/Prod:output:0!dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:
dense_2/Tensordot/transpose	Transposedense_1/Gelu/mul_1:z:0!dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџЂ
dense_2/Tensordot/ReshapeReshapedense_2/Tensordot/transpose:y:0 dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЂ
dense_2/Tensordot/MatMulMatMul"dense_2/Tensordot/Reshape:output:0(dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@c
dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@a
dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ч
dense_2/Tensordot/concat_1ConcatV2#dense_2/Tensordot/GatherV2:output:0"dense_2/Tensordot/Const_2:output:0(dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
dense_2/TensordotReshape"dense_2/Tensordot/MatMul:product:0#dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
dense_2/BiasAddBiasAdddense_2/Tensordot:output:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@k
IdentityIdentitydense_2/BiasAdd:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@Ю
NoOpNoOp^dense_1/BiasAdd/ReadVariableOp!^dense_1/Tensordot/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp!^dense_2/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2D
 dense_1/Tensordot/ReadVariableOp dense_1/Tensordot/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2D
 dense_2/Tensordot/ReadVariableOp dense_2/Tensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
Т
і
B__inference_dense_5_layer_call_and_return_conditional_losses_13699

inputs2
matmul_readvariableop_resource:
.
biasadd_readvariableop_resource:	
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџO

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?i
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*(
_output_shapes
:џџџџџџџџџP
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?r
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*(
_output_shapes
:џџџџџџџџџT
Gelu/ErfErfGelu/truediv:z:0*
T0*(
_output_shapes
:џџџџџџџџџO

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?g
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*(
_output_shapes
:џџџџџџџџџ`

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*(
_output_shapes
:џџџџџџџџџ^
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*(
_output_shapes
:џџџџџџџџџw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs

б
G__inference_sequential_2_layer_call_and_return_conditional_losses_14167
conv3d_4_input-
conv3d_4_14156:@
conv3d_4_14158:	.
conv3d_5_14161:
conv3d_5_14163:	
identityЂ conv3d_4/StatefulPartitionedCallЂ conv3d_5/StatefulPartitionedCall
 conv3d_4/StatefulPartitionedCallStatefulPartitionedCallconv3d_4_inputconv3d_4_14156conv3d_4_14158*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_4_layer_call_and_return_conditional_losses_14045 
 conv3d_5/StatefulPartitionedCallStatefulPartitionedCall)conv3d_4/StatefulPartitionedCall:output:0conv3d_5_14161conv3d_5_14163*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_5_layer_call_and_return_conditional_losses_14062
IdentityIdentity)conv3d_5/StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ
NoOpNoOp!^conv3d_4/StatefulPartitionedCall!^conv3d_5/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ@: : : : 2D
 conv3d_4/StatefulPartitionedCall conv3d_4/StatefulPartitionedCall2D
 conv3d_5/StatefulPartitionedCall conv3d_5/StatefulPartitionedCall:c _
3
_output_shapes!
:џџџџџџџџџ@
(
_user_specified_nameconv3d_4_input
В
в
,__inference_sequential_1_layer_call_fn_14429

inputs
unknown:	@
	unknown_0:	
	unknown_1:	@
	unknown_2:@
identityЂStatefulPartitionedCall§
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *P
fKRI
G__inference_sequential_1_layer_call_and_return_conditional_losses_13609s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
з
f
J__inference_max_pooling3d_2_layer_call_and_return_conditional_losses_13138

inputs
identityН
	MaxPool3D	MaxPool3Dinputs*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ*
ksize	
*
paddingSAME*
strides	

IdentityIdentityMaxPool3D:output:0*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ: {
W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
я
g
K__inference_time_distributed_layer_call_and_return_conditional_losses_11481

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:б
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"џџџџ         m
ReshapeReshapeinputsReshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџУ
flatten/PartitionedCallPartitionedCallReshape:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_flatten_layer_call_and_return_conditional_losses_11447\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџT
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value
B :
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:
	Reshape_1Reshape flatten/PartitionedCall:output:0Reshape_1/shape:output:0*
T0*5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџh
IdentityIdentityReshape_1:output:0*
T0*5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'џџџџџџџџџџџџџџџџџџ:e a
=
_output_shapes+
):'џџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs

я
G__inference_sequential_2_layer_call_and_return_conditional_losses_14725

inputsF
'conv3d_4_conv3d_readvariableop_resource:@7
(conv3d_4_biasadd_readvariableop_resource:	G
'conv3d_5_conv3d_readvariableop_resource:7
(conv3d_5_biasadd_readvariableop_resource:	
identityЂconv3d_4/BiasAdd/ReadVariableOpЂconv3d_4/Conv3D/ReadVariableOpЂconv3d_5/BiasAdd/ReadVariableOpЂconv3d_5/Conv3D/ReadVariableOp
conv3d_4/Conv3D/ReadVariableOpReadVariableOp'conv3d_4_conv3d_readvariableop_resource*+
_output_shapes
:@*
dtype0Б
conv3d_4/Conv3DConv3Dinputs&conv3d_4/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	

conv3d_4/BiasAdd/ReadVariableOpReadVariableOp(conv3d_4_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
conv3d_4/BiasAddBiasAddconv3d_4/Conv3D:output:0'conv3d_4/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџo
conv3d_4/ReluReluconv3d_4/BiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџ
conv3d_5/Conv3D/ReadVariableOpReadVariableOp'conv3d_5_conv3d_readvariableop_resource*,
_output_shapes
:*
dtype0Ц
conv3d_5/Conv3DConv3Dconv3d_4/Relu:activations:0&conv3d_5/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	

conv3d_5/BiasAdd/ReadVariableOpReadVariableOp(conv3d_5_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
conv3d_5/BiasAddBiasAddconv3d_5/Conv3D:output:0'conv3d_5/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџo
conv3d_5/ReluReluconv3d_5/BiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџw
IdentityIdentityconv3d_5/Relu:activations:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџЬ
NoOpNoOp ^conv3d_4/BiasAdd/ReadVariableOp^conv3d_4/Conv3D/ReadVariableOp ^conv3d_5/BiasAdd/ReadVariableOp^conv3d_5/Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ@: : : : 2B
conv3d_4/BiasAdd/ReadVariableOpconv3d_4/BiasAdd/ReadVariableOp2@
conv3d_4/Conv3D/ReadVariableOpconv3d_4/Conv3D/ReadVariableOp2B
conv3d_5/BiasAdd/ReadVariableOpconv3d_5/BiasAdd/ReadVariableOp2@
conv3d_5/Conv3D/ReadVariableOpconv3d_5/Conv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ@
 
_user_specified_nameinputs

Ї
E__inference_sequential_layer_call_and_return_conditional_losses_13409

inputs 
dense_1_13398:	@
dense_1_13400:	 
dense_2_13403:	@
dense_2_13405:@
identityЂdense_1/StatefulPartitionedCallЂdense_2/StatefulPartitionedCallё
dense_1/StatefulPartitionedCallStatefulPartitionedCallinputsdense_1_13398dense_1_13400*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_13306
dense_2/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0dense_2_13403dense_2_13405*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_13342{
IdentityIdentity(dense_2/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@
NoOpNoOp ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
­

C__inference_conv3d_4_layer_call_and_return_conditional_losses_15015

inputs=
conv3d_readvariableop_resource:@.
biasadd_readvariableop_resource:	
identityЂBiasAdd/ReadVariableOpЂConv3D/ReadVariableOp
Conv3D/ReadVariableOpReadVariableOpconv3d_readvariableop_resource*+
_output_shapes
:@*
dtype0
Conv3DConv3DinputsConv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	
s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
BiasAddBiasAddConv3D:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ]
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџn
IdentityIdentityRelu:activations:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџw
NoOpNoOp^BiasAdd/ReadVariableOp^Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv3D/ReadVariableOpConv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ@
 
_user_specified_nameinputs

Ї
E__inference_sequential_layer_call_and_return_conditional_losses_13349

inputs 
dense_1_13307:	@
dense_1_13309:	 
dense_2_13343:	@
dense_2_13345:@
identityЂdense_1/StatefulPartitionedCallЂdense_2/StatefulPartitionedCallё
dense_1/StatefulPartitionedCallStatefulPartitionedCallinputsdense_1_13307dense_1_13309*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_13306
dense_2/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0dense_2_13343dense_2_13345*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_13342{
IdentityIdentity(dense_2/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@
NoOpNoOp ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs

У
(__inference_restored_function_body_12044

inputs
unknown:@@
	unknown_0:@
	unknown_1:@@
	unknown_2:@
	unknown_3:@@
	unknown_4:@
	unknown_5:@@
	unknown_6:@
	unknown_7:	@
	unknown_8:	
	unknown_9:	@

unknown_10:@
identityЂStatefulPartitionedCallЬ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *U
fPRN
L__inference_transformer_layer_1_layer_call_and_return_conditional_losses_971s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
А
C
'__inference_flatten_layer_call_fn_14216

inputs
identityБ
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_flatten_layer_call_and_return_conditional_losses_11447a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:џџџџџџџџџ:X T
0
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
з
f
J__inference_max_pooling3d_1_layer_call_and_return_conditional_losses_14201

inputs
identityН
	MaxPool3D	MaxPool3Dinputs*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ*
ksize	
*
paddingSAME*
strides	

IdentityIdentityMaxPool3D:output:0*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ: {
W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
вp
Л
 __inference__wrapped_model_11427
input_13
model_encoder3d_11228:#
model_encoder3d_11230:3
model_encoder3d_11232: #
model_encoder3d_11234: 3
model_encoder3d_11236:  #
model_encoder3d_11238: 3
model_encoder3d_11240: @#
model_encoder3d_11242:@3
model_encoder3d_11244:@@#
model_encoder3d_11246:@4
model_encoder3d_11248:@$
model_encoder3d_11250:	5
model_encoder3d_11252:$
model_encoder3d_11254:	P
=model_time_distributed_1_dense_matmul_readvariableop_resource:	@L
>model_time_distributed_1_dense_biasadd_readvariableop_resource:@6
$model_frame_position_embedding_11292:@5
model_transformer_layer_1_11324:@@1
model_transformer_layer_1_11326:@5
model_transformer_layer_1_11328:@@1
model_transformer_layer_1_11330:@5
model_transformer_layer_1_11332:@@1
model_transformer_layer_1_11334:@5
model_transformer_layer_1_11336:@@-
model_transformer_layer_1_11338:@2
model_transformer_layer_1_11340:	@.
model_transformer_layer_1_11342:	2
model_transformer_layer_1_11344:	@-
model_transformer_layer_1_11346:@5
model_transformer_layer_2_11378:@@1
model_transformer_layer_2_11380:@5
model_transformer_layer_2_11382:@@1
model_transformer_layer_2_11384:@5
model_transformer_layer_2_11386:@@1
model_transformer_layer_2_11388:@5
model_transformer_layer_2_11390:@@-
model_transformer_layer_2_11392:@2
model_transformer_layer_2_11394:	@.
model_transformer_layer_2_11396:	2
model_transformer_layer_2_11398:	@-
model_transformer_layer_2_11400:@@
,model_dense_5_matmul_readvariableop_resource:
<
-model_dense_5_biasadd_readvariableop_resource:	?
,model_dense_6_matmul_readvariableop_resource:	;
-model_dense_6_biasadd_readvariableop_resource:
identityЂ$model/dense_5/BiasAdd/ReadVariableOpЂ#model/dense_5/MatMul/ReadVariableOpЂ$model/dense_6/BiasAdd/ReadVariableOpЂ#model/dense_6/MatMul/ReadVariableOpЂ'model/encoder3d/StatefulPartitionedCallЂ6model/frame_position_embedding/StatefulPartitionedCallЂ5model/time_distributed_1/dense/BiasAdd/ReadVariableOpЂ4model/time_distributed_1/dense/MatMul/ReadVariableOpЂ1model/transformer_layer_1/StatefulPartitionedCallЂ1model/transformer_layer_2/StatefulPartitionedCallЄ
'model/encoder3d/StatefulPartitionedCallStatefulPartitionedCallinput_1model_encoder3d_11228model_encoder3d_11230model_encoder3d_11232model_encoder3d_11234model_encoder3d_11236model_encoder3d_11238model_encoder3d_11240model_encoder3d_11242model_encoder3d_11244model_encoder3d_11246model_encoder3d_11248model_encoder3d_11250model_encoder3d_11252model_encoder3d_11254*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11227}
$model/time_distributed/Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"џџџџ         Х
model/time_distributed/ReshapeReshape0model/encoder3d/StatefulPartitionedCall:output:0-model/time_distributed/Reshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџu
$model/time_distributed/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   М
&model/time_distributed/flatten/ReshapeReshape'model/time_distributed/Reshape:output:0-model/time_distributed/flatten/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџ{
&model/time_distributed/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*!
valueB"џџџџ      Ф
 model/time_distributed/Reshape_1Reshape/model/time_distributed/flatten/Reshape:output:0/model/time_distributed/Reshape_1/shape:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
&model/time_distributed/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*%
valueB"џџџџ         Щ
 model/time_distributed/Reshape_2Reshape0model/encoder3d/StatefulPartitionedCall:output:0/model/time_distributed/Reshape_2/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџw
&model/time_distributed_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   К
 model/time_distributed_1/ReshapeReshape)model/time_distributed/Reshape_1:output:0/model/time_distributed_1/Reshape/shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџГ
4model/time_distributed_1/dense/MatMul/ReadVariableOpReadVariableOp=model_time_distributed_1_dense_matmul_readvariableop_resource*
_output_shapes
:	@*
dtype0Ъ
%model/time_distributed_1/dense/MatMulMatMul)model/time_distributed_1/Reshape:output:0<model/time_distributed_1/dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@А
5model/time_distributed_1/dense/BiasAdd/ReadVariableOpReadVariableOp>model_time_distributed_1_dense_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0г
&model/time_distributed_1/dense/BiasAddBiasAdd/model/time_distributed_1/dense/MatMul:product:0=model/time_distributed_1/dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@n
)model/time_distributed_1/dense/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Х
'model/time_distributed_1/dense/Gelu/mulMul2model/time_distributed_1/dense/Gelu/mul/x:output:0/model/time_distributed_1/dense/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ@o
*model/time_distributed_1/dense/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?Ю
+model/time_distributed_1/dense/Gelu/truedivRealDiv/model/time_distributed_1/dense/BiasAdd:output:03model/time_distributed_1/dense/Gelu/Cast/x:output:0*
T0*'
_output_shapes
:џџџџџџџџџ@
'model/time_distributed_1/dense/Gelu/ErfErf/model/time_distributed_1/dense/Gelu/truediv:z:0*
T0*'
_output_shapes
:џџџџџџџџџ@n
)model/time_distributed_1/dense/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?У
'model/time_distributed_1/dense/Gelu/addAddV22model/time_distributed_1/dense/Gelu/add/x:output:0+model/time_distributed_1/dense/Gelu/Erf:y:0*
T0*'
_output_shapes
:џџџџџџџџџ@М
)model/time_distributed_1/dense/Gelu/mul_1Mul+model/time_distributed_1/dense/Gelu/mul:z:0+model/time_distributed_1/dense/Gelu/add:z:0*
T0*'
_output_shapes
:џџџџџџџџџ@}
(model/time_distributed_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*!
valueB"џџџџ   @   Х
"model/time_distributed_1/Reshape_1Reshape-model/time_distributed_1/dense/Gelu/mul_1:z:01model/time_distributed_1/Reshape_1/shape:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@y
(model/time_distributed_1/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   О
"model/time_distributed_1/Reshape_2Reshape)model/time_distributed/Reshape_1:output:01model/time_distributed_1/Reshape_2/shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџ
6model/frame_position_embedding/StatefulPartitionedCallStatefulPartitionedCall+model/time_distributed_1/Reshape_1:output:0$model_frame_position_embedding_11292*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11291Ѓ
1model/transformer_layer_1/StatefulPartitionedCallStatefulPartitionedCall?model/frame_position_embedding/StatefulPartitionedCall:output:0model_transformer_layer_1_11324model_transformer_layer_1_11326model_transformer_layer_1_11328model_transformer_layer_1_11330model_transformer_layer_1_11332model_transformer_layer_1_11334model_transformer_layer_1_11336model_transformer_layer_1_11338model_transformer_layer_1_11340model_transformer_layer_1_11342model_transformer_layer_1_11344model_transformer_layer_1_11346*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11323
1model/transformer_layer_2/StatefulPartitionedCallStatefulPartitionedCall:model/transformer_layer_1/StatefulPartitionedCall:output:0model_transformer_layer_2_11378model_transformer_layer_2_11380model_transformer_layer_2_11382model_transformer_layer_2_11384model_transformer_layer_2_11386model_transformer_layer_2_11388model_transformer_layer_2_11390model_transformer_layer_2_11392model_transformer_layer_2_11394model_transformer_layer_2_11396model_transformer_layer_2_11398model_transformer_layer_2_11400*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11377f
model/flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   Б
model/flatten_1/ReshapeReshape:model/transformer_layer_2/StatefulPartitionedCall:output:0model/flatten_1/Const:output:0*
T0*(
_output_shapes
:џџџџџџџџџ
#model/dense_5/MatMul/ReadVariableOpReadVariableOp,model_dense_5_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0 
model/dense_5/MatMulMatMul model/flatten_1/Reshape:output:0+model/dense_5/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџ
$model/dense_5/BiasAdd/ReadVariableOpReadVariableOp-model_dense_5_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0Ё
model/dense_5/BiasAddBiasAddmodel/dense_5/MatMul:product:0,model/dense_5/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџ]
model/dense_5/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?
model/dense_5/Gelu/mulMul!model/dense_5/Gelu/mul/x:output:0model/dense_5/BiasAdd:output:0*
T0*(
_output_shapes
:џџџџџџџџџ^
model/dense_5/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?
model/dense_5/Gelu/truedivRealDivmodel/dense_5/BiasAdd:output:0"model/dense_5/Gelu/Cast/x:output:0*
T0*(
_output_shapes
:џџџџџџџџџp
model/dense_5/Gelu/ErfErfmodel/dense_5/Gelu/truediv:z:0*
T0*(
_output_shapes
:џџџџџџџџџ]
model/dense_5/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
model/dense_5/Gelu/addAddV2!model/dense_5/Gelu/add/x:output:0model/dense_5/Gelu/Erf:y:0*
T0*(
_output_shapes
:џџџџџџџџџ
model/dense_5/Gelu/mul_1Mulmodel/dense_5/Gelu/mul:z:0model/dense_5/Gelu/add:z:0*
T0*(
_output_shapes
:џџџџџџџџџ
#model/dense_6/MatMul/ReadVariableOpReadVariableOp,model_dense_6_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
model/dense_6/MatMulMatMulmodel/dense_5/Gelu/mul_1:z:0+model/dense_6/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ
$model/dense_6/BiasAdd/ReadVariableOpReadVariableOp-model_dense_6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0 
model/dense_6/BiasAddBiasAddmodel/dense_6/MatMul:product:0,model/dense_6/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџr
model/dense_6/SoftmaxSoftmaxmodel/dense_6/BiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџn
IdentityIdentitymodel/dense_6/Softmax:softmax:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ
NoOpNoOp%^model/dense_5/BiasAdd/ReadVariableOp$^model/dense_5/MatMul/ReadVariableOp%^model/dense_6/BiasAdd/ReadVariableOp$^model/dense_6/MatMul/ReadVariableOp(^model/encoder3d/StatefulPartitionedCall7^model/frame_position_embedding/StatefulPartitionedCall6^model/time_distributed_1/dense/BiasAdd/ReadVariableOp5^model/time_distributed_1/dense/MatMul/ReadVariableOp2^model/transformer_layer_1/StatefulPartitionedCall2^model/transformer_layer_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes{
y:џџџџџџџџџ  : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2L
$model/dense_5/BiasAdd/ReadVariableOp$model/dense_5/BiasAdd/ReadVariableOp2J
#model/dense_5/MatMul/ReadVariableOp#model/dense_5/MatMul/ReadVariableOp2L
$model/dense_6/BiasAdd/ReadVariableOp$model/dense_6/BiasAdd/ReadVariableOp2J
#model/dense_6/MatMul/ReadVariableOp#model/dense_6/MatMul/ReadVariableOp2R
'model/encoder3d/StatefulPartitionedCall'model/encoder3d/StatefulPartitionedCall2p
6model/frame_position_embedding/StatefulPartitionedCall6model/frame_position_embedding/StatefulPartitionedCall2n
5model/time_distributed_1/dense/BiasAdd/ReadVariableOp5model/time_distributed_1/dense/BiasAdd/ReadVariableOp2l
4model/time_distributed_1/dense/MatMul/ReadVariableOp4model/time_distributed_1/dense/MatMul/ReadVariableOp2f
1model/transformer_layer_1/StatefulPartitionedCall1model/transformer_layer_1/StatefulPartitionedCall2f
1model/transformer_layer_2/StatefulPartitionedCall1model/transformer_layer_2/StatefulPartitionedCall:\ X
3
_output_shapes!
:џџџџџџџџџ  
!
_user_specified_name	input_1
Ђ

є
B__inference_dense_6_layer_call_and_return_conditional_losses_13719

inputs1
matmul_readvariableop_resource:	-
biasadd_readvariableop_resource:
identityЂBiasAdd/ReadVariableOpЂMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџV
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:џџџџџџџџџ`
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs
О
`
D__inference_flatten_1_layer_call_and_return_conditional_losses_13672

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:џџџџџџџџџY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:џџџџџџџџџ@:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
У
з
*__inference_sequential_layer_call_fn_13433
dense_1_input
unknown:	@
	unknown_0:	
	unknown_1:	@
	unknown_2:@
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCalldense_1_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_13409s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:џџџџџџџџџ@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Z V
+
_output_shapes
:џџџџџџџџџ@
'
_user_specified_namedense_1_input
Б

C__inference_conv3d_5_layer_call_and_return_conditional_losses_15035

inputs>
conv3d_readvariableop_resource:.
biasadd_readvariableop_resource:	
identityЂBiasAdd/ReadVariableOpЂConv3D/ReadVariableOp
Conv3D/ReadVariableOpReadVariableOpconv3d_readvariableop_resource*,
_output_shapes
:*
dtype0
Conv3DConv3DinputsConv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	
s
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
BiasAddBiasAddConv3D:output:0BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ]
ReluReluBiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџn
IdentityIdentityRelu:activations:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџw
NoOpNoOp^BiasAdd/ReadVariableOp^Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$:џџџџџџџџџ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv3D/ReadVariableOpConv3D/ReadVariableOp:\ X
4
_output_shapes"
 :џџџџџџџџџ
 
_user_specified_nameinputs
ѓ
ъ
G__inference_sequential_1_layer_call_and_return_conditional_losses_14663

inputsE
'conv3d_2_conv3d_readvariableop_resource: @6
(conv3d_2_biasadd_readvariableop_resource:@E
'conv3d_3_conv3d_readvariableop_resource:@@6
(conv3d_3_biasadd_readvariableop_resource:@
identityЂconv3d_2/BiasAdd/ReadVariableOpЂconv3d_2/Conv3D/ReadVariableOpЂconv3d_3/BiasAdd/ReadVariableOpЂconv3d_3/Conv3D/ReadVariableOp
conv3d_2/Conv3D/ReadVariableOpReadVariableOp'conv3d_2_conv3d_readvariableop_resource**
_output_shapes
: @*
dtype0А
conv3d_2/Conv3DConv3Dinputs&conv3d_2/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	

conv3d_2/BiasAdd/ReadVariableOpReadVariableOp(conv3d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
conv3d_2/BiasAddBiasAddconv3d_2/Conv3D:output:0'conv3d_2/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@n
conv3d_2/ReluReluconv3d_2/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@
conv3d_3/Conv3D/ReadVariableOpReadVariableOp'conv3d_3_conv3d_readvariableop_resource**
_output_shapes
:@@*
dtype0Х
conv3d_3/Conv3DConv3Dconv3d_2/Relu:activations:0&conv3d_3/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	

conv3d_3/BiasAdd/ReadVariableOpReadVariableOp(conv3d_3_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0
conv3d_3/BiasAddBiasAddconv3d_3/Conv3D:output:0'conv3d_3/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@n
conv3d_3/ReluReluconv3d_3/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@v
IdentityIdentityconv3d_3/Relu:activations:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@Ь
NoOpNoOp ^conv3d_2/BiasAdd/ReadVariableOp^conv3d_2/Conv3D/ReadVariableOp ^conv3d_3/BiasAdd/ReadVariableOp^conv3d_3/Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ : : : : 2B
conv3d_2/BiasAdd/ReadVariableOpconv3d_2/BiasAdd/ReadVariableOp2@
conv3d_2/Conv3D/ReadVariableOpconv3d_2/Conv3D/ReadVariableOp2B
conv3d_3/BiasAdd/ReadVariableOpconv3d_3/BiasAdd/ReadVariableOp2@
conv3d_3/Conv3D/ReadVariableOpconv3d_3/Conv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ 
 
_user_specified_nameinputs
џ
Ё
(__inference_conv3d_2_layer_call_fn_14964

inputs%
unknown: @
	unknown_0:@
identityЂStatefulPartitionedCallч
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_2_layer_call_and_return_conditional_losses_13891{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ 
 
_user_specified_nameinputs

б
G__inference_sequential_2_layer_call_and_return_conditional_losses_14181
conv3d_4_input-
conv3d_4_14170:@
conv3d_4_14172:	.
conv3d_5_14175:
conv3d_5_14177:	
identityЂ conv3d_4/StatefulPartitionedCallЂ conv3d_5/StatefulPartitionedCall
 conv3d_4/StatefulPartitionedCallStatefulPartitionedCallconv3d_4_inputconv3d_4_14170conv3d_4_14172*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_4_layer_call_and_return_conditional_losses_14045 
 conv3d_5/StatefulPartitionedCallStatefulPartitionedCall)conv3d_4/StatefulPartitionedCall:output:0conv3d_5_14175conv3d_5_14177*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_5_layer_call_and_return_conditional_losses_14062
IdentityIdentity)conv3d_5/StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ
NoOpNoOp!^conv3d_4/StatefulPartitionedCall!^conv3d_5/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ@: : : : 2D
 conv3d_4/StatefulPartitionedCall conv3d_4/StatefulPartitionedCall2D
 conv3d_5/StatefulPartitionedCall conv3d_5/StatefulPartitionedCall:c _
3
_output_shapes!
:џџџџџџџџџ@
(
_user_specified_nameconv3d_4_input
э
K
/__inference_max_pooling3d_2_layer_call_fn_14206

inputs
identityш
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *S
fNRL
J__inference_max_pooling3d_2_layer_call_and_return_conditional_losses_13138
IdentityIdentityPartitionedCall:output:0*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ: {
W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
К
З
M__inference_transformer_layer_2_layer_call_and_return_conditional_losses_1525

inputsX
Bmulti_head_attention_1_query_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_query_add_readvariableop_resource:@V
@multi_head_attention_1_key_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_1_key_add_readvariableop_resource:@X
Bmulti_head_attention_1_value_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_value_add_readvariableop_resource:@c
Mmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource:@@Q
Cmulti_head_attention_1_attention_output_add_readvariableop_resource:@I
6sequential_1_dense_3_tensordot_readvariableop_resource:	@C
4sequential_1_dense_3_biasadd_readvariableop_resource:	I
6sequential_1_dense_4_tensordot_readvariableop_resource:	@B
4sequential_1_dense_4_biasadd_readvariableop_resource:@
identityЂ:multi_head_attention_1/attention_output/add/ReadVariableOpЂDmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpЂ-multi_head_attention_1/key/add/ReadVariableOpЂ7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpЂ/multi_head_attention_1/query/add/ReadVariableOpЂ9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpЂ/multi_head_attention_1/value/add/ReadVariableOpЂ9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpЂ+sequential_1/dense_3/BiasAdd/ReadVariableOpЂ-sequential_1/dense_3/Tensordot/ReadVariableOpЂ+sequential_1/dense_4/BiasAdd/ReadVariableOpЂ-sequential_1/dense_4/Tensordot/ReadVariableOpР
9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0п
*multi_head_attention_1/query/einsum/EinsumEinsuminputsAmulti_head_attention_1/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЈ
/multi_head_attention_1/query/add/ReadVariableOpReadVariableOp8multi_head_attention_1_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0б
 multi_head_attention_1/query/addAddV23multi_head_attention_1/query/einsum/Einsum:output:07multi_head_attention_1/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@М
7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_1_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0л
(multi_head_attention_1/key/einsum/EinsumEinsuminputs?multi_head_attention_1/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЄ
-multi_head_attention_1/key/add/ReadVariableOpReadVariableOp6multi_head_attention_1_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ы
multi_head_attention_1/key/addAddV21multi_head_attention_1/key/einsum/Einsum:output:05multi_head_attention_1/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@Р
9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0п
*multi_head_attention_1/value/einsum/EinsumEinsuminputsAmulti_head_attention_1/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЈ
/multi_head_attention_1/value/add/ReadVariableOpReadVariableOp8multi_head_attention_1_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0б
 multi_head_attention_1/value/addAddV23multi_head_attention_1/value/einsum/Einsum:output:07multi_head_attention_1/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@a
multi_head_attention_1/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >Ј
multi_head_attention_1/MulMul$multi_head_attention_1/query/add:z:0%multi_head_attention_1/Mul/y:output:0*
T0*/
_output_shapes
:џџџџџџџџџ@д
$multi_head_attention_1/einsum/EinsumEinsum"multi_head_attention_1/key/add:z:0multi_head_attention_1/Mul:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ*
equationaecd,abcd->acbe
&multi_head_attention_1/softmax/SoftmaxSoftmax-multi_head_attention_1/einsum/Einsum:output:0*
T0*/
_output_shapes
:џџџџџџџџџ
'multi_head_attention_1/dropout/IdentityIdentity0multi_head_attention_1/softmax/Softmax:softmax:0*
T0*/
_output_shapes
:џџџџџџџџџъ
&multi_head_attention_1/einsum_1/EinsumEinsum0multi_head_attention_1/dropout/Identity:output:0$multi_head_attention_1/value/add:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationacbe,aecd->abcdж
Dmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpMmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0
5multi_head_attention_1/attention_output/einsum/EinsumEinsum/multi_head_attention_1/einsum_1/Einsum:output:0Lmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:џџџџџџџџџ@*
equationabcd,cde->abeК
:multi_head_attention_1/attention_output/add/ReadVariableOpReadVariableOpCmulti_head_attention_1_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0ю
+multi_head_attention_1/attention_output/addAddV2>multi_head_attention_1/attention_output/einsum/Einsum:output:0Bmulti_head_attention_1/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@{
addAddV2inputs/multi_head_attention_1/attention_output/add:z:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ѕ
-sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0m
#sequential_1/dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:t
#sequential_1/dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       [
$sequential_1/dense_3/Tensordot/ShapeShapeadd:z:0*
T0*
_output_shapes
:n
,sequential_1/dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential_1/dense_3/Tensordot/GatherV2GatherV2-sequential_1/dense_3/Tensordot/Shape:output:0,sequential_1/dense_3/Tensordot/free:output:05sequential_1/dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
.sequential_1/dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
)sequential_1/dense_3/Tensordot/GatherV2_1GatherV2-sequential_1/dense_3/Tensordot/Shape:output:0,sequential_1/dense_3/Tensordot/axes:output:07sequential_1/dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
$sequential_1/dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ­
#sequential_1/dense_3/Tensordot/ProdProd0sequential_1/dense_3/Tensordot/GatherV2:output:0-sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: Г
%sequential_1/dense_3/Tensordot/Prod_1Prod2sequential_1/dense_3/Tensordot/GatherV2_1:output:0/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : №
%sequential_1/dense_3/Tensordot/concatConcatV2,sequential_1/dense_3/Tensordot/free:output:0,sequential_1/dense_3/Tensordot/axes:output:03sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:И
$sequential_1/dense_3/Tensordot/stackPack,sequential_1/dense_3/Tensordot/Prod:output:0.sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Є
(sequential_1/dense_3/Tensordot/transpose	Transposeadd:z:0.sequential_1/dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Щ
&sequential_1/dense_3/Tensordot/ReshapeReshape,sequential_1/dense_3/Tensordot/transpose:y:0-sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЪ
%sequential_1/dense_3/Tensordot/MatMulMatMul/sequential_1/dense_3/Tensordot/Reshape:output:05sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџq
&sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:n
,sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ћ
'sequential_1/dense_3/Tensordot/concat_1ConcatV20sequential_1/dense_3/Tensordot/GatherV2:output:0/sequential_1/dense_3/Tensordot/Const_2:output:05sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:У
sequential_1/dense_3/TensordotReshape/sequential_1/dense_3/Tensordot/MatMul:product:00sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
+sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0М
sequential_1/dense_3/BiasAddBiasAdd'sequential_1/dense_3/Tensordot:output:03sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџd
sequential_1/dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Ќ
sequential_1/dense_3/Gelu/mulMul(sequential_1/dense_3/Gelu/mul/x:output:0%sequential_1/dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџe
 sequential_1/dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?Е
!sequential_1/dense_3/Gelu/truedivRealDiv%sequential_1/dense_3/BiasAdd:output:0)sequential_1/dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
sequential_1/dense_3/Gelu/ErfErf%sequential_1/dense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџd
sequential_1/dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Њ
sequential_1/dense_3/Gelu/addAddV2(sequential_1/dense_3/Gelu/add/x:output:0!sequential_1/dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџЃ
sequential_1/dense_3/Gelu/mul_1Mul!sequential_1/dense_3/Gelu/mul:z:0!sequential_1/dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџЅ
-sequential_1/dense_4/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_4_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0m
#sequential_1/dense_4/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:t
#sequential_1/dense_4/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       w
$sequential_1/dense_4/Tensordot/ShapeShape#sequential_1/dense_3/Gelu/mul_1:z:0*
T0*
_output_shapes
:n
,sequential_1/dense_4/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential_1/dense_4/Tensordot/GatherV2GatherV2-sequential_1/dense_4/Tensordot/Shape:output:0,sequential_1/dense_4/Tensordot/free:output:05sequential_1/dense_4/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:p
.sequential_1/dense_4/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
)sequential_1/dense_4/Tensordot/GatherV2_1GatherV2-sequential_1/dense_4/Tensordot/Shape:output:0,sequential_1/dense_4/Tensordot/axes:output:07sequential_1/dense_4/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
$sequential_1/dense_4/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ­
#sequential_1/dense_4/Tensordot/ProdProd0sequential_1/dense_4/Tensordot/GatherV2:output:0-sequential_1/dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: Г
%sequential_1/dense_4/Tensordot/Prod_1Prod2sequential_1/dense_4/Tensordot/GatherV2_1:output:0/sequential_1/dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : №
%sequential_1/dense_4/Tensordot/concatConcatV2,sequential_1/dense_4/Tensordot/free:output:0,sequential_1/dense_4/Tensordot/axes:output:03sequential_1/dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:И
$sequential_1/dense_4/Tensordot/stackPack,sequential_1/dense_4/Tensordot/Prod:output:0.sequential_1/dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:С
(sequential_1/dense_4/Tensordot/transpose	Transpose#sequential_1/dense_3/Gelu/mul_1:z:0.sequential_1/dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџЩ
&sequential_1/dense_4/Tensordot/ReshapeReshape,sequential_1/dense_4/Tensordot/transpose:y:0-sequential_1/dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџЩ
%sequential_1/dense_4/Tensordot/MatMulMatMul/sequential_1/dense_4/Tensordot/Reshape:output:05sequential_1/dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@p
&sequential_1/dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@n
,sequential_1/dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ћ
'sequential_1/dense_4/Tensordot/concat_1ConcatV20sequential_1/dense_4/Tensordot/GatherV2:output:0/sequential_1/dense_4/Tensordot/Const_2:output:05sequential_1/dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Т
sequential_1/dense_4/TensordotReshape/sequential_1/dense_4/Tensordot/MatMul:product:00sequential_1/dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
+sequential_1/dense_4/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Л
sequential_1/dense_4/BiasAddBiasAdd'sequential_1/dense_4/Tensordot:output:03sequential_1/dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@t
add_1AddV2add:z:0%sequential_1/dense_4/BiasAdd:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ь
NoOpNoOp;^multi_head_attention_1/attention_output/add/ReadVariableOpE^multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp.^multi_head_attention_1/key/add/ReadVariableOp8^multi_head_attention_1/key/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/query/add/ReadVariableOp:^multi_head_attention_1/query/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/value/add/ReadVariableOp:^multi_head_attention_1/value/einsum/Einsum/ReadVariableOp,^sequential_1/dense_3/BiasAdd/ReadVariableOp.^sequential_1/dense_3/Tensordot/ReadVariableOp,^sequential_1/dense_4/BiasAdd/ReadVariableOp.^sequential_1/dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 \
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 2x
:multi_head_attention_1/attention_output/add/ReadVariableOp:multi_head_attention_1/attention_output/add/ReadVariableOp2
Dmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpDmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp2^
-multi_head_attention_1/key/add/ReadVariableOp-multi_head_attention_1/key/add/ReadVariableOp2r
7multi_head_attention_1/key/einsum/Einsum/ReadVariableOp7multi_head_attention_1/key/einsum/Einsum/ReadVariableOp2b
/multi_head_attention_1/query/add/ReadVariableOp/multi_head_attention_1/query/add/ReadVariableOp2v
9multi_head_attention_1/query/einsum/Einsum/ReadVariableOp9multi_head_attention_1/query/einsum/Einsum/ReadVariableOp2b
/multi_head_attention_1/value/add/ReadVariableOp/multi_head_attention_1/value/add/ReadVariableOp2v
9multi_head_attention_1/value/einsum/Einsum/ReadVariableOp9multi_head_attention_1/value/einsum/Einsum/ReadVariableOp2Z
+sequential_1/dense_3/BiasAdd/ReadVariableOp+sequential_1/dense_3/BiasAdd/ReadVariableOp2^
-sequential_1/dense_3/Tensordot/ReadVariableOp-sequential_1/dense_3/Tensordot/ReadVariableOp2Z
+sequential_1/dense_4/BiasAdd/ReadVariableOp+sequential_1/dense_4/BiasAdd/ReadVariableOp2^
-sequential_1/dense_4/Tensordot/ReadVariableOp-sequential_1/dense_4/Tensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
щ
I
-__inference_max_pooling3d_layer_call_fn_14186

inputs
identityц
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *Q
fLRJ
H__inference_max_pooling3d_layer_call_and_return_conditional_losses_13114
IdentityIdentityPartitionedCall:output:0*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ: {
W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs

Ч
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_11527

inputs
dense_11517:	@
dense_11519:@
identityЂdense/StatefulPartitionedCall;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:б
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask^
Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   e
ReshapeReshapeinputsReshape/shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџю
dense/StatefulPartitionedCallStatefulPartitionedCallReshape:output:0dense_11517dense_11519*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_11516\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
џџџџџџџџџS
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value	B :@
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:
	Reshape_1Reshape&dense/StatefulPartitionedCall:output:0Reshape_1/shape:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ@n
IdentityIdentityReshape_1:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ@f
NoOpNoOp^dense/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:џџџџџџџџџџџџџџџџџџ: : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall:] Y
5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
у
х
*__inference_sequential_layer_call_fn_14570

inputs%
unknown: 
	unknown_0: '
	unknown_1:  
	unknown_2: 
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ   *&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_13761{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ  : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
н

M__inference_transformer_layer_1_layer_call_and_return_conditional_losses_2344

inputsV
@multi_head_attention_query_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_query_add_readvariableop_resource:@T
>multi_head_attention_key_einsum_einsum_readvariableop_resource:@@F
4multi_head_attention_key_add_readvariableop_resource:@V
@multi_head_attention_value_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_value_add_readvariableop_resource:@a
Kmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource:@@O
Amulti_head_attention_attention_output_add_readvariableop_resource:@G
4sequential_dense_1_tensordot_readvariableop_resource:	@A
2sequential_dense_1_biasadd_readvariableop_resource:	G
4sequential_dense_2_tensordot_readvariableop_resource:	@@
2sequential_dense_2_biasadd_readvariableop_resource:@
identityЂ8multi_head_attention/attention_output/add/ReadVariableOpЂBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpЂ+multi_head_attention/key/add/ReadVariableOpЂ5multi_head_attention/key/einsum/Einsum/ReadVariableOpЂ-multi_head_attention/query/add/ReadVariableOpЂ7multi_head_attention/query/einsum/Einsum/ReadVariableOpЂ-multi_head_attention/value/add/ReadVariableOpЂ7multi_head_attention/value/einsum/Einsum/ReadVariableOpЂ)sequential/dense_1/BiasAdd/ReadVariableOpЂ+sequential/dense_1/Tensordot/ReadVariableOpЂ)sequential/dense_2/BiasAdd/ReadVariableOpЂ+sequential/dense_2/Tensordot/ReadVariableOpМ
7multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0л
(multi_head_attention/query/einsum/EinsumEinsuminputs?multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЄ
-multi_head_attention/query/add/ReadVariableOpReadVariableOp6multi_head_attention_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ы
multi_head_attention/query/addAddV21multi_head_attention/query/einsum/Einsum:output:05multi_head_attention/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@И
5multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOp>multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0з
&multi_head_attention/key/einsum/EinsumEinsuminputs=multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abde 
+multi_head_attention/key/add/ReadVariableOpReadVariableOp4multi_head_attention_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Х
multi_head_attention/key/addAddV2/multi_head_attention/key/einsum/Einsum:output:03multi_head_attention/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@М
7multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0л
(multi_head_attention/value/einsum/EinsumEinsuminputs?multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationabc,cde->abdeЄ
-multi_head_attention/value/add/ReadVariableOpReadVariableOp6multi_head_attention_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ы
multi_head_attention/value/addAddV21multi_head_attention/value/einsum/Einsum:output:05multi_head_attention/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:џџџџџџџџџ@_
multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >Ђ
multi_head_attention/MulMul"multi_head_attention/query/add:z:0#multi_head_attention/Mul/y:output:0*
T0*/
_output_shapes
:џџџџџџџџџ@Ю
"multi_head_attention/einsum/EinsumEinsum multi_head_attention/key/add:z:0multi_head_attention/Mul:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ*
equationaecd,abcd->acbe
$multi_head_attention/softmax/SoftmaxSoftmax+multi_head_attention/einsum/Einsum:output:0*
T0*/
_output_shapes
:џџџџџџџџџ
%multi_head_attention/dropout/IdentityIdentity.multi_head_attention/softmax/Softmax:softmax:0*
T0*/
_output_shapes
:џџџџџџџџџф
$multi_head_attention/einsum_1/EinsumEinsum.multi_head_attention/dropout/Identity:output:0"multi_head_attention/value/add:z:0*
N*
T0*/
_output_shapes
:џџџџџџџџџ@*
equationacbe,aecd->abcdв
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpKmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0
3multi_head_attention/attention_output/einsum/EinsumEinsum-multi_head_attention/einsum_1/Einsum:output:0Jmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:џџџџџџџџџ@*
equationabcd,cde->abeЖ
8multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpAmulti_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0ш
)multi_head_attention/attention_output/addAddV2<multi_head_attention/attention_output/einsum/Einsum:output:0@multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@y
addAddV2inputs-multi_head_attention/attention_output/add:z:0*
T0*+
_output_shapes
:џџџџџџџџџ@Ё
+sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0k
!sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:r
!sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Y
"sequential/dense_1/Tensordot/ShapeShapeadd:z:0*
T0*
_output_shapes
:l
*sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
%sequential/dense_1/Tensordot/GatherV2GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/free:output:03sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
,sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential/dense_1/Tensordot/GatherV2_1GatherV2+sequential/dense_1/Tensordot/Shape:output:0*sequential/dense_1/Tensordot/axes:output:05sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
"sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: Ї
!sequential/dense_1/Tensordot/ProdProd.sequential/dense_1/Tensordot/GatherV2:output:0+sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ­
#sequential/dense_1/Tensordot/Prod_1Prod0sequential/dense_1/Tensordot/GatherV2_1:output:0-sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ш
#sequential/dense_1/Tensordot/concatConcatV2*sequential/dense_1/Tensordot/free:output:0*sequential/dense_1/Tensordot/axes:output:01sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:В
"sequential/dense_1/Tensordot/stackPack*sequential/dense_1/Tensordot/Prod:output:0,sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
: 
&sequential/dense_1/Tensordot/transpose	Transposeadd:z:0,sequential/dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@У
$sequential/dense_1/Tensordot/ReshapeReshape*sequential/dense_1/Tensordot/transpose:y:0+sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџФ
#sequential/dense_1/Tensordot/MatMulMatMul-sequential/dense_1/Tensordot/Reshape:output:03sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџo
$sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:l
*sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ѓ
%sequential/dense_1/Tensordot/concat_1ConcatV2.sequential/dense_1/Tensordot/GatherV2:output:0-sequential/dense_1/Tensordot/Const_2:output:03sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Н
sequential/dense_1/TensordotReshape-sequential/dense_1/Tensordot/MatMul:product:0.sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџ
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0Ж
sequential/dense_1/BiasAddBiasAdd%sequential/dense_1/Tensordot:output:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџb
sequential/dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?І
sequential/dense_1/Gelu/mulMul&sequential/dense_1/Gelu/mul/x:output:0#sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџc
sequential/dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?Џ
sequential/dense_1/Gelu/truedivRealDiv#sequential/dense_1/BiasAdd:output:0'sequential/dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџ~
sequential/dense_1/Gelu/ErfErf#sequential/dense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџb
sequential/dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?Є
sequential/dense_1/Gelu/addAddV2&sequential/dense_1/Gelu/add/x:output:0sequential/dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџ
sequential/dense_1/Gelu/mul_1Mulsequential/dense_1/Gelu/mul:z:0sequential/dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџЁ
+sequential/dense_2/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_2_tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0k
!sequential/dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:r
!sequential/dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       s
"sequential/dense_2/Tensordot/ShapeShape!sequential/dense_1/Gelu/mul_1:z:0*
T0*
_output_shapes
:l
*sequential/dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : 
%sequential/dense_2/Tensordot/GatherV2GatherV2+sequential/dense_2/Tensordot/Shape:output:0*sequential/dense_2/Tensordot/free:output:03sequential/dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:n
,sequential/dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : 
'sequential/dense_2/Tensordot/GatherV2_1GatherV2+sequential/dense_2/Tensordot/Shape:output:0*sequential/dense_2/Tensordot/axes:output:05sequential/dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:l
"sequential/dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: Ї
!sequential/dense_2/Tensordot/ProdProd.sequential/dense_2/Tensordot/GatherV2:output:0+sequential/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ­
#sequential/dense_2/Tensordot/Prod_1Prod0sequential/dense_2/Tensordot/GatherV2_1:output:0-sequential/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ш
#sequential/dense_2/Tensordot/concatConcatV2*sequential/dense_2/Tensordot/free:output:0*sequential/dense_2/Tensordot/axes:output:01sequential/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:В
"sequential/dense_2/Tensordot/stackPack*sequential/dense_2/Tensordot/Prod:output:0,sequential/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Л
&sequential/dense_2/Tensordot/transpose	Transpose!sequential/dense_1/Gelu/mul_1:z:0,sequential/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:џџџџџџџџџУ
$sequential/dense_2/Tensordot/ReshapeReshape*sequential/dense_2/Tensordot/transpose:y:0+sequential/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџУ
#sequential/dense_2/Tensordot/MatMulMatMul-sequential/dense_2/Tensordot/Reshape:output:03sequential/dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:џџџџџџџџџ@n
$sequential/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@l
*sequential/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ѓ
%sequential/dense_2/Tensordot/concat_1ConcatV2.sequential/dense_2/Tensordot/GatherV2:output:0-sequential/dense_2/Tensordot/Const_2:output:03sequential/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:М
sequential/dense_2/TensordotReshape-sequential/dense_2/Tensordot/MatMul:product:0.sequential/dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
)sequential/dense_2/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Е
sequential/dense_2/BiasAddBiasAdd%sequential/dense_2/Tensordot:output:01sequential/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:џџџџџџџџџ@r
add_1AddV2add:z:0#sequential/dense_2/BiasAdd:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@Д
NoOpNoOp9^multi_head_attention/attention_output/add/ReadVariableOpC^multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp,^multi_head_attention/key/add/ReadVariableOp6^multi_head_attention/key/einsum/Einsum/ReadVariableOp.^multi_head_attention/query/add/ReadVariableOp8^multi_head_attention/query/einsum/Einsum/ReadVariableOp.^multi_head_attention/value/add/ReadVariableOp8^multi_head_attention/value/einsum/Einsum/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp,^sequential/dense_1/Tensordot/ReadVariableOp*^sequential/dense_2/BiasAdd/ReadVariableOp,^sequential/dense_2/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 \
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 2t
8multi_head_attention/attention_output/add/ReadVariableOp8multi_head_attention/attention_output/add/ReadVariableOp2
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp2Z
+multi_head_attention/key/add/ReadVariableOp+multi_head_attention/key/add/ReadVariableOp2n
5multi_head_attention/key/einsum/Einsum/ReadVariableOp5multi_head_attention/key/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/query/add/ReadVariableOp-multi_head_attention/query/add/ReadVariableOp2r
7multi_head_attention/query/einsum/Einsum/ReadVariableOp7multi_head_attention/query/einsum/Einsum/ReadVariableOp2^
-multi_head_attention/value/add/ReadVariableOp-multi_head_attention/value/add/ReadVariableOp2r
7multi_head_attention/value/einsum/Einsum/ReadVariableOp7multi_head_attention/value/einsum/Einsum/ReadVariableOp2V
)sequential/dense_1/BiasAdd/ReadVariableOp)sequential/dense_1/BiasAdd/ReadVariableOp2Z
+sequential/dense_1/Tensordot/ReadVariableOp+sequential/dense_1/Tensordot/ReadVariableOp2V
)sequential/dense_2/BiasAdd/ReadVariableOp)sequential/dense_2/BiasAdd/ReadVariableOp2Z
+sequential/dense_2/Tensordot/ReadVariableOp+sequential/dense_2/Tensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
Ї
к
#__inference_signature_wrapper_12641
input_1%
unknown:
	unknown_0:'
	unknown_1: 
	unknown_2: '
	unknown_3:  
	unknown_4: '
	unknown_5: @
	unknown_6:@'
	unknown_7:@@
	unknown_8:@(
	unknown_9:@

unknown_10:	*

unknown_11:

unknown_12:	

unknown_13:	@

unknown_14:@

unknown_15:@ 

unknown_16:@@

unknown_17:@ 

unknown_18:@@

unknown_19:@ 

unknown_20:@@

unknown_21:@ 

unknown_22:@@

unknown_23:@

unknown_24:	@

unknown_25:	

unknown_26:	@

unknown_27:@ 

unknown_28:@@

unknown_29:@ 

unknown_30:@@

unknown_31:@ 

unknown_32:@@

unknown_33:@ 

unknown_34:@@

unknown_35:@

unknown_36:	@

unknown_37:	

unknown_38:	@

unknown_39:@

unknown_40:


unknown_41:	

unknown_42:	

unknown_43:
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43*9
Tin2
02.*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*O
_read_only_resource_inputs1
/-	
 !"#$%&'()*+,-*0
config_proto 

CPU

GPU2*0J 8 *)
f$R"
 __inference__wrapped_model_11427o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes{
y:џџџџџџџџџ  : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
3
_output_shapes!
:џџџџџџџџџ  
!
_user_specified_name	input_1
Ѓ
ў
A__inference_conv3d_layer_call_and_return_conditional_losses_14935

inputs<
conv3d_readvariableop_resource: -
biasadd_readvariableop_resource: 
identityЂBiasAdd/ReadVariableOpЂConv3D/ReadVariableOp
Conv3D/ReadVariableOpReadVariableOpconv3d_readvariableop_resource**
_output_shapes
: *
dtype0
Conv3DConv3DinputsConv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0
BiasAddBiasAddConv3D:output:0BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   \
ReluReluBiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   m
IdentityIdentityRelu:activations:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ   w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ  : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv3D/ReadVariableOpConv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
џ
Ё
(__inference_conv3d_3_layer_call_fn_14984

inputs%
unknown:@@
	unknown_0:@
identityЂStatefulPartitionedCallч
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_3_layer_call_and_return_conditional_losses_13908{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:џџџџџџџџџ@: : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ@
 
_user_specified_nameinputs
џ
я
,__inference_sequential_1_layer_call_fn_13926
conv3d_2_input%
unknown: @
	unknown_0:@'
	unknown_1:@@
	unknown_2:@
identityЂStatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallconv3d_2_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *P
fKRI
G__inference_sequential_1_layer_call_and_return_conditional_losses_13915{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:c _
3
_output_shapes!
:џџџџџџџџџ 
(
_user_specified_nameconv3d_2_input

 
2__inference_time_distributed_1_layer_call_fn_13194

inputs
unknown:	@
	unknown_0:@
identityЂStatefulPartitionedCallђ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *V
fQRO
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_11527|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџџџџџџџџџџ@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:џџџџџџџџџџџџџџџџџџ: : 22
StatefulPartitionedCallStatefulPartitionedCall:] Y
5
_output_shapes#
!:џџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs

Ь
G__inference_sequential_1_layer_call_and_return_conditional_losses_14013
conv3d_2_input,
conv3d_2_14002: @
conv3d_2_14004:@,
conv3d_3_14007:@@
conv3d_3_14009:@
identityЂ conv3d_2/StatefulPartitionedCallЂ conv3d_3/StatefulPartitionedCall
 conv3d_2/StatefulPartitionedCallStatefulPartitionedCallconv3d_2_inputconv3d_2_14002conv3d_2_14004*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_2_layer_call_and_return_conditional_losses_13891
 conv3d_3/StatefulPartitionedCallStatefulPartitionedCall)conv3d_2/StatefulPartitionedCall:output:0conv3d_3_14007conv3d_3_14009*
Tin
2*
Tout
2*
_collective_manager_ids
 *3
_output_shapes!
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_conv3d_3_layer_call_and_return_conditional_losses_13908
IdentityIdentity)conv3d_3/StatefulPartitionedCall:output:0^NoOp*
T0*3
_output_shapes!
:џџџџџџџџџ@
NoOpNoOp!^conv3d_2/StatefulPartitionedCall!^conv3d_3/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ : : : : 2D
 conv3d_2/StatefulPartitionedCall conv3d_2/StatefulPartitionedCall2D
 conv3d_3/StatefulPartitionedCall conv3d_3/StatefulPartitionedCall:c _
3
_output_shapes!
:џџџџџџџџџ 
(
_user_specified_nameconv3d_2_input
љo
є
B__inference_encoder3d_layer_call_and_return_conditional_losses_578

inputsW
9spatial_attention_conv3d_6_conv3d_readvariableop_resource:H
:spatial_attention_conv3d_6_biasadd_readvariableop_resource:[
=conv2_plus1d_sequential_conv3d_conv3d_readvariableop_resource: L
>conv2_plus1d_sequential_conv3d_biasadd_readvariableop_resource: ]
?conv2_plus1d_sequential_conv3d_1_conv3d_readvariableop_resource:  N
@conv2_plus1d_sequential_conv3d_1_biasadd_readvariableop_resource: a
Cconv2_plus1d_1_sequential_1_conv3d_2_conv3d_readvariableop_resource: @R
Dconv2_plus1d_1_sequential_1_conv3d_2_biasadd_readvariableop_resource:@a
Cconv2_plus1d_1_sequential_1_conv3d_3_conv3d_readvariableop_resource:@@R
Dconv2_plus1d_1_sequential_1_conv3d_3_biasadd_readvariableop_resource:@b
Cconv2_plus1d_2_sequential_2_conv3d_4_conv3d_readvariableop_resource:@S
Dconv2_plus1d_2_sequential_2_conv3d_4_biasadd_readvariableop_resource:	c
Cconv2_plus1d_2_sequential_2_conv3d_5_conv3d_readvariableop_resource:S
Dconv2_plus1d_2_sequential_2_conv3d_5_biasadd_readvariableop_resource:	
identityЂ5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOpЂ4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOpЂ7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOpЂ6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOpЂ;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOpЂ:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOpЂ;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOpЂ:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOpЂ;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOpЂ:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOpЂ;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOpЂ:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOpЂ1spatial_attention/conv3d_6/BiasAdd/ReadVariableOpЂ0spatial_attention/conv3d_6/Conv3D/ReadVariableOpЖ
0spatial_attention/conv3d_6/Conv3D/ReadVariableOpReadVariableOp9spatial_attention_conv3d_6_conv3d_readvariableop_resource**
_output_shapes
:*
dtype0д
!spatial_attention/conv3d_6/Conv3DConv3Dinputs8spatial_attention/conv3d_6/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ  *
paddingSAME*
strides	
Ј
1spatial_attention/conv3d_6/BiasAdd/ReadVariableOpReadVariableOp:spatial_attention_conv3d_6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0в
"spatial_attention/conv3d_6/BiasAddBiasAdd*spatial_attention/conv3d_6/Conv3D:output:09spatial_attention/conv3d_6/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ  j
%spatial_attention/conv3d_6/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Х
#spatial_attention/conv3d_6/Gelu/mulMul.spatial_attention/conv3d_6/Gelu/mul/x:output:0+spatial_attention/conv3d_6/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ  k
&spatial_attention/conv3d_6/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?Ю
'spatial_attention/conv3d_6/Gelu/truedivRealDiv+spatial_attention/conv3d_6/BiasAdd:output:0/spatial_attention/conv3d_6/Gelu/Cast/x:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ  
#spatial_attention/conv3d_6/Gelu/ErfErf+spatial_attention/conv3d_6/Gelu/truediv:z:0*
T0*3
_output_shapes!
:џџџџџџџџџ  j
%spatial_attention/conv3d_6/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?У
#spatial_attention/conv3d_6/Gelu/addAddV2.spatial_attention/conv3d_6/Gelu/add/x:output:0'spatial_attention/conv3d_6/Gelu/Erf:y:0*
T0*3
_output_shapes!
:џџџџџџџџџ  М
%spatial_attention/conv3d_6/Gelu/mul_1Mul'spatial_attention/conv3d_6/Gelu/mul:z:0'spatial_attention/conv3d_6/Gelu/add:z:0*
T0*3
_output_shapes!
:џџџџџџџџџ  
spatial_attention/multiply/mulMulinputs)spatial_attention/conv3d_6/Gelu/mul_1:z:0*
T0*3
_output_shapes!
:џџџџџџџџџ  О
4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOpReadVariableOp=conv2_plus1d_sequential_conv3d_conv3d_readvariableop_resource**
_output_shapes
: *
dtype0ј
%conv2_plus1d/sequential/conv3d/Conv3DConv3D"spatial_attention/multiply/mul:z:0<conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	
А
5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOpReadVariableOp>conv2_plus1d_sequential_conv3d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0о
&conv2_plus1d/sequential/conv3d/BiasAddBiasAdd.conv2_plus1d/sequential/conv3d/Conv3D:output:0=conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   
#conv2_plus1d/sequential/conv3d/ReluRelu/conv2_plus1d/sequential/conv3d/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   Т
6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOpReadVariableOp?conv2_plus1d_sequential_conv3d_1_conv3d_readvariableop_resource**
_output_shapes
:  *
dtype0
'conv2_plus1d/sequential/conv3d_1/Conv3DConv3D1conv2_plus1d/sequential/conv3d/Relu:activations:0>conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	
Д
7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOpReadVariableOp@conv2_plus1d_sequential_conv3d_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ф
(conv2_plus1d/sequential/conv3d_1/BiasAddBiasAdd0conv2_plus1d/sequential/conv3d_1/Conv3D:output:0?conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   
%conv2_plus1d/sequential/conv3d_1/ReluRelu1conv2_plus1d/sequential/conv3d_1/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   д
max_pooling3d/MaxPool3D	MaxPool3D3conv2_plus1d/sequential/conv3d_1/Relu:activations:0*
T0*3
_output_shapes!
:џџџџџџџџџ *
ksize	
*
paddingSAME*
strides	
Ъ
:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_1_sequential_1_conv3d_2_conv3d_readvariableop_resource**
_output_shapes
: @*
dtype0
+conv2_plus1d_1/sequential_1/conv3d_2/Conv3DConv3D max_pooling3d/MaxPool3D:output:0Bconv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	
М
;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_1_sequential_1_conv3d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0№
,conv2_plus1d_1/sequential_1/conv3d_2/BiasAddBiasAdd4conv2_plus1d_1/sequential_1/conv3d_2/Conv3D:output:0Cconv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@І
)conv2_plus1d_1/sequential_1/conv3d_2/ReluRelu5conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@Ъ
:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_1_sequential_1_conv3d_3_conv3d_readvariableop_resource**
_output_shapes
:@@*
dtype0
+conv2_plus1d_1/sequential_1/conv3d_3/Conv3DConv3D7conv2_plus1d_1/sequential_1/conv3d_2/Relu:activations:0Bconv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	
М
;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_1_sequential_1_conv3d_3_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0№
,conv2_plus1d_1/sequential_1/conv3d_3/BiasAddBiasAdd4conv2_plus1d_1/sequential_1/conv3d_3/Conv3D:output:0Cconv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@І
)conv2_plus1d_1/sequential_1/conv3d_3/ReluRelu5conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@к
max_pooling3d_1/MaxPool3D	MaxPool3D7conv2_plus1d_1/sequential_1/conv3d_3/Relu:activations:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
ksize	
*
paddingSAME*
strides	
Ы
:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_2_sequential_2_conv3d_4_conv3d_readvariableop_resource*+
_output_shapes
:@*
dtype0
+conv2_plus1d_2/sequential_2/conv3d_4/Conv3DConv3D"max_pooling3d_1/MaxPool3D:output:0Bconv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	
Н
;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_2_sequential_2_conv3d_4_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0ё
,conv2_plus1d_2/sequential_2/conv3d_4/BiasAddBiasAdd4conv2_plus1d_2/sequential_2/conv3d_4/Conv3D:output:0Cconv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџЇ
)conv2_plus1d_2/sequential_2/conv3d_4/ReluRelu5conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџЬ
:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_2_sequential_2_conv3d_5_conv3d_readvariableop_resource*,
_output_shapes
:*
dtype0
+conv2_plus1d_2/sequential_2/conv3d_5/Conv3DConv3D7conv2_plus1d_2/sequential_2/conv3d_4/Relu:activations:0Bconv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	
Н
;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_2_sequential_2_conv3d_5_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0ё
,conv2_plus1d_2/sequential_2/conv3d_5/BiasAddBiasAdd4conv2_plus1d_2/sequential_2/conv3d_5/Conv3D:output:0Cconv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџЇ
)conv2_plus1d_2/sequential_2/conv3d_5/ReluRelu5conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџл
max_pooling3d_2/MaxPool3D	MaxPool3D7conv2_plus1d_2/sequential_2/conv3d_5/Relu:activations:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
ksize	
*
paddingSAME*
strides	
ћ
NoOpNoOp6^conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp5^conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp8^conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp7^conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp<^conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp;^conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp<^conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp;^conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp<^conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp;^conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp<^conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp;^conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp2^spatial_attention/conv3d_6/BiasAdd/ReadVariableOp1^spatial_attention/conv3d_6/Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ~
IdentityIdentity"max_pooling3d_2/MaxPool3D:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:џџџџџџџџџ  : : : : : : : : : : : : : : 2n
5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp2l
4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp2r
7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp2p
6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp2z
;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp2x
:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp2z
;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp2x
:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp2z
;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp2x
:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp2z
;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp2x
:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp2f
1spatial_attention/conv3d_6/BiasAdd/ReadVariableOp1spatial_attention/conv3d_6/BiasAdd/ReadVariableOp2d
0spatial_attention/conv3d_6/Conv3D/ReadVariableOp0spatial_attention/conv3d_6/Conv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
јC
ј
@__inference_model_layer_call_and_return_conditional_losses_12431
input_1-
encoder3d_12327:
encoder3d_12329:-
encoder3d_12331: 
encoder3d_12333: -
encoder3d_12335:  
encoder3d_12337: -
encoder3d_12339: @
encoder3d_12341:@-
encoder3d_12343:@@
encoder3d_12345:@.
encoder3d_12347:@
encoder3d_12349:	/
encoder3d_12351:
encoder3d_12353:	+
time_distributed_1_12359:	@&
time_distributed_1_12361:@0
frame_position_embedding_12366:@/
transformer_layer_1_12369:@@+
transformer_layer_1_12371:@/
transformer_layer_1_12373:@@+
transformer_layer_1_12375:@/
transformer_layer_1_12377:@@+
transformer_layer_1_12379:@/
transformer_layer_1_12381:@@'
transformer_layer_1_12383:@,
transformer_layer_1_12385:	@(
transformer_layer_1_12387:	,
transformer_layer_1_12389:	@'
transformer_layer_1_12391:@/
transformer_layer_2_12394:@@+
transformer_layer_2_12396:@/
transformer_layer_2_12398:@@+
transformer_layer_2_12400:@/
transformer_layer_2_12402:@@+
transformer_layer_2_12404:@/
transformer_layer_2_12406:@@'
transformer_layer_2_12408:@,
transformer_layer_2_12410:	@(
transformer_layer_2_12412:	,
transformer_layer_2_12414:	@'
transformer_layer_2_12416:@!
dense_5_12420:

dense_5_12422:	 
dense_6_12425:	
dense_6_12427:
identityЂdense_5/StatefulPartitionedCallЂdense_6/StatefulPartitionedCallЂ!encoder3d/StatefulPartitionedCallЂ0frame_position_embedding/StatefulPartitionedCallЂ*time_distributed_1/StatefulPartitionedCallЂ+transformer_layer_1/StatefulPartitionedCallЂ+transformer_layer_2/StatefulPartitionedCallЪ
!encoder3d/StatefulPartitionedCallStatefulPartitionedCallinput_1encoder3d_12327encoder3d_12329encoder3d_12331encoder3d_12333encoder3d_12335encoder3d_12337encoder3d_12339encoder3d_12341encoder3d_12343encoder3d_12345encoder3d_12347encoder3d_12349encoder3d_12351encoder3d_12353*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11227ѓ
 time_distributed/PartitionedCallPartitionedCall*encoder3d/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_time_distributed_layer_call_and_return_conditional_losses_11454w
time_distributed/Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"џџџџ         Г
time_distributed/ReshapeReshape*encoder3d/StatefulPartitionedCall:output:0'time_distributed/Reshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџП
*time_distributed_1/StatefulPartitionedCallStatefulPartitionedCall)time_distributed/PartitionedCall:output:0time_distributed_1_12359time_distributed_1_12361*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *V
fQRO
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_11527q
 time_distributed_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   Ў
time_distributed_1/ReshapeReshape)time_distributed/PartitionedCall:output:0)time_distributed_1/Reshape/shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџ
0frame_position_embedding/StatefulPartitionedCallStatefulPartitionedCall3time_distributed_1/StatefulPartitionedCall:output:0frame_position_embedding_12366*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11291Я
+transformer_layer_1/StatefulPartitionedCallStatefulPartitionedCall9frame_position_embedding/StatefulPartitionedCall:output:0transformer_layer_1_12369transformer_layer_1_12371transformer_layer_1_12373transformer_layer_1_12375transformer_layer_1_12377transformer_layer_1_12379transformer_layer_1_12381transformer_layer_1_12383transformer_layer_1_12385transformer_layer_1_12387transformer_layer_1_12389transformer_layer_1_12391*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11323Ъ
+transformer_layer_2/StatefulPartitionedCallStatefulPartitionedCall4transformer_layer_1/StatefulPartitionedCall:output:0transformer_layer_2_12394transformer_layer_2_12396transformer_layer_2_12398transformer_layer_2_12400transformer_layer_2_12402transformer_layer_2_12404transformer_layer_2_12406transformer_layer_2_12408transformer_layer_2_12410transformer_layer_2_12412transformer_layer_2_12414transformer_layer_2_12416*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11377ы
flatten_1/PartitionedCallPartitionedCall4transformer_layer_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_flatten_1_layer_call_and_return_conditional_losses_11678
dense_5/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_5_12420dense_5_12422*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_11698
dense_6/StatefulPartitionedCallStatefulPartitionedCall(dense_5/StatefulPartitionedCall:output:0dense_6_12425dense_6_12427*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_6_layer_call_and_return_conditional_losses_11715w
IdentityIdentity(dense_6/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџъ
NoOpNoOp ^dense_5/StatefulPartitionedCall ^dense_6/StatefulPartitionedCall"^encoder3d/StatefulPartitionedCall1^frame_position_embedding/StatefulPartitionedCall+^time_distributed_1/StatefulPartitionedCall,^transformer_layer_1/StatefulPartitionedCall,^transformer_layer_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes{
y:џџџџџџџџџ  : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2B
dense_6/StatefulPartitionedCalldense_6/StatefulPartitionedCall2F
!encoder3d/StatefulPartitionedCall!encoder3d/StatefulPartitionedCall2d
0frame_position_embedding/StatefulPartitionedCall0frame_position_embedding/StatefulPartitionedCall2X
*time_distributed_1/StatefulPartitionedCall*time_distributed_1/StatefulPartitionedCall2Z
+transformer_layer_1/StatefulPartitionedCall+transformer_layer_1/StatefulPartitionedCall2Z
+transformer_layer_2/StatefulPartitionedCall+transformer_layer_2/StatefulPartitionedCall:\ X
3
_output_shapes!
:џџџџџџџџџ  
!
_user_specified_name	input_1
јC
ј
@__inference_model_layer_call_and_return_conditional_losses_12538
input_1-
encoder3d_12434:
encoder3d_12436:-
encoder3d_12438: 
encoder3d_12440: -
encoder3d_12442:  
encoder3d_12444: -
encoder3d_12446: @
encoder3d_12448:@-
encoder3d_12450:@@
encoder3d_12452:@.
encoder3d_12454:@
encoder3d_12456:	/
encoder3d_12458:
encoder3d_12460:	+
time_distributed_1_12466:	@&
time_distributed_1_12468:@0
frame_position_embedding_12473:@/
transformer_layer_1_12476:@@+
transformer_layer_1_12478:@/
transformer_layer_1_12480:@@+
transformer_layer_1_12482:@/
transformer_layer_1_12484:@@+
transformer_layer_1_12486:@/
transformer_layer_1_12488:@@'
transformer_layer_1_12490:@,
transformer_layer_1_12492:	@(
transformer_layer_1_12494:	,
transformer_layer_1_12496:	@'
transformer_layer_1_12498:@/
transformer_layer_2_12501:@@+
transformer_layer_2_12503:@/
transformer_layer_2_12505:@@+
transformer_layer_2_12507:@/
transformer_layer_2_12509:@@+
transformer_layer_2_12511:@/
transformer_layer_2_12513:@@'
transformer_layer_2_12515:@,
transformer_layer_2_12517:	@(
transformer_layer_2_12519:	,
transformer_layer_2_12521:	@'
transformer_layer_2_12523:@!
dense_5_12527:

dense_5_12529:	 
dense_6_12532:	
dense_6_12534:
identityЂdense_5/StatefulPartitionedCallЂdense_6/StatefulPartitionedCallЂ!encoder3d/StatefulPartitionedCallЂ0frame_position_embedding/StatefulPartitionedCallЂ*time_distributed_1/StatefulPartitionedCallЂ+transformer_layer_1/StatefulPartitionedCallЂ+transformer_layer_2/StatefulPartitionedCallЪ
!encoder3d/StatefulPartitionedCallStatefulPartitionedCallinput_1encoder3d_12434encoder3d_12436encoder3d_12438encoder3d_12440encoder3d_12442encoder3d_12444encoder3d_12446encoder3d_12448encoder3d_12450encoder3d_12452encoder3d_12454encoder3d_12456encoder3d_12458encoder3d_12460*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :џџџџџџџџџ*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11973ѓ
 time_distributed/PartitionedCallPartitionedCall*encoder3d/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *T
fORM
K__inference_time_distributed_layer_call_and_return_conditional_losses_11481w
time_distributed/Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"џџџџ         Г
time_distributed/ReshapeReshape*encoder3d/StatefulPartitionedCall:output:0'time_distributed/Reshape/shape:output:0*
T0*0
_output_shapes
:џџџџџџџџџП
*time_distributed_1/StatefulPartitionedCallStatefulPartitionedCall)time_distributed/PartitionedCall:output:0time_distributed_1_12466time_distributed_1_12468*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *V
fQRO
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_11566q
 time_distributed_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   Ў
time_distributed_1/ReshapeReshape)time_distributed/PartitionedCall:output:0)time_distributed_1/Reshape/shape:output:0*
T0*(
_output_shapes
:џџџџџџџџџ
0frame_position_embedding/StatefulPartitionedCallStatefulPartitionedCall3time_distributed_1/StatefulPartitionedCall:output:0frame_position_embedding_12473*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_11291Я
+transformer_layer_1/StatefulPartitionedCallStatefulPartitionedCall9frame_position_embedding/StatefulPartitionedCall:output:0transformer_layer_1_12476transformer_layer_1_12478transformer_layer_1_12480transformer_layer_1_12482transformer_layer_1_12484transformer_layer_1_12486transformer_layer_1_12488transformer_layer_1_12490transformer_layer_1_12492transformer_layer_1_12494transformer_layer_1_12496transformer_layer_1_12498*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_12044Ъ
+transformer_layer_2/StatefulPartitionedCallStatefulPartitionedCall4transformer_layer_1/StatefulPartitionedCall:output:0transformer_layer_2_12501transformer_layer_2_12503transformer_layer_2_12505transformer_layer_2_12507transformer_layer_2_12509transformer_layer_2_12511transformer_layer_2_12513transformer_layer_2_12515transformer_layer_2_12517transformer_layer_2_12519transformer_layer_2_12521transformer_layer_2_12523*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *1
f,R*
(__inference_restored_function_body_12098ы
flatten_1/PartitionedCallPartitionedCall4transformer_layer_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *M
fHRF
D__inference_flatten_1_layer_call_and_return_conditional_losses_11678
dense_5/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_5_12527dense_5_12529*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_11698
dense_6/StatefulPartitionedCallStatefulPartitionedCall(dense_5/StatefulPartitionedCall:output:0dense_6_12532dense_6_12534*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8 *K
fFRD
B__inference_dense_6_layer_call_and_return_conditional_losses_11715w
IdentityIdentity(dense_6/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџъ
NoOpNoOp ^dense_5/StatefulPartitionedCall ^dense_6/StatefulPartitionedCall"^encoder3d/StatefulPartitionedCall1^frame_position_embedding/StatefulPartitionedCall+^time_distributed_1/StatefulPartitionedCall,^transformer_layer_1/StatefulPartitionedCall,^transformer_layer_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes{
y:џџџџџџџџџ  : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2B
dense_6/StatefulPartitionedCalldense_6/StatefulPartitionedCall2F
!encoder3d/StatefulPartitionedCall!encoder3d/StatefulPartitionedCall2d
0frame_position_embedding/StatefulPartitionedCall0frame_position_embedding/StatefulPartitionedCall2X
*time_distributed_1/StatefulPartitionedCall*time_distributed_1/StatefulPartitionedCall2Z
+transformer_layer_1/StatefulPartitionedCall+transformer_layer_1/StatefulPartitionedCall2Z
+transformer_layer_2/StatefulPartitionedCall+transformer_layer_2/StatefulPartitionedCall:\ X
3
_output_shapes!
:џџџџџџџџџ  
!
_user_specified_name	input_1
и"
ћ
B__inference_dense_3_layer_call_and_return_conditional_losses_14876

inputs4
!tensordot_readvariableop_resource:	@.
biasadd_readvariableop_resource:	
identityЂBiasAdd/ReadVariableOpЂTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	@*
dtype0X
Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:_
Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       E
Tensordot/ShapeShapeinputs*
T0*
_output_shapes
:Y
Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : Л
Tensordot/GatherV2GatherV2Tensordot/Shape:output:0Tensordot/free:output:0 Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:[
Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : П
Tensordot/GatherV2_1GatherV2Tensordot/Shape:output:0Tensordot/axes:output:0"Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Y
Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: n
Tensordot/ProdProdTensordot/GatherV2:output:0Tensordot/Const:output:0*
T0*
_output_shapes
: [
Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: t
Tensordot/Prod_1ProdTensordot/GatherV2_1:output:0Tensordot/Const_1:output:0*
T0*
_output_shapes
: W
Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : 
Tensordot/concatConcatV2Tensordot/free:output:0Tensordot/axes:output:0Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:y
Tensordot/stackPackTensordot/Prod:output:0Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:y
Tensordot/transpose	TransposeinputsTensordot/concat:output:0*
T0*+
_output_shapes
:џџџџџџџџџ@
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:џџџџџџџџџџџџџџџџџџ
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:џџџџџџџџџ\
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ї
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:џџџџџџџџџs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:џџџџџџџџџO

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?m
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*,
_output_shapes
:џџџџџџџџџP
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?v
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*,
_output_shapes
:џџџџџџџџџX
Gelu/ErfErfGelu/truediv:z:0*
T0*,
_output_shapes
:џџџџџџџџџO

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?k
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*,
_output_shapes
:џџџџџџџџџd

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*,
_output_shapes
:џџџџџџџџџb
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*,
_output_shapes
:џџџџџџџџџz
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:џџџџџџџџџ@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
­
Е
(__inference_restored_function_body_11227

inputs%
unknown:
	unknown_0:'
	unknown_1: 
	unknown_2: '
	unknown_3:  
	unknown_4: '
	unknown_5: @
	unknown_6:@'
	unknown_7:@@
	unknown_8:@(
	unknown_9:@

unknown_10:	*

unknown_11:

unknown_12:	
identityЂStatefulPartitionedCallш
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12*
Tin
2*
Tout
2*4
_output_shapes"
 :џџџџџџџџџ*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *L
fGRE
C__inference_encoder3d_layer_call_and_return_conditional_losses_2972|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:џџџџџџџџџ  : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
э
K
/__inference_max_pooling3d_1_layer_call_fn_14196

inputs
identityш
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8 *S
fNRL
J__inference_max_pooling3d_1_layer_call_and_return_conditional_losses_13126
IdentityIdentityPartitionedCall:output:0*
T0*W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ: {
W
_output_shapesE
C:Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 
_user_specified_nameinputs
Ц
^
B__inference_flatten_layer_call_and_return_conditional_losses_11447

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"џџџџ   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:џџџџџџџџџY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:џџџџџџџџџ:X T
0
_output_shapes
:џџџџџџџџџ
 
_user_specified_nameinputs

я
G__inference_sequential_2_layer_call_and_return_conditional_losses_14743

inputsF
'conv3d_4_conv3d_readvariableop_resource:@7
(conv3d_4_biasadd_readvariableop_resource:	G
'conv3d_5_conv3d_readvariableop_resource:7
(conv3d_5_biasadd_readvariableop_resource:	
identityЂconv3d_4/BiasAdd/ReadVariableOpЂconv3d_4/Conv3D/ReadVariableOpЂconv3d_5/BiasAdd/ReadVariableOpЂconv3d_5/Conv3D/ReadVariableOp
conv3d_4/Conv3D/ReadVariableOpReadVariableOp'conv3d_4_conv3d_readvariableop_resource*+
_output_shapes
:@*
dtype0Б
conv3d_4/Conv3DConv3Dinputs&conv3d_4/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	

conv3d_4/BiasAdd/ReadVariableOpReadVariableOp(conv3d_4_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
conv3d_4/BiasAddBiasAddconv3d_4/Conv3D:output:0'conv3d_4/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџo
conv3d_4/ReluReluconv3d_4/BiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџ
conv3d_5/Conv3D/ReadVariableOpReadVariableOp'conv3d_5_conv3d_readvariableop_resource*,
_output_shapes
:*
dtype0Ц
conv3d_5/Conv3DConv3Dconv3d_4/Relu:activations:0&conv3d_5/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	

conv3d_5/BiasAdd/ReadVariableOpReadVariableOp(conv3d_5_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
conv3d_5/BiasAddBiasAddconv3d_5/Conv3D:output:0'conv3d_5/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџo
conv3d_5/ReluReluconv3d_5/BiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџw
IdentityIdentityconv3d_5/Relu:activations:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџЬ
NoOpNoOp ^conv3d_4/BiasAdd/ReadVariableOp^conv3d_4/Conv3D/ReadVariableOp ^conv3d_5/BiasAdd/ReadVariableOp^conv3d_5/Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':џџџџџџџџџ@: : : : 2B
conv3d_4/BiasAdd/ReadVariableOpconv3d_4/BiasAdd/ReadVariableOp2@
conv3d_4/Conv3D/ReadVariableOpconv3d_4/Conv3D/ReadVariableOp2B
conv3d_5/BiasAdd/ReadVariableOpconv3d_5/BiasAdd/ReadVariableOp2@
conv3d_5/Conv3D/ReadVariableOpconv3d_5/Conv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ@
 
_user_specified_nameinputs
Њ
Ь
1__inference_transformer_layer_2_layer_call_fn_690

inputs
unknown:@@
	unknown_0:@
	unknown_1:@@
	unknown_2:@
	unknown_3:@@
	unknown_4:@
	unknown_5:@@
	unknown_6:@
	unknown_7:	@
	unknown_8:	
	unknown_9:	@

unknown_10:@
identityЂStatefulPartitionedCallы
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:џџџџџџџџџ@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8 *U
fPRN
L__inference_transformer_layer_2_layer_call_and_return_conditional_losses_673`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:џџџџџџџџџ@"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:џџџџџџџџџ@: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:џџџџџџџџџ@
 
_user_specified_nameinputs
њo
ѕ
C__inference_encoder3d_layer_call_and_return_conditional_losses_3876

inputsW
9spatial_attention_conv3d_6_conv3d_readvariableop_resource:H
:spatial_attention_conv3d_6_biasadd_readvariableop_resource:[
=conv2_plus1d_sequential_conv3d_conv3d_readvariableop_resource: L
>conv2_plus1d_sequential_conv3d_biasadd_readvariableop_resource: ]
?conv2_plus1d_sequential_conv3d_1_conv3d_readvariableop_resource:  N
@conv2_plus1d_sequential_conv3d_1_biasadd_readvariableop_resource: a
Cconv2_plus1d_1_sequential_1_conv3d_2_conv3d_readvariableop_resource: @R
Dconv2_plus1d_1_sequential_1_conv3d_2_biasadd_readvariableop_resource:@a
Cconv2_plus1d_1_sequential_1_conv3d_3_conv3d_readvariableop_resource:@@R
Dconv2_plus1d_1_sequential_1_conv3d_3_biasadd_readvariableop_resource:@b
Cconv2_plus1d_2_sequential_2_conv3d_4_conv3d_readvariableop_resource:@S
Dconv2_plus1d_2_sequential_2_conv3d_4_biasadd_readvariableop_resource:	c
Cconv2_plus1d_2_sequential_2_conv3d_5_conv3d_readvariableop_resource:S
Dconv2_plus1d_2_sequential_2_conv3d_5_biasadd_readvariableop_resource:	
identityЂ5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOpЂ4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOpЂ7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOpЂ6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOpЂ;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOpЂ:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOpЂ;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOpЂ:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOpЂ;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOpЂ:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOpЂ;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOpЂ:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOpЂ1spatial_attention/conv3d_6/BiasAdd/ReadVariableOpЂ0spatial_attention/conv3d_6/Conv3D/ReadVariableOpЖ
0spatial_attention/conv3d_6/Conv3D/ReadVariableOpReadVariableOp9spatial_attention_conv3d_6_conv3d_readvariableop_resource**
_output_shapes
:*
dtype0д
!spatial_attention/conv3d_6/Conv3DConv3Dinputs8spatial_attention/conv3d_6/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ  *
paddingSAME*
strides	
Ј
1spatial_attention/conv3d_6/BiasAdd/ReadVariableOpReadVariableOp:spatial_attention_conv3d_6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0в
"spatial_attention/conv3d_6/BiasAddBiasAdd*spatial_attention/conv3d_6/Conv3D:output:09spatial_attention/conv3d_6/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ  j
%spatial_attention/conv3d_6/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Х
#spatial_attention/conv3d_6/Gelu/mulMul.spatial_attention/conv3d_6/Gelu/mul/x:output:0+spatial_attention/conv3d_6/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ  k
&spatial_attention/conv3d_6/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *ѓЕ?Ю
'spatial_attention/conv3d_6/Gelu/truedivRealDiv+spatial_attention/conv3d_6/BiasAdd:output:0/spatial_attention/conv3d_6/Gelu/Cast/x:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ  
#spatial_attention/conv3d_6/Gelu/ErfErf+spatial_attention/conv3d_6/Gelu/truediv:z:0*
T0*3
_output_shapes!
:џџџџџџџџџ  j
%spatial_attention/conv3d_6/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?У
#spatial_attention/conv3d_6/Gelu/addAddV2.spatial_attention/conv3d_6/Gelu/add/x:output:0'spatial_attention/conv3d_6/Gelu/Erf:y:0*
T0*3
_output_shapes!
:џџџџџџџџџ  М
%spatial_attention/conv3d_6/Gelu/mul_1Mul'spatial_attention/conv3d_6/Gelu/mul:z:0'spatial_attention/conv3d_6/Gelu/add:z:0*
T0*3
_output_shapes!
:џџџџџџџџџ  
spatial_attention/multiply/mulMulinputs)spatial_attention/conv3d_6/Gelu/mul_1:z:0*
T0*3
_output_shapes!
:џџџџџџџџџ  О
4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOpReadVariableOp=conv2_plus1d_sequential_conv3d_conv3d_readvariableop_resource**
_output_shapes
: *
dtype0ј
%conv2_plus1d/sequential/conv3d/Conv3DConv3D"spatial_attention/multiply/mul:z:0<conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	
А
5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOpReadVariableOp>conv2_plus1d_sequential_conv3d_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0о
&conv2_plus1d/sequential/conv3d/BiasAddBiasAdd.conv2_plus1d/sequential/conv3d/Conv3D:output:0=conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   
#conv2_plus1d/sequential/conv3d/ReluRelu/conv2_plus1d/sequential/conv3d/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   Т
6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOpReadVariableOp?conv2_plus1d_sequential_conv3d_1_conv3d_readvariableop_resource**
_output_shapes
:  *
dtype0
'conv2_plus1d/sequential/conv3d_1/Conv3DConv3D1conv2_plus1d/sequential/conv3d/Relu:activations:0>conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   *
paddingSAME*
strides	
Д
7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOpReadVariableOp@conv2_plus1d_sequential_conv3d_1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0ф
(conv2_plus1d/sequential/conv3d_1/BiasAddBiasAdd0conv2_plus1d/sequential/conv3d_1/Conv3D:output:0?conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ   
%conv2_plus1d/sequential/conv3d_1/ReluRelu1conv2_plus1d/sequential/conv3d_1/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ   д
max_pooling3d/MaxPool3D	MaxPool3D3conv2_plus1d/sequential/conv3d_1/Relu:activations:0*
T0*3
_output_shapes!
:џџџџџџџџџ *
ksize	
*
paddingSAME*
strides	
Ъ
:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_1_sequential_1_conv3d_2_conv3d_readvariableop_resource**
_output_shapes
: @*
dtype0
+conv2_plus1d_1/sequential_1/conv3d_2/Conv3DConv3D max_pooling3d/MaxPool3D:output:0Bconv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	
М
;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_1_sequential_1_conv3d_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0№
,conv2_plus1d_1/sequential_1/conv3d_2/BiasAddBiasAdd4conv2_plus1d_1/sequential_1/conv3d_2/Conv3D:output:0Cconv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@І
)conv2_plus1d_1/sequential_1/conv3d_2/ReluRelu5conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@Ъ
:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_1_sequential_1_conv3d_3_conv3d_readvariableop_resource**
_output_shapes
:@@*
dtype0
+conv2_plus1d_1/sequential_1/conv3d_3/Conv3DConv3D7conv2_plus1d_1/sequential_1/conv3d_2/Relu:activations:0Bconv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
paddingSAME*
strides	
М
;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_1_sequential_1_conv3d_3_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0№
,conv2_plus1d_1/sequential_1/conv3d_3/BiasAddBiasAdd4conv2_plus1d_1/sequential_1/conv3d_3/Conv3D:output:0Cconv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:џџџџџџџџџ@І
)conv2_plus1d_1/sequential_1/conv3d_3/ReluRelu5conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd:output:0*
T0*3
_output_shapes!
:џџџџџџџџџ@к
max_pooling3d_1/MaxPool3D	MaxPool3D7conv2_plus1d_1/sequential_1/conv3d_3/Relu:activations:0*
T0*3
_output_shapes!
:џџџџџџџџџ@*
ksize	
*
paddingSAME*
strides	
Ы
:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_2_sequential_2_conv3d_4_conv3d_readvariableop_resource*+
_output_shapes
:@*
dtype0
+conv2_plus1d_2/sequential_2/conv3d_4/Conv3DConv3D"max_pooling3d_1/MaxPool3D:output:0Bconv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	
Н
;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_2_sequential_2_conv3d_4_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0ё
,conv2_plus1d_2/sequential_2/conv3d_4/BiasAddBiasAdd4conv2_plus1d_2/sequential_2/conv3d_4/Conv3D:output:0Cconv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџЇ
)conv2_plus1d_2/sequential_2/conv3d_4/ReluRelu5conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџЬ
:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_2_sequential_2_conv3d_5_conv3d_readvariableop_resource*,
_output_shapes
:*
dtype0
+conv2_plus1d_2/sequential_2/conv3d_5/Conv3DConv3D7conv2_plus1d_2/sequential_2/conv3d_4/Relu:activations:0Bconv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
paddingSAME*
strides	
Н
;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_2_sequential_2_conv3d_5_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0ё
,conv2_plus1d_2/sequential_2/conv3d_5/BiasAddBiasAdd4conv2_plus1d_2/sequential_2/conv3d_5/Conv3D:output:0Cconv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :џџџџџџџџџЇ
)conv2_plus1d_2/sequential_2/conv3d_5/ReluRelu5conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd:output:0*
T0*4
_output_shapes"
 :џџџџџџџџџл
max_pooling3d_2/MaxPool3D	MaxPool3D7conv2_plus1d_2/sequential_2/conv3d_5/Relu:activations:0*
T0*4
_output_shapes"
 :џџџџџџџџџ*
ksize	
*
paddingSAME*
strides	
ћ
NoOpNoOp6^conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp5^conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp8^conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp7^conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp<^conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp;^conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp<^conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp;^conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp<^conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp;^conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp<^conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp;^conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp2^spatial_attention/conv3d_6/BiasAdd/ReadVariableOp1^spatial_attention/conv3d_6/Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 ~
IdentityIdentity"max_pooling3d_2/MaxPool3D:output:0^NoOp*
T0*4
_output_shapes"
 :џџџџџџџџџ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:џџџџџџџџџ  : : : : : : : : : : : : : : 2n
5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp5conv2_plus1d/sequential/conv3d/BiasAdd/ReadVariableOp2l
4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp4conv2_plus1d/sequential/conv3d/Conv3D/ReadVariableOp2r
7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp7conv2_plus1d/sequential/conv3d_1/BiasAdd/ReadVariableOp2p
6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp6conv2_plus1d/sequential/conv3d_1/Conv3D/ReadVariableOp2z
;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp;conv2_plus1d_1/sequential_1/conv3d_2/BiasAdd/ReadVariableOp2x
:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp:conv2_plus1d_1/sequential_1/conv3d_2/Conv3D/ReadVariableOp2z
;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp;conv2_plus1d_1/sequential_1/conv3d_3/BiasAdd/ReadVariableOp2x
:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp:conv2_plus1d_1/sequential_1/conv3d_3/Conv3D/ReadVariableOp2z
;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp;conv2_plus1d_2/sequential_2/conv3d_4/BiasAdd/ReadVariableOp2x
:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp:conv2_plus1d_2/sequential_2/conv3d_4/Conv3D/ReadVariableOp2z
;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp;conv2_plus1d_2/sequential_2/conv3d_5/BiasAdd/ReadVariableOp2x
:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp:conv2_plus1d_2/sequential_2/conv3d_5/Conv3D/ReadVariableOp2f
1spatial_attention/conv3d_6/BiasAdd/ReadVariableOp1spatial_attention/conv3d_6/BiasAdd/ReadVariableOp2d
0spatial_attention/conv3d_6/Conv3D/ReadVariableOp0spatial_attention/conv3d_6/Conv3D/ReadVariableOp:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs
Ц
л
%__inference_model_layer_call_fn_12736

inputs%
unknown:
	unknown_0:'
	unknown_1: 
	unknown_2: '
	unknown_3:  
	unknown_4: '
	unknown_5: @
	unknown_6:@'
	unknown_7:@@
	unknown_8:@(
	unknown_9:@

unknown_10:	*

unknown_11:

unknown_12:	

unknown_13:	@

unknown_14:@

unknown_15:@ 

unknown_16:@@

unknown_17:@ 

unknown_18:@@

unknown_19:@ 

unknown_20:@@

unknown_21:@ 

unknown_22:@@

unknown_23:@

unknown_24:	@

unknown_25:	

unknown_26:	@

unknown_27:@ 

unknown_28:@@

unknown_29:@ 

unknown_30:@@

unknown_31:@ 

unknown_32:@@

unknown_33:@ 

unknown_34:@@

unknown_35:@

unknown_36:	@

unknown_37:	

unknown_38:	@

unknown_39:@

unknown_40:


unknown_41:	

unknown_42:	

unknown_43:
identityЂStatefulPartitionedCallЉ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20
unknown_21
unknown_22
unknown_23
unknown_24
unknown_25
unknown_26
unknown_27
unknown_28
unknown_29
unknown_30
unknown_31
unknown_32
unknown_33
unknown_34
unknown_35
unknown_36
unknown_37
unknown_38
unknown_39
unknown_40
unknown_41
unknown_42
unknown_43*9
Tin2
02.*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:џџџџџџџџџ*O
_read_only_resource_inputs1
/-	
 !"#$%&'()*+,-*0
config_proto 

CPU

GPU2*0J 8 *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_11722o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:џџџџџџџџџ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes{
y:џџџџџџџџџ  : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:џџџџџџџџџ  
 
_user_specified_nameinputs"Е	L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*Ж
serving_defaultЂ
G
input_1<
serving_default_input_1:0џџџџџџџџџ  ;
dense_60
StatefulPartitionedCall:0џџџџџџџџџtensorflow/serving/predict:
Р
layer-0
layer_with_weights-0
layer-1
layer-2
layer_with_weights-1
layer-3
layer_with_weights-2
layer-4
layer_with_weights-3
layer-5
layer_with_weights-4
layer-6
layer-7
	layer_with_weights-5
	layer-8

layer_with_weights-6

layer-9
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
	optimizer

signatures
#_self_saveable_object_factories"
_tf_keras_network
D
#_self_saveable_object_factories"
_tf_keras_input_layer
Ж
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
spatial_attention

conv3d
conv3d2
conv3d3
 	pooling3d
!
pooling3d2
"
pooling3d3
##_self_saveable_object_factories"
_tf_keras_layer
е
$	variables
%trainable_variables
&regularization_losses
'	keras_api
(__call__
*)&call_and_return_all_conditional_losses
	*layer
#+_self_saveable_object_factories"
_tf_keras_layer
е
,	variables
-trainable_variables
.regularization_losses
/	keras_api
0__call__
*1&call_and_return_all_conditional_losses
	2layer
#3_self_saveable_object_factories"
_tf_keras_layer
у
4	variables
5trainable_variables
6regularization_losses
7	keras_api
8__call__
*9&call_and_return_all_conditional_losses
:position_embeddings
#;_self_saveable_object_factories"
_tf_keras_layer
щ
<	variables
=trainable_variables
>regularization_losses
?	keras_api
@__call__
*A&call_and_return_all_conditional_losses
B	attention
C
dense_proj
#D_self_saveable_object_factories"
_tf_keras_layer
щ
E	variables
Ftrainable_variables
Gregularization_losses
H	keras_api
I__call__
*J&call_and_return_all_conditional_losses
K	attention
L
dense_proj
#M_self_saveable_object_factories"
_tf_keras_layer
Ъ
N	variables
Otrainable_variables
Pregularization_losses
Q	keras_api
R__call__
*S&call_and_return_all_conditional_losses
#T_self_saveable_object_factories"
_tf_keras_layer
р
U	variables
Vtrainable_variables
Wregularization_losses
X	keras_api
Y__call__
*Z&call_and_return_all_conditional_losses

[kernel
\bias
#]_self_saveable_object_factories"
_tf_keras_layer
р
^	variables
_trainable_variables
`regularization_losses
a	keras_api
b__call__
*c&call_and_return_all_conditional_losses

dkernel
ebias
#f_self_saveable_object_factories"
_tf_keras_layer

g0
h1
i2
j3
k4
l5
m6
n7
o8
p9
q10
r11
s12
t13
u14
v15
w16
x17
y18
z19
{20
|21
}22
~23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
[41
\42
d43
e44"
trackable_list_wrapper
<
[0
\1
d2
e3"
trackable_list_wrapper
 "
trackable_list_wrapper
Я
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
б
trace_0
trace_1
trace_2
trace_32о
%__inference_model_layer_call_fn_11815
%__inference_model_layer_call_fn_12736
%__inference_model_layer_call_fn_12831
%__inference_model_layer_call_fn_12324П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0ztrace_1ztrace_2ztrace_3
Н
trace_0
trace_1
trace_2
trace_32Ъ
@__inference_model_layer_call_and_return_conditional_losses_12968
@__inference_model_layer_call_and_return_conditional_losses_13105
@__inference_model_layer_call_and_return_conditional_losses_12431
@__inference_model_layer_call_and_return_conditional_losses_12538П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0ztrace_1ztrace_2ztrace_3
ЫBШ
 __inference__wrapped_model_11427input_1"
В
FullArgSpec
args 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ќ
	iter
beta_1
beta_2

 decay
Ёlearning_rate[mв\mгdmдemеgmжhmзimиjmйkmкlmлmmмnmнomоpmпqmрrmсsmтtmуumфvmхwmцxmчymшzmщ{mъ|mы}mь~mэmю	mя	m№	mё	mђ	mѓ	mє	mѕ	mі	mї	mј	mљ	mњ	mћ	mќ	m§	mў[vџ\vdvevgvhvivjvkvlvmvnvovpvqvrvsvtvuvvvwvxvyvzv{v|v}v~vv	v	v	v	v	v 	vЁ	vЂ	vЃ	vЄ	vЅ	vІ	vЇ	vЈ	vЉ	vЊ	vЋ"
	optimizer
-
Ђserving_default"
signature_map
 "
trackable_dict_wrapper
 "
trackable_dict_wrapper

g0
h1
i2
j3
k4
l5
m6
n7
o8
p9
q10
r11
s12
t13"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
Ѓnon_trainable_variables
Єlayers
Ѕmetrics
 Іlayer_regularization_losses
Їlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
Ц
Јtrace_0
Љtrace_12
'__inference_encoder3d_layer_call_fn_837
(__inference_encoder3d_layer_call_fn_3895Е
ЎВЊ
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 zЈtrace_0zЉtrace_1
ќ
Њtrace_0
Ћtrace_12С
C__inference_encoder3d_layer_call_and_return_conditional_losses_2972
B__inference_encoder3d_layer_call_and_return_conditional_losses_578Е
ЎВЊ
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 zЊtrace_0zЋtrace_1
м
Ќ	variables
­trainable_variables
Ўregularization_losses
Џ	keras_api
А__call__
+Б&call_and_return_all_conditional_losses
	Вconv
$Г_self_saveable_object_factories"
_tf_keras_layer
л
Д	variables
Еtrainable_variables
Жregularization_losses
З	keras_api
И__call__
+Й&call_and_return_all_conditional_losses
Кseq
$Л_self_saveable_object_factories"
_tf_keras_layer
л
М	variables
Нtrainable_variables
Оregularization_losses
П	keras_api
Р__call__
+С&call_and_return_all_conditional_losses
Тseq
$У_self_saveable_object_factories"
_tf_keras_layer
л
Ф	variables
Хtrainable_variables
Цregularization_losses
Ч	keras_api
Ш__call__
+Щ&call_and_return_all_conditional_losses
Ъseq
$Ы_self_saveable_object_factories"
_tf_keras_layer
б
Ь	variables
Эtrainable_variables
Юregularization_losses
Я	keras_api
а__call__
+б&call_and_return_all_conditional_losses
$в_self_saveable_object_factories"
_tf_keras_layer
б
г	variables
дtrainable_variables
еregularization_losses
ж	keras_api
з__call__
+и&call_and_return_all_conditional_losses
$й_self_saveable_object_factories"
_tf_keras_layer
б
к	variables
лtrainable_variables
мregularization_losses
н	keras_api
о__call__
+п&call_and_return_all_conditional_losses
$р_self_saveable_object_factories"
_tf_keras_layer
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
сnon_trainable_variables
тlayers
уmetrics
 фlayer_regularization_losses
хlayer_metrics
$	variables
%trainable_variables
&regularization_losses
(__call__
*)&call_and_return_all_conditional_losses
&)"call_and_return_conditional_losses"
_generic_user_object
с
цtrace_0
чtrace_12І
0__inference_time_distributed_layer_call_fn_13146
0__inference_time_distributed_layer_call_fn_13151П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zцtrace_0zчtrace_1

шtrace_0
щtrace_12м
K__inference_time_distributed_layer_call_and_return_conditional_losses_13168
K__inference_time_distributed_layer_call_and_return_conditional_losses_13185П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zшtrace_0zщtrace_1
б
ъ	variables
ыtrainable_variables
ьregularization_losses
э	keras_api
ю__call__
+я&call_and_return_all_conditional_losses
$№_self_saveable_object_factories"
_tf_keras_layer
 "
trackable_dict_wrapper
.
u0
v1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
ёnon_trainable_variables
ђlayers
ѓmetrics
 єlayer_regularization_losses
ѕlayer_metrics
,	variables
-trainable_variables
.regularization_losses
0__call__
*1&call_and_return_all_conditional_losses
&1"call_and_return_conditional_losses"
_generic_user_object
х
іtrace_0
їtrace_12Њ
2__inference_time_distributed_1_layer_call_fn_13194
2__inference_time_distributed_1_layer_call_fn_13203П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zіtrace_0zїtrace_1

јtrace_0
љtrace_12р
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_13232
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_13261П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zјtrace_0zљtrace_1
ч
њ	variables
ћtrainable_variables
ќregularization_losses
§	keras_api
ў__call__
+џ&call_and_return_all_conditional_losses

ukernel
vbias
$_self_saveable_object_factories"
_tf_keras_layer
 "
trackable_dict_wrapper
'
w0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
4	variables
5trainable_variables
6regularization_losses
8__call__
*9&call_and_return_all_conditional_losses
&9"call_and_return_conditional_losses"
_generic_user_object
ѓ
trace_02д
7__inference_frame_position_embedding_layer_call_fn_2248
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0

trace_02я
R__inference_frame_position_embedding_layer_call_and_return_conditional_losses_3199
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0
с
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses
w
embeddings
$_self_saveable_object_factories"
_tf_keras_layer
 "
trackable_dict_wrapper
z
x0
y1
z2
{3
|4
}5
~6
7
8
9
10
11"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
<	variables
=trainable_variables
>regularization_losses
@__call__
*A&call_and_return_all_conditional_losses
&A"call_and_return_conditional_losses"
_generic_user_object
ш
trace_0
trace_12­
2__inference_transformer_layer_1_layer_call_fn_3699
2__inference_transformer_layer_1_layer_call_fn_1346Т
ЛВЗ
FullArgSpec
args
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 ztrace_0ztrace_1

trace_0
trace_12т
M__inference_transformer_layer_1_layer_call_and_return_conditional_losses_2344
L__inference_transformer_layer_1_layer_call_and_return_conditional_losses_971Т
ЛВЗ
FullArgSpec
args
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 ztrace_0ztrace_1
Р
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses
_query_dense

_key_dense
 _value_dense
Ё_softmax
Ђ_dropout_layer
Ѓ_output_dense
$Є_self_saveable_object_factories"
_tf_keras_layer
Ј
Ѕlayer_with_weights-0
Ѕlayer-0
Іlayer_with_weights-1
Іlayer-1
Ї	variables
Јtrainable_variables
Љregularization_losses
Њ	keras_api
Ћ__call__
+Ќ&call_and_return_all_conditional_losses
$­_self_saveable_object_factories"
_tf_keras_sequential
 "
trackable_dict_wrapper

0
1
2
3
4
5
6
7
8
9
10
11"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
Ўnon_trainable_variables
Џlayers
Аmetrics
 Бlayer_regularization_losses
Вlayer_metrics
E	variables
Ftrainable_variables
Gregularization_losses
I__call__
*J&call_and_return_all_conditional_losses
&J"call_and_return_conditional_losses"
_generic_user_object
ч
Гtrace_0
Дtrace_12Ќ
2__inference_transformer_layer_2_layer_call_fn_1542
1__inference_transformer_layer_2_layer_call_fn_690Т
ЛВЗ
FullArgSpec
args
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 zГtrace_0zДtrace_1

Еtrace_0
Жtrace_12у
M__inference_transformer_layer_2_layer_call_and_return_conditional_losses_5281
M__inference_transformer_layer_2_layer_call_and_return_conditional_losses_1181Т
ЛВЗ
FullArgSpec
args
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 zЕtrace_0zЖtrace_1
Р
З	variables
Иtrainable_variables
Йregularization_losses
К	keras_api
Л__call__
+М&call_and_return_all_conditional_losses
Н_query_dense
О
_key_dense
П_value_dense
Р_softmax
С_dropout_layer
Т_output_dense
$У_self_saveable_object_factories"
_tf_keras_layer
Ј
Фlayer_with_weights-0
Фlayer-0
Хlayer_with_weights-1
Хlayer-1
Ц	variables
Чtrainable_variables
Шregularization_losses
Щ	keras_api
Ъ__call__
+Ы&call_and_return_all_conditional_losses
$Ь_self_saveable_object_factories"
_tf_keras_sequential
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
В
Эnon_trainable_variables
Юlayers
Яmetrics
 аlayer_regularization_losses
бlayer_metrics
N	variables
Otrainable_variables
Pregularization_losses
R__call__
*S&call_and_return_all_conditional_losses
&S"call_and_return_conditional_losses"
_generic_user_object
я
вtrace_02а
)__inference_flatten_1_layer_call_fn_13666Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zвtrace_0

гtrace_02ы
D__inference_flatten_1_layer_call_and_return_conditional_losses_13672Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zгtrace_0
 "
trackable_dict_wrapper
.
[0
\1"
trackable_list_wrapper
.
[0
\1"
trackable_list_wrapper
 "
trackable_list_wrapper
В
дnon_trainable_variables
еlayers
жmetrics
 зlayer_regularization_losses
иlayer_metrics
U	variables
Vtrainable_variables
Wregularization_losses
Y__call__
*Z&call_and_return_all_conditional_losses
&Z"call_and_return_conditional_losses"
_generic_user_object
э
йtrace_02Ю
'__inference_dense_5_layer_call_fn_13681Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zйtrace_0

кtrace_02щ
B__inference_dense_5_layer_call_and_return_conditional_losses_13699Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zкtrace_0
": 
2dense_5/kernel
:2dense_5/bias
 "
trackable_dict_wrapper
.
d0
e1"
trackable_list_wrapper
.
d0
e1"
trackable_list_wrapper
 "
trackable_list_wrapper
В
лnon_trainable_variables
мlayers
нmetrics
 оlayer_regularization_losses
пlayer_metrics
^	variables
_trainable_variables
`regularization_losses
b__call__
*c&call_and_return_all_conditional_losses
&c"call_and_return_conditional_losses"
_generic_user_object
э
рtrace_02Ю
'__inference_dense_6_layer_call_fn_13708Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zрtrace_0

сtrace_02щ
B__inference_dense_6_layer_call_and_return_conditional_losses_13719Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zсtrace_0
!:	2dense_6/kernel
:2dense_6/bias
 "
trackable_dict_wrapper
I:G2+encoder3d/spatial_attention/conv3d_6/kernel
7:52)encoder3d/spatial_attention/conv3d_6/bias
+:) 2conv3d/kernel
: 2conv3d/bias
-:+  2conv3d_1/kernel
: 2conv3d_1/bias
-:+ @2conv3d_2/kernel
:@2conv3d_2/bias
-:+@@2conv3d_3/kernel
:@2conv3d_3/bias
.:,@2conv3d_4/kernel
:2conv3d_4/bias
/:-2conv3d_5/kernel
:2conv3d_5/bias
,:*	@2time_distributed_1/kernel
%:#@2time_distributed_1/bias
?:=@2-frame_position_embedding/embedding/embeddings
K:I@@25transformer_layer_1/multi_head_attention/query/kernel
E:C@23transformer_layer_1/multi_head_attention/query/bias
I:G@@23transformer_layer_1/multi_head_attention/key/kernel
C:A@21transformer_layer_1/multi_head_attention/key/bias
K:I@@25transformer_layer_1/multi_head_attention/value/kernel
E:C@23transformer_layer_1/multi_head_attention/value/bias
V:T@@2@transformer_layer_1/multi_head_attention/attention_output/kernel
L:J@2>transformer_layer_1/multi_head_attention/attention_output/bias
!:	@2dense_1/kernel
:2dense_1/bias
!:	@2dense_2/kernel
:@2dense_2/bias
M:K@@27transformer_layer_2/multi_head_attention_1/query/kernel
G:E@25transformer_layer_2/multi_head_attention_1/query/bias
K:I@@25transformer_layer_2/multi_head_attention_1/key/kernel
E:C@23transformer_layer_2/multi_head_attention_1/key/bias
M:K@@27transformer_layer_2/multi_head_attention_1/value/kernel
G:E@25transformer_layer_2/multi_head_attention_1/value/bias
X:V@@2Btransformer_layer_2/multi_head_attention_1/attention_output/kernel
N:L@2@transformer_layer_2/multi_head_attention_1/attention_output/bias
!:	@2dense_3/kernel
:2dense_3/bias
!:	@2dense_4/kernel
:@2dense_4/bias
ю
g0
h1
i2
j3
k4
l5
m6
n7
o8
p9
q10
r11
s12
t13
u14
v15
w16
x17
y18
z19
{20
|21
}22
~23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40"
trackable_list_wrapper
f
0
1
2
3
4
5
6
7
	8

9"
trackable_list_wrapper
0
т0
у1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
їBє
%__inference_model_layer_call_fn_11815input_1"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
%__inference_model_layer_call_fn_12736inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
%__inference_model_layer_call_fn_12831inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
їBє
%__inference_model_layer_call_fn_12324input_1"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
@__inference_model_layer_call_and_return_conditional_losses_12968inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
@__inference_model_layer_call_and_return_conditional_losses_13105inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
@__inference_model_layer_call_and_return_conditional_losses_12431input_1"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
@__inference_model_layer_call_and_return_conditional_losses_12538input_1"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
ЪBЧ
#__inference_signature_wrapper_12641input_1"
В
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 

g0
h1
i2
j3
k4
l5
m6
n7
o8
p9
q10
r11
s12
t13"
trackable_list_wrapper
Q
0
1
2
3
 4
!5
"6"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
юBы
'__inference_encoder3d_layer_call_fn_837inputs"Е
ЎВЊ
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
яBь
(__inference_encoder3d_layer_call_fn_3895inputs"Е
ЎВЊ
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
B
C__inference_encoder3d_layer_call_and_return_conditional_losses_2972inputs"Е
ЎВЊ
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
B
B__inference_encoder3d_layer_call_and_return_conditional_losses_578inputs"Е
ЎВЊ
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
.
g0
h1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
фnon_trainable_variables
хlayers
цmetrics
 чlayer_regularization_losses
шlayer_metrics
Ќ	variables
­trainable_variables
Ўregularization_losses
А__call__
+Б&call_and_return_all_conditional_losses
'Б"call_and_return_conditional_losses"
_generic_user_object
2
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
2
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 

щ	variables
ъtrainable_variables
ыregularization_losses
ь	keras_api
э__call__
+ю&call_and_return_all_conditional_losses

gkernel
hbias
$я_self_saveable_object_factories
!№_jit_compiled_convolution_op"
_tf_keras_layer
 "
trackable_dict_wrapper
<
i0
j1
k2
l3"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
ёnon_trainable_variables
ђlayers
ѓmetrics
 єlayer_regularization_losses
ѕlayer_metrics
Д	variables
Еtrainable_variables
Жregularization_losses
И__call__
+Й&call_and_return_all_conditional_losses
'Й"call_and_return_conditional_losses"
_generic_user_object
Ж2ГА
ЉВЅ
FullArgSpec
args
jx
varargs
 
varkw
 
defaults
 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
Ж2ГА
ЉВЅ
FullArgSpec
args
jx
varargs
 
varkw
 
defaults
 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
Ј
іlayer_with_weights-0
іlayer-0
їlayer_with_weights-1
їlayer-1
ј	variables
љtrainable_variables
њregularization_losses
ћ	keras_api
ќ__call__
+§&call_and_return_all_conditional_losses
$ў_self_saveable_object_factories"
_tf_keras_sequential
 "
trackable_dict_wrapper
<
m0
n1
o2
p3"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
џnon_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
М	variables
Нtrainable_variables
Оregularization_losses
Р__call__
+С&call_and_return_all_conditional_losses
'С"call_and_return_conditional_losses"
_generic_user_object
Ж2ГА
ЉВЅ
FullArgSpec
args
jx
varargs
 
varkw
 
defaults
 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
Ж2ГА
ЉВЅ
FullArgSpec
args
jx
varargs
 
varkw
 
defaults
 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
Ј
layer_with_weights-0
layer-0
layer_with_weights-1
layer-1
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses
$_self_saveable_object_factories"
_tf_keras_sequential
 "
trackable_dict_wrapper
<
q0
r1
s2
t3"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Ф	variables
Хtrainable_variables
Цregularization_losses
Ш__call__
+Щ&call_and_return_all_conditional_losses
'Щ"call_and_return_conditional_losses"
_generic_user_object
Ж2ГА
ЉВЅ
FullArgSpec
args
jx
varargs
 
varkw
 
defaults
 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
Ж2ГА
ЉВЅ
FullArgSpec
args
jx
varargs
 
varkw
 
defaults
 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
Ј
layer_with_weights-0
layer-0
layer_with_weights-1
layer-1
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses
$_self_saveable_object_factories"
_tf_keras_sequential
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Ь	variables
Эtrainable_variables
Юregularization_losses
а__call__
+б&call_and_return_all_conditional_losses
'б"call_and_return_conditional_losses"
_generic_user_object
ѓ
 trace_02д
-__inference_max_pooling3d_layer_call_fn_14186Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 z trace_0

Ёtrace_02я
H__inference_max_pooling3d_layer_call_and_return_conditional_losses_14191Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЁtrace_0
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Ђnon_trainable_variables
Ѓlayers
Єmetrics
 Ѕlayer_regularization_losses
Іlayer_metrics
г	variables
дtrainable_variables
еregularization_losses
з__call__
+и&call_and_return_all_conditional_losses
'и"call_and_return_conditional_losses"
_generic_user_object
ѕ
Їtrace_02ж
/__inference_max_pooling3d_1_layer_call_fn_14196Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЇtrace_0

Јtrace_02ё
J__inference_max_pooling3d_1_layer_call_and_return_conditional_losses_14201Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЈtrace_0
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Љnon_trainable_variables
Њlayers
Ћmetrics
 Ќlayer_regularization_losses
­layer_metrics
к	variables
лtrainable_variables
мregularization_losses
о__call__
+п&call_and_return_all_conditional_losses
'п"call_and_return_conditional_losses"
_generic_user_object
ѕ
Ўtrace_02ж
/__inference_max_pooling3d_2_layer_call_fn_14206Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЎtrace_0

Џtrace_02ё
J__inference_max_pooling3d_2_layer_call_and_return_conditional_losses_14211Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЏtrace_0
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
'
*0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
Bў
0__inference_time_distributed_layer_call_fn_13146inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Bў
0__inference_time_distributed_layer_call_fn_13151inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
K__inference_time_distributed_layer_call_and_return_conditional_losses_13168inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
K__inference_time_distributed_layer_call_and_return_conditional_losses_13185inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Аnon_trainable_variables
Бlayers
Вmetrics
 Гlayer_regularization_losses
Дlayer_metrics
ъ	variables
ыtrainable_variables
ьregularization_losses
ю__call__
+я&call_and_return_all_conditional_losses
'я"call_and_return_conditional_losses"
_generic_user_object
э
Еtrace_02Ю
'__inference_flatten_layer_call_fn_14216Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЕtrace_0

Жtrace_02щ
B__inference_flatten_layer_call_and_return_conditional_losses_14222Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЖtrace_0
 "
trackable_dict_wrapper
.
u0
v1"
trackable_list_wrapper
'
20"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
B
2__inference_time_distributed_1_layer_call_fn_13194inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
2__inference_time_distributed_1_layer_call_fn_13203inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_13232inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_13261inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
.
u0
v1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Зnon_trainable_variables
Иlayers
Йmetrics
 Кlayer_regularization_losses
Лlayer_metrics
њ	variables
ћtrainable_variables
ќregularization_losses
ў__call__
+џ&call_and_return_all_conditional_losses
'џ"call_and_return_conditional_losses"
_generic_user_object
ы
Мtrace_02Ь
%__inference_dense_layer_call_fn_14231Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zМtrace_0

Нtrace_02ч
@__inference_dense_layer_call_and_return_conditional_losses_14249Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zНtrace_0
 "
trackable_dict_wrapper
'
w0"
trackable_list_wrapper
'
:0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
сBо
7__inference_frame_position_embedding_layer_call_fn_2248inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ќBљ
R__inference_frame_position_embedding_layer_call_and_return_conditional_losses_3199inputs"
В
FullArgSpec
args

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
'
w0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Оnon_trainable_variables
Пlayers
Рmetrics
 Сlayer_regularization_losses
Тlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_dict_wrapper
z
x0
y1
z2
{3
|4
}5
~6
7
8
9
10
11"
trackable_list_wrapper
.
B0
C1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
B
2__inference_transformer_layer_1_layer_call_fn_3699inputs"Т
ЛВЗ
FullArgSpec
args
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
B
2__inference_transformer_layer_1_layer_call_fn_1346inputs"Т
ЛВЗ
FullArgSpec
args
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
ЁB
M__inference_transformer_layer_1_layer_call_and_return_conditional_losses_2344inputs"Т
ЛВЗ
FullArgSpec
args
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
 B
L__inference_transformer_layer_1_layer_call_and_return_conditional_losses_971inputs"Т
ЛВЗ
FullArgSpec
args
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
X
x0
y1
z2
{3
|4
}5
~6
7"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Уnon_trainable_variables
Фlayers
Хmetrics
 Цlayer_regularization_losses
Чlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
2
В
FullArgSpecx
argspm
jself
jquery
jvalue
jkey
jattention_mask
jreturn_attention_scores

jtraining
juse_causal_mask
varargs
 
varkw
 #
defaults

 

 
p 
p 
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
2
В
FullArgSpecx
argspm
jself
jquery
jvalue
jkey
jattention_mask
jreturn_attention_scores

jtraining
juse_causal_mask
varargs
 
varkw
 #
defaults

 

 
p 
p 
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 

Ш	variables
Щtrainable_variables
Ъregularization_losses
Ы	keras_api
Ь__call__
+Э&call_and_return_all_conditional_losses
Юpartial_output_shape
Яfull_output_shape

xkernel
ybias
$а_self_saveable_object_factories"
_tf_keras_layer

б	variables
вtrainable_variables
гregularization_losses
д	keras_api
е__call__
+ж&call_and_return_all_conditional_losses
зpartial_output_shape
иfull_output_shape

zkernel
{bias
$й_self_saveable_object_factories"
_tf_keras_layer

к	variables
лtrainable_variables
мregularization_losses
н	keras_api
о__call__
+п&call_and_return_all_conditional_losses
рpartial_output_shape
сfull_output_shape

|kernel
}bias
$т_self_saveable_object_factories"
_tf_keras_layer
б
у	variables
фtrainable_variables
хregularization_losses
ц	keras_api
ч__call__
+ш&call_and_return_all_conditional_losses
$щ_self_saveable_object_factories"
_tf_keras_layer
щ
ъ	variables
ыtrainable_variables
ьregularization_losses
э	keras_api
ю__call__
+я&call_and_return_all_conditional_losses
№_random_generator
$ё_self_saveable_object_factories"
_tf_keras_layer

ђ	variables
ѓtrainable_variables
єregularization_losses
ѕ	keras_api
і__call__
+ї&call_and_return_all_conditional_losses
јpartial_output_shape
љfull_output_shape

~kernel
bias
$њ_self_saveable_object_factories"
_tf_keras_layer
 "
trackable_dict_wrapper
щ
ћ	variables
ќtrainable_variables
§regularization_losses
ў	keras_api
џ__call__
+&call_and_return_all_conditional_losses
kernel
	bias
$_self_saveable_object_factories"
_tf_keras_layer
щ
	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses
kernel
	bias
$_self_saveable_object_factories"
_tf_keras_layer
@
0
1
2
3"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Ї	variables
Јtrainable_variables
Љregularization_losses
Ћ__call__
+Ќ&call_and_return_all_conditional_losses
'Ќ"call_and_return_conditional_losses"
_generic_user_object
х
trace_0
trace_1
trace_2
trace_32ђ
*__inference_sequential_layer_call_fn_13360
*__inference_sequential_layer_call_fn_14262
*__inference_sequential_layer_call_fn_14275
*__inference_sequential_layer_call_fn_13433П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0ztrace_1ztrace_2ztrace_3
б
trace_0
trace_1
trace_2
trace_32о
E__inference_sequential_layer_call_and_return_conditional_losses_14339
E__inference_sequential_layer_call_and_return_conditional_losses_14403
E__inference_sequential_layer_call_and_return_conditional_losses_13447
E__inference_sequential_layer_call_and_return_conditional_losses_13461П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0ztrace_1ztrace_2ztrace_3
 "
trackable_dict_wrapper

0
1
2
3
4
5
6
7
8
9
10
11"
trackable_list_wrapper
.
K0
L1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
B
2__inference_transformer_layer_2_layer_call_fn_1542inputs"Т
ЛВЗ
FullArgSpec
args
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
B
1__inference_transformer_layer_2_layer_call_fn_690inputs"Т
ЛВЗ
FullArgSpec
args
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
ЁB
M__inference_transformer_layer_2_layer_call_and_return_conditional_losses_5281inputs"Т
ЛВЗ
FullArgSpec
args
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
ЁB
M__inference_transformer_layer_2_layer_call_and_return_conditional_losses_1181inputs"Т
ЛВЗ
FullArgSpec
args
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs

jtraining%
kwonlydefaultsЊ

trainingp 
annotationsЊ *
 
`
0
1
2
3
4
5
6
7"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
З	variables
Иtrainable_variables
Йregularization_losses
Л__call__
+М&call_and_return_all_conditional_losses
'М"call_and_return_conditional_losses"
_generic_user_object
2
В
FullArgSpecx
argspm
jself
jquery
jvalue
jkey
jattention_mask
jreturn_attention_scores

jtraining
juse_causal_mask
varargs
 
varkw
 #
defaults

 

 
p 
p 
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
2
В
FullArgSpecx
argspm
jself
jquery
jvalue
jkey
jattention_mask
jreturn_attention_scores

jtraining
juse_causal_mask
varargs
 
varkw
 #
defaults

 

 
p 
p 
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 

	variables
trainable_variables
regularization_losses
	keras_api
__call__
+ &call_and_return_all_conditional_losses
Ёpartial_output_shape
Ђfull_output_shape
kernel
	bias
$Ѓ_self_saveable_object_factories"
_tf_keras_layer

Є	variables
Ѕtrainable_variables
Іregularization_losses
Ї	keras_api
Ј__call__
+Љ&call_and_return_all_conditional_losses
Њpartial_output_shape
Ћfull_output_shape
kernel
	bias
$Ќ_self_saveable_object_factories"
_tf_keras_layer

­	variables
Ўtrainable_variables
Џregularization_losses
А	keras_api
Б__call__
+В&call_and_return_all_conditional_losses
Гpartial_output_shape
Дfull_output_shape
kernel
	bias
$Е_self_saveable_object_factories"
_tf_keras_layer
б
Ж	variables
Зtrainable_variables
Иregularization_losses
Й	keras_api
К__call__
+Л&call_and_return_all_conditional_losses
$М_self_saveable_object_factories"
_tf_keras_layer
щ
Н	variables
Оtrainable_variables
Пregularization_losses
Р	keras_api
С__call__
+Т&call_and_return_all_conditional_losses
У_random_generator
$Ф_self_saveable_object_factories"
_tf_keras_layer

Х	variables
Цtrainable_variables
Чregularization_losses
Ш	keras_api
Щ__call__
+Ъ&call_and_return_all_conditional_losses
Ыpartial_output_shape
Ьfull_output_shape
kernel
	bias
$Э_self_saveable_object_factories"
_tf_keras_layer
 "
trackable_dict_wrapper
щ
Ю	variables
Яtrainable_variables
аregularization_losses
б	keras_api
в__call__
+г&call_and_return_all_conditional_losses
kernel
	bias
$д_self_saveable_object_factories"
_tf_keras_layer
щ
е	variables
жtrainable_variables
зregularization_losses
и	keras_api
й__call__
+к&call_and_return_all_conditional_losses
kernel
	bias
$л_self_saveable_object_factories"
_tf_keras_layer
@
0
1
2
3"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
мnon_trainable_variables
нlayers
оmetrics
 пlayer_regularization_losses
рlayer_metrics
Ц	variables
Чtrainable_variables
Шregularization_losses
Ъ__call__
+Ы&call_and_return_all_conditional_losses
'Ы"call_and_return_conditional_losses"
_generic_user_object
э
сtrace_0
тtrace_1
уtrace_2
фtrace_32њ
,__inference_sequential_1_layer_call_fn_13560
,__inference_sequential_1_layer_call_fn_14416
,__inference_sequential_1_layer_call_fn_14429
,__inference_sequential_1_layer_call_fn_13633П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zсtrace_0zтtrace_1zуtrace_2zфtrace_3
й
хtrace_0
цtrace_1
чtrace_2
шtrace_32ц
G__inference_sequential_1_layer_call_and_return_conditional_losses_14493
G__inference_sequential_1_layer_call_and_return_conditional_losses_14557
G__inference_sequential_1_layer_call_and_return_conditional_losses_13647
G__inference_sequential_1_layer_call_and_return_conditional_losses_13661П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zхtrace_0zцtrace_1zчtrace_2zшtrace_3
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
нBк
)__inference_flatten_1_layer_call_fn_13666inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
јBѕ
D__inference_flatten_1_layer_call_and_return_conditional_losses_13672inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
лBи
'__inference_dense_5_layer_call_fn_13681inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
B__inference_dense_5_layer_call_and_return_conditional_losses_13699inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
лBи
'__inference_dense_6_layer_call_fn_13708inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
B__inference_dense_6_layer_call_and_return_conditional_losses_13719inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
R
щ	variables
ъ	keras_api

ыtotal

ьcount"
_tf_keras_metric
c
э	variables
ю	keras_api

яtotal

№count
ё
_fn_kwargs"
_tf_keras_metric
.
g0
h1"
trackable_list_wrapper
(
В0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
g0
h1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
ђnon_trainable_variables
ѓlayers
єmetrics
 ѕlayer_regularization_losses
іlayer_metrics
щ	variables
ъtrainable_variables
ыregularization_losses
э__call__
+ю&call_and_return_all_conditional_losses
'ю"call_and_return_conditional_losses"
_generic_user_object
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_dict_wrapper
Д2БЎ
ЃВ
FullArgSpec'
args
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
<
i0
j1
k2
l3"
trackable_list_wrapper
(
К0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper

ї	variables
јtrainable_variables
љregularization_losses
њ	keras_api
ћ__call__
+ќ&call_and_return_all_conditional_losses

ikernel
jbias
$§_self_saveable_object_factories
!ў_jit_compiled_convolution_op"
_tf_keras_layer

џ	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses

kkernel
lbias
$_self_saveable_object_factories
!_jit_compiled_convolution_op"
_tf_keras_layer
<
i0
j1
k2
l3"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
ј	variables
љtrainable_variables
њregularization_losses
ќ__call__
+§&call_and_return_all_conditional_losses
'§"call_and_return_conditional_losses"
_generic_user_object
х
trace_0
trace_1
trace_2
trace_32ђ
*__inference_sequential_layer_call_fn_13772
*__inference_sequential_layer_call_fn_14570
*__inference_sequential_layer_call_fn_14583
*__inference_sequential_layer_call_fn_13845П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0ztrace_1ztrace_2ztrace_3
б
trace_0
trace_1
trace_2
trace_32о
E__inference_sequential_layer_call_and_return_conditional_losses_14601
E__inference_sequential_layer_call_and_return_conditional_losses_14619
E__inference_sequential_layer_call_and_return_conditional_losses_13859
E__inference_sequential_layer_call_and_return_conditional_losses_13873П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0ztrace_1ztrace_2ztrace_3
 "
trackable_dict_wrapper
<
m0
n1
o2
p3"
trackable_list_wrapper
(
Т0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper

	variables
trainable_variables
regularization_losses
	keras_api
__call__
+&call_and_return_all_conditional_losses

mkernel
nbias
$_self_saveable_object_factories
!_jit_compiled_convolution_op"
_tf_keras_layer

	variables
trainable_variables
regularization_losses
	keras_api
 __call__
+Ё&call_and_return_all_conditional_losses

okernel
pbias
$Ђ_self_saveable_object_factories
!Ѓ_jit_compiled_convolution_op"
_tf_keras_layer
<
m0
n1
o2
p3"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Єnon_trainable_variables
Ѕlayers
Іmetrics
 Їlayer_regularization_losses
Јlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
э
Љtrace_0
Њtrace_1
Ћtrace_2
Ќtrace_32њ
,__inference_sequential_1_layer_call_fn_13926
,__inference_sequential_1_layer_call_fn_14632
,__inference_sequential_1_layer_call_fn_14645
,__inference_sequential_1_layer_call_fn_13999П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЉtrace_0zЊtrace_1zЋtrace_2zЌtrace_3
й
­trace_0
Ўtrace_1
Џtrace_2
Аtrace_32ц
G__inference_sequential_1_layer_call_and_return_conditional_losses_14663
G__inference_sequential_1_layer_call_and_return_conditional_losses_14681
G__inference_sequential_1_layer_call_and_return_conditional_losses_14013
G__inference_sequential_1_layer_call_and_return_conditional_losses_14027П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 z­trace_0zЎtrace_1zЏtrace_2zАtrace_3
 "
trackable_dict_wrapper
<
q0
r1
s2
t3"
trackable_list_wrapper
(
Ъ0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper

Б	variables
Вtrainable_variables
Гregularization_losses
Д	keras_api
Е__call__
+Ж&call_and_return_all_conditional_losses

qkernel
rbias
$З_self_saveable_object_factories
!И_jit_compiled_convolution_op"
_tf_keras_layer

Й	variables
Кtrainable_variables
Лregularization_losses
М	keras_api
Н__call__
+О&call_and_return_all_conditional_losses

skernel
tbias
$П_self_saveable_object_factories
!Р_jit_compiled_convolution_op"
_tf_keras_layer
<
q0
r1
s2
t3"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Сnon_trainable_variables
Тlayers
Уmetrics
 Фlayer_regularization_losses
Хlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
э
Цtrace_0
Чtrace_1
Шtrace_2
Щtrace_32њ
,__inference_sequential_2_layer_call_fn_14080
,__inference_sequential_2_layer_call_fn_14694
,__inference_sequential_2_layer_call_fn_14707
,__inference_sequential_2_layer_call_fn_14153П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЦtrace_0zЧtrace_1zШtrace_2zЩtrace_3
й
Ъtrace_0
Ыtrace_1
Ьtrace_2
Эtrace_32ц
G__inference_sequential_2_layer_call_and_return_conditional_losses_14725
G__inference_sequential_2_layer_call_and_return_conditional_losses_14743
G__inference_sequential_2_layer_call_and_return_conditional_losses_14167
G__inference_sequential_2_layer_call_and_return_conditional_losses_14181П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЪtrace_0zЫtrace_1zЬtrace_2zЭtrace_3
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
сBо
-__inference_max_pooling3d_layer_call_fn_14186inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ќBљ
H__inference_max_pooling3d_layer_call_and_return_conditional_losses_14191inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
уBр
/__inference_max_pooling3d_1_layer_call_fn_14196inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ўBћ
J__inference_max_pooling3d_1_layer_call_and_return_conditional_losses_14201inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
уBр
/__inference_max_pooling3d_2_layer_call_fn_14206inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ўBћ
J__inference_max_pooling3d_2_layer_call_and_return_conditional_losses_14211inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
лBи
'__inference_flatten_layer_call_fn_14216inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
B__inference_flatten_layer_call_and_return_conditional_losses_14222inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
.
u0
v1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
йBж
%__inference_dense_layer_call_fn_14231inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
єBё
@__inference_dense_layer_call_and_return_conditional_losses_14249inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
'
w0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
X
x0
y1
z2
{3
|4
}5
~6
7"
trackable_list_wrapper
P
0
1
 2
Ё3
Ђ4
Ѓ5"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
x0
y1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Юnon_trainable_variables
Яlayers
аmetrics
 бlayer_regularization_losses
вlayer_metrics
Ш	variables
Щtrainable_variables
Ъregularization_losses
Ь__call__
+Э&call_and_return_all_conditional_losses
'Э"call_and_return_conditional_losses"
_generic_user_object
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
z0
{1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
гnon_trainable_variables
дlayers
еmetrics
 жlayer_regularization_losses
зlayer_metrics
б	variables
вtrainable_variables
гregularization_losses
е__call__
+ж&call_and_return_all_conditional_losses
'ж"call_and_return_conditional_losses"
_generic_user_object
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
|0
}1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
иnon_trainable_variables
йlayers
кmetrics
 лlayer_regularization_losses
мlayer_metrics
к	variables
лtrainable_variables
мregularization_losses
о__call__
+п&call_and_return_all_conditional_losses
'п"call_and_return_conditional_losses"
_generic_user_object
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
нnon_trainable_variables
оlayers
пmetrics
 рlayer_regularization_losses
сlayer_metrics
у	variables
фtrainable_variables
хregularization_losses
ч__call__
+ш&call_and_return_all_conditional_losses
'ш"call_and_return_conditional_losses"
_generic_user_object
Е2ВЏ
ІВЂ
FullArgSpec%
args
jself
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Е2ВЏ
ІВЂ
FullArgSpec%
args
jself
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
тnon_trainable_variables
уlayers
фmetrics
 хlayer_regularization_losses
цlayer_metrics
ъ	variables
ыtrainable_variables
ьregularization_losses
ю__call__
+я&call_and_return_all_conditional_losses
'я"call_and_return_conditional_losses"
_generic_user_object
Й2ЖГ
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Й2ЖГ
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
D
$ч_self_saveable_object_factories"
_generic_user_object
 "
trackable_dict_wrapper
.
~0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
шnon_trainable_variables
щlayers
ъmetrics
 ыlayer_regularization_losses
ьlayer_metrics
ђ	variables
ѓtrainable_variables
єregularization_losses
і__call__
+ї&call_and_return_all_conditional_losses
'ї"call_and_return_conditional_losses"
_generic_user_object
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
эnon_trainable_variables
юlayers
яmetrics
 №layer_regularization_losses
ёlayer_metrics
ћ	variables
ќtrainable_variables
§regularization_losses
џ__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
э
ђtrace_02Ю
'__inference_dense_1_layer_call_fn_14752Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zђtrace_0

ѓtrace_02щ
B__inference_dense_1_layer_call_and_return_conditional_losses_14790Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zѓtrace_0
 "
trackable_dict_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
єnon_trainable_variables
ѕlayers
іmetrics
 їlayer_regularization_losses
јlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
э
љtrace_02Ю
'__inference_dense_2_layer_call_fn_14799Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zљtrace_0

њtrace_02щ
B__inference_dense_2_layer_call_and_return_conditional_losses_14829Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zњtrace_0
 "
trackable_dict_wrapper
@
0
1
2
3"
trackable_list_wrapper
0
Ѕ0
І1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
Bџ
*__inference_sequential_layer_call_fn_13360dense_1_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ћBј
*__inference_sequential_layer_call_fn_14262inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ћBј
*__inference_sequential_layer_call_fn_14275inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Bџ
*__inference_sequential_layer_call_fn_13433dense_1_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
E__inference_sequential_layer_call_and_return_conditional_losses_14339inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
E__inference_sequential_layer_call_and_return_conditional_losses_14403inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
E__inference_sequential_layer_call_and_return_conditional_losses_13447dense_1_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
E__inference_sequential_layer_call_and_return_conditional_losses_13461dense_1_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
`
0
1
2
3
4
5
6
7"
trackable_list_wrapper
P
Н0
О1
П2
Р3
С4
Т5"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
ћnon_trainable_variables
ќlayers
§metrics
 ўlayer_regularization_losses
џlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+ &call_and_return_all_conditional_losses
' "call_and_return_conditional_losses"
_generic_user_object
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Є	variables
Ѕtrainable_variables
Іregularization_losses
Ј__call__
+Љ&call_and_return_all_conditional_losses
'Љ"call_and_return_conditional_losses"
_generic_user_object
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
­	variables
Ўtrainable_variables
Џregularization_losses
Б__call__
+В&call_and_return_all_conditional_losses
'В"call_and_return_conditional_losses"
_generic_user_object
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Ж	variables
Зtrainable_variables
Иregularization_losses
К__call__
+Л&call_and_return_all_conditional_losses
'Л"call_and_return_conditional_losses"
_generic_user_object
Е2ВЏ
ІВЂ
FullArgSpec%
args
jself
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Е2ВЏ
ІВЂ
FullArgSpec%
args
jself
jinputs
jmask
varargs
 
varkw
 
defaultsЂ

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Н	variables
Оtrainable_variables
Пregularization_losses
С__call__
+Т&call_and_return_all_conditional_losses
'Т"call_and_return_conditional_losses"
_generic_user_object
Й2ЖГ
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Й2ЖГ
ЊВІ
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
D
$_self_saveable_object_factories"
_generic_user_object
 "
trackable_dict_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Х	variables
Цtrainable_variables
Чregularization_losses
Щ__call__
+Ъ&call_and_return_all_conditional_losses
'Ъ"call_and_return_conditional_losses"
_generic_user_object
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Ј2ЅЂ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
non_trainable_variables
layers
metrics
 layer_regularization_losses
layer_metrics
Ю	variables
Яtrainable_variables
аregularization_losses
в__call__
+г&call_and_return_all_conditional_losses
'г"call_and_return_conditional_losses"
_generic_user_object
э
trace_02Ю
'__inference_dense_3_layer_call_fn_14838Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 ztrace_0

 trace_02щ
B__inference_dense_3_layer_call_and_return_conditional_losses_14876Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 z trace_0
 "
trackable_dict_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Ёnon_trainable_variables
Ђlayers
Ѓmetrics
 Єlayer_regularization_losses
Ѕlayer_metrics
е	variables
жtrainable_variables
зregularization_losses
й__call__
+к&call_and_return_all_conditional_losses
'к"call_and_return_conditional_losses"
_generic_user_object
э
Іtrace_02Ю
'__inference_dense_4_layer_call_fn_14885Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zІtrace_0

Їtrace_02щ
B__inference_dense_4_layer_call_and_return_conditional_losses_14915Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЇtrace_0
 "
trackable_dict_wrapper
@
0
1
2
3"
trackable_list_wrapper
0
Ф0
Х1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
B
,__inference_sequential_1_layer_call_fn_13560dense_3_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
§Bњ
,__inference_sequential_1_layer_call_fn_14416inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
§Bњ
,__inference_sequential_1_layer_call_fn_14429inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
,__inference_sequential_1_layer_call_fn_13633dense_3_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
G__inference_sequential_1_layer_call_and_return_conditional_losses_14493inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
G__inference_sequential_1_layer_call_and_return_conditional_losses_14557inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
G__inference_sequential_1_layer_call_and_return_conditional_losses_13647dense_3_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
G__inference_sequential_1_layer_call_and_return_conditional_losses_13661dense_3_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
0
ы0
ь1"
trackable_list_wrapper
.
щ	variables"
_generic_user_object
:  (2total
:  (2count
0
я0
№1"
trackable_list_wrapper
.
э	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
.
g0
h1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
i0
j1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Јnon_trainable_variables
Љlayers
Њmetrics
 Ћlayer_regularization_losses
Ќlayer_metrics
ї	variables
јtrainable_variables
љregularization_losses
ћ__call__
+ќ&call_and_return_all_conditional_losses
'ќ"call_and_return_conditional_losses"
_generic_user_object
ь
­trace_02Э
&__inference_conv3d_layer_call_fn_14924Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 z­trace_0

Ўtrace_02ш
A__inference_conv3d_layer_call_and_return_conditional_losses_14935Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЎtrace_0
 "
trackable_dict_wrapper
Д2БЎ
ЃВ
FullArgSpec'
args
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
.
k0
l1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Џnon_trainable_variables
Аlayers
Бmetrics
 Вlayer_regularization_losses
Гlayer_metrics
џ	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
ю
Дtrace_02Я
(__inference_conv3d_1_layer_call_fn_14944Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zДtrace_0

Еtrace_02ъ
C__inference_conv3d_1_layer_call_and_return_conditional_losses_14955Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЕtrace_0
 "
trackable_dict_wrapper
Д2БЎ
ЃВ
FullArgSpec'
args
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
<
i0
j1
k2
l3"
trackable_list_wrapper
0
і0
ї1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
Bў
*__inference_sequential_layer_call_fn_13772conv3d_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ћBј
*__inference_sequential_layer_call_fn_14570inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ћBј
*__inference_sequential_layer_call_fn_14583inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
Bў
*__inference_sequential_layer_call_fn_13845conv3d_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
E__inference_sequential_layer_call_and_return_conditional_losses_14601inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
E__inference_sequential_layer_call_and_return_conditional_losses_14619inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
E__inference_sequential_layer_call_and_return_conditional_losses_13859conv3d_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
E__inference_sequential_layer_call_and_return_conditional_losses_13873conv3d_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
.
m0
n1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Жnon_trainable_variables
Зlayers
Иmetrics
 Йlayer_regularization_losses
Кlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
+&call_and_return_all_conditional_losses
'"call_and_return_conditional_losses"
_generic_user_object
ю
Лtrace_02Я
(__inference_conv3d_2_layer_call_fn_14964Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЛtrace_0

Мtrace_02ъ
C__inference_conv3d_2_layer_call_and_return_conditional_losses_14975Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zМtrace_0
 "
trackable_dict_wrapper
Д2БЎ
ЃВ
FullArgSpec'
args
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
.
o0
p1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Нnon_trainable_variables
Оlayers
Пmetrics
 Рlayer_regularization_losses
Сlayer_metrics
	variables
trainable_variables
regularization_losses
 __call__
+Ё&call_and_return_all_conditional_losses
'Ё"call_and_return_conditional_losses"
_generic_user_object
ю
Тtrace_02Я
(__inference_conv3d_3_layer_call_fn_14984Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zТtrace_0

Уtrace_02ъ
C__inference_conv3d_3_layer_call_and_return_conditional_losses_14995Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zУtrace_0
 "
trackable_dict_wrapper
Д2БЎ
ЃВ
FullArgSpec'
args
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
<
m0
n1
o2
p3"
trackable_list_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
B
,__inference_sequential_1_layer_call_fn_13926conv3d_2_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
§Bњ
,__inference_sequential_1_layer_call_fn_14632inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
§Bњ
,__inference_sequential_1_layer_call_fn_14645inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
,__inference_sequential_1_layer_call_fn_13999conv3d_2_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
G__inference_sequential_1_layer_call_and_return_conditional_losses_14663inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
G__inference_sequential_1_layer_call_and_return_conditional_losses_14681inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 B
G__inference_sequential_1_layer_call_and_return_conditional_losses_14013conv3d_2_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 B
G__inference_sequential_1_layer_call_and_return_conditional_losses_14027conv3d_2_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
.
q0
r1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Фnon_trainable_variables
Хlayers
Цmetrics
 Чlayer_regularization_losses
Шlayer_metrics
Б	variables
Вtrainable_variables
Гregularization_losses
Е__call__
+Ж&call_and_return_all_conditional_losses
'Ж"call_and_return_conditional_losses"
_generic_user_object
ю
Щtrace_02Я
(__inference_conv3d_4_layer_call_fn_15004Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЩtrace_0

Ъtrace_02ъ
C__inference_conv3d_4_layer_call_and_return_conditional_losses_15015Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zЪtrace_0
 "
trackable_dict_wrapper
Д2БЎ
ЃВ
FullArgSpec'
args
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
.
s0
t1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
И
Ыnon_trainable_variables
Ьlayers
Эmetrics
 Юlayer_regularization_losses
Яlayer_metrics
Й	variables
Кtrainable_variables
Лregularization_losses
Н__call__
+О&call_and_return_all_conditional_losses
'О"call_and_return_conditional_losses"
_generic_user_object
ю
аtrace_02Я
(__inference_conv3d_5_layer_call_fn_15024Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zаtrace_0

бtrace_02ъ
C__inference_conv3d_5_layer_call_and_return_conditional_losses_15035Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 zбtrace_0
 "
trackable_dict_wrapper
Д2БЎ
ЃВ
FullArgSpec'
args
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 0
<
q0
r1
s2
t3"
trackable_list_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
B
,__inference_sequential_2_layer_call_fn_14080conv3d_4_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
§Bњ
,__inference_sequential_2_layer_call_fn_14694inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
§Bњ
,__inference_sequential_2_layer_call_fn_14707inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
,__inference_sequential_2_layer_call_fn_14153conv3d_4_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
G__inference_sequential_2_layer_call_and_return_conditional_losses_14725inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
B
G__inference_sequential_2_layer_call_and_return_conditional_losses_14743inputs"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 B
G__inference_sequential_2_layer_call_and_return_conditional_losses_14167conv3d_4_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
 B
G__inference_sequential_2_layer_call_and_return_conditional_losses_14181conv3d_4_input"П
ЖВВ
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
.
x0
y1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
z0
{1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
|0
}1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_dict_wrapper
.
~0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
лBи
'__inference_dense_1_layer_call_fn_14752inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
B__inference_dense_1_layer_call_and_return_conditional_losses_14790inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
лBи
'__inference_dense_2_layer_call_fn_14799inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
B__inference_dense_2_layer_call_and_return_conditional_losses_14829inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_dict_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
лBи
'__inference_dense_3_layer_call_fn_14838inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
B__inference_dense_3_layer_call_and_return_conditional_losses_14876inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
0
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
лBи
'__inference_dense_4_layer_call_fn_14885inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
іBѓ
B__inference_dense_4_layer_call_and_return_conditional_losses_14915inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
.
i0
j1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
кBз
&__inference_conv3d_layer_call_fn_14924inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
ѕBђ
A__inference_conv3d_layer_call_and_return_conditional_losses_14935inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
.
k0
l1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
мBй
(__inference_conv3d_1_layer_call_fn_14944inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
їBє
C__inference_conv3d_1_layer_call_and_return_conditional_losses_14955inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
.
m0
n1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
мBй
(__inference_conv3d_2_layer_call_fn_14964inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
їBє
C__inference_conv3d_2_layer_call_and_return_conditional_losses_14975inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
.
o0
p1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
мBй
(__inference_conv3d_3_layer_call_fn_14984inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
їBє
C__inference_conv3d_3_layer_call_and_return_conditional_losses_14995inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
.
q0
r1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
мBй
(__inference_conv3d_4_layer_call_fn_15004inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
їBє
C__inference_conv3d_4_layer_call_and_return_conditional_losses_15015inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
.
s0
t1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
мBй
(__inference_conv3d_5_layer_call_fn_15024inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
їBє
C__inference_conv3d_5_layer_call_and_return_conditional_losses_15035inputs"Ђ
В
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsЊ *
 
':%
2Adam/dense_5/kernel/m
 :2Adam/dense_5/bias/m
&:$	2Adam/dense_6/kernel/m
:2Adam/dense_6/bias/m
N:L22Adam/encoder3d/spatial_attention/conv3d_6/kernel/m
<::20Adam/encoder3d/spatial_attention/conv3d_6/bias/m
0:. 2Adam/conv3d/kernel/m
: 2Adam/conv3d/bias/m
2:0  2Adam/conv3d_1/kernel/m
 : 2Adam/conv3d_1/bias/m
2:0 @2Adam/conv3d_2/kernel/m
 :@2Adam/conv3d_2/bias/m
2:0@@2Adam/conv3d_3/kernel/m
 :@2Adam/conv3d_3/bias/m
3:1@2Adam/conv3d_4/kernel/m
!:2Adam/conv3d_4/bias/m
4:22Adam/conv3d_5/kernel/m
!:2Adam/conv3d_5/bias/m
1:/	@2 Adam/time_distributed_1/kernel/m
*:(@2Adam/time_distributed_1/bias/m
D:B@24Adam/frame_position_embedding/embedding/embeddings/m
P:N@@2<Adam/transformer_layer_1/multi_head_attention/query/kernel/m
J:H@2:Adam/transformer_layer_1/multi_head_attention/query/bias/m
N:L@@2:Adam/transformer_layer_1/multi_head_attention/key/kernel/m
H:F@28Adam/transformer_layer_1/multi_head_attention/key/bias/m
P:N@@2<Adam/transformer_layer_1/multi_head_attention/value/kernel/m
J:H@2:Adam/transformer_layer_1/multi_head_attention/value/bias/m
[:Y@@2GAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/m
Q:O@2EAdam/transformer_layer_1/multi_head_attention/attention_output/bias/m
&:$	@2Adam/dense_1/kernel/m
 :2Adam/dense_1/bias/m
&:$	@2Adam/dense_2/kernel/m
:@2Adam/dense_2/bias/m
R:P@@2>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/m
L:J@2<Adam/transformer_layer_2/multi_head_attention_1/query/bias/m
P:N@@2<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/m
J:H@2:Adam/transformer_layer_2/multi_head_attention_1/key/bias/m
R:P@@2>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/m
L:J@2<Adam/transformer_layer_2/multi_head_attention_1/value/bias/m
]:[@@2IAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/m
S:Q@2GAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/m
&:$	@2Adam/dense_3/kernel/m
 :2Adam/dense_3/bias/m
&:$	@2Adam/dense_4/kernel/m
:@2Adam/dense_4/bias/m
':%
2Adam/dense_5/kernel/v
 :2Adam/dense_5/bias/v
&:$	2Adam/dense_6/kernel/v
:2Adam/dense_6/bias/v
N:L22Adam/encoder3d/spatial_attention/conv3d_6/kernel/v
<::20Adam/encoder3d/spatial_attention/conv3d_6/bias/v
0:. 2Adam/conv3d/kernel/v
: 2Adam/conv3d/bias/v
2:0  2Adam/conv3d_1/kernel/v
 : 2Adam/conv3d_1/bias/v
2:0 @2Adam/conv3d_2/kernel/v
 :@2Adam/conv3d_2/bias/v
2:0@@2Adam/conv3d_3/kernel/v
 :@2Adam/conv3d_3/bias/v
3:1@2Adam/conv3d_4/kernel/v
!:2Adam/conv3d_4/bias/v
4:22Adam/conv3d_5/kernel/v
!:2Adam/conv3d_5/bias/v
1:/	@2 Adam/time_distributed_1/kernel/v
*:(@2Adam/time_distributed_1/bias/v
D:B@24Adam/frame_position_embedding/embedding/embeddings/v
P:N@@2<Adam/transformer_layer_1/multi_head_attention/query/kernel/v
J:H@2:Adam/transformer_layer_1/multi_head_attention/query/bias/v
N:L@@2:Adam/transformer_layer_1/multi_head_attention/key/kernel/v
H:F@28Adam/transformer_layer_1/multi_head_attention/key/bias/v
P:N@@2<Adam/transformer_layer_1/multi_head_attention/value/kernel/v
J:H@2:Adam/transformer_layer_1/multi_head_attention/value/bias/v
[:Y@@2GAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/v
Q:O@2EAdam/transformer_layer_1/multi_head_attention/attention_output/bias/v
&:$	@2Adam/dense_1/kernel/v
 :2Adam/dense_1/bias/v
&:$	@2Adam/dense_2/kernel/v
:@2Adam/dense_2/bias/v
R:P@@2>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/v
L:J@2<Adam/transformer_layer_2/multi_head_attention_1/query/bias/v
P:N@@2<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/v
J:H@2:Adam/transformer_layer_2/multi_head_attention_1/key/bias/v
R:P@@2>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/v
L:J@2<Adam/transformer_layer_2/multi_head_attention_1/value/bias/v
]:[@@2IAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/v
S:Q@2GAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/v
&:$	@2Adam/dense_3/kernel/v
 :2Adam/dense_3/bias/v
&:$	@2Adam/dense_4/kernel/v
:@2Adam/dense_4/bias/vе
 __inference__wrapped_model_11427А=ghijklmnopqrstuvwxyz{|}~[\de<Ђ9
2Ђ/
-*
input_1џџџџџџџџџ  
Њ "1Њ.
,
dense_6!
dense_6џџџџџџџџџЛ
C__inference_conv3d_1_layer_call_and_return_conditional_losses_14955tkl;Ђ8
1Ђ.
,)
inputsџџџџџџџџџ   
Њ "1Ђ.
'$
0џџџџџџџџџ   
 
(__inference_conv3d_1_layer_call_fn_14944gkl;Ђ8
1Ђ.
,)
inputsџџџџџџџџџ   
Њ "$!џџџџџџџџџ   Л
C__inference_conv3d_2_layer_call_and_return_conditional_losses_14975tmn;Ђ8
1Ђ.
,)
inputsџџџџџџџџџ 
Њ "1Ђ.
'$
0џџџџџџџџџ@
 
(__inference_conv3d_2_layer_call_fn_14964gmn;Ђ8
1Ђ.
,)
inputsџџџџџџџџџ 
Њ "$!џџџџџџџџџ@Л
C__inference_conv3d_3_layer_call_and_return_conditional_losses_14995top;Ђ8
1Ђ.
,)
inputsџџџџџџџџџ@
Њ "1Ђ.
'$
0џџџџџџџџџ@
 
(__inference_conv3d_3_layer_call_fn_14984gop;Ђ8
1Ђ.
,)
inputsџџџџџџџџџ@
Њ "$!џџџџџџџџџ@М
C__inference_conv3d_4_layer_call_and_return_conditional_losses_15015uqr;Ђ8
1Ђ.
,)
inputsџџџџџџџџџ@
Њ "2Ђ/
(%
0џџџџџџџџџ
 
(__inference_conv3d_4_layer_call_fn_15004hqr;Ђ8
1Ђ.
,)
inputsџџџџџџџџџ@
Њ "%"џџџџџџџџџН
C__inference_conv3d_5_layer_call_and_return_conditional_losses_15035vst<Ђ9
2Ђ/
-*
inputsџџџџџџџџџ
Њ "2Ђ/
(%
0џџџџџџџџџ
 
(__inference_conv3d_5_layer_call_fn_15024ist<Ђ9
2Ђ/
-*
inputsџџџџџџџџџ
Њ "%"џџџџџџџџџЙ
A__inference_conv3d_layer_call_and_return_conditional_losses_14935tij;Ђ8
1Ђ.
,)
inputsџџџџџџџџџ  
Њ "1Ђ.
'$
0џџџџџџџџџ   
 
&__inference_conv3d_layer_call_fn_14924gij;Ђ8
1Ђ.
,)
inputsџџџџџџџџџ  
Њ "$!џџџџџџџџџ   ­
B__inference_dense_1_layer_call_and_return_conditional_losses_14790g3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ@
Њ "*Ђ'
 
0џџџџџџџџџ
 
'__inference_dense_1_layer_call_fn_14752Z3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ@
Њ "џџџџџџџџџ­
B__inference_dense_2_layer_call_and_return_conditional_losses_14829g4Ђ1
*Ђ'
%"
inputsџџџџџџџџџ
Њ ")Ђ&

0џџџџџџџџџ@
 
'__inference_dense_2_layer_call_fn_14799Z4Ђ1
*Ђ'
%"
inputsџџџџџџџџџ
Њ "џџџџџџџџџ@­
B__inference_dense_3_layer_call_and_return_conditional_losses_14876g3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ@
Њ "*Ђ'
 
0џџџџџџџџџ
 
'__inference_dense_3_layer_call_fn_14838Z3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ@
Њ "џџџџџџџџџ­
B__inference_dense_4_layer_call_and_return_conditional_losses_14915g4Ђ1
*Ђ'
%"
inputsџџџџџџџџџ
Њ ")Ђ&

0џџџџџџџџџ@
 
'__inference_dense_4_layer_call_fn_14885Z4Ђ1
*Ђ'
%"
inputsџџџџџџџџџ
Њ "џџџџџџџџџ@Є
B__inference_dense_5_layer_call_and_return_conditional_losses_13699^[\0Ђ-
&Ђ#
!
inputsџџџџџџџџџ
Њ "&Ђ#

0џџџџџџџџџ
 |
'__inference_dense_5_layer_call_fn_13681Q[\0Ђ-
&Ђ#
!
inputsџџџџџџџџџ
Њ "џџџџџџџџџЃ
B__inference_dense_6_layer_call_and_return_conditional_losses_13719]de0Ђ-
&Ђ#
!
inputsџџџџџџџџџ
Њ "%Ђ"

0џџџџџџџџџ
 {
'__inference_dense_6_layer_call_fn_13708Pde0Ђ-
&Ђ#
!
inputsџџџџџџџџџ
Њ "џџџџџџџџџЁ
@__inference_dense_layer_call_and_return_conditional_losses_14249]uv0Ђ-
&Ђ#
!
inputsџџџџџџџџџ
Њ "%Ђ"

0џџџџџџџџџ@
 y
%__inference_dense_layer_call_fn_14231Puv0Ђ-
&Ђ#
!
inputsџџџџџџџџџ
Њ "џџџџџџџџџ@й
C__inference_encoder3d_layer_call_and_return_conditional_losses_2972ghijklmnopqrstKЂH
1Ђ.
,)
inputsџџџџџџџџџ  
Њ

trainingp "2Ђ/
(%
0џџџџџџџџџ
 и
B__inference_encoder3d_layer_call_and_return_conditional_losses_578ghijklmnopqrstKЂH
1Ђ.
,)
inputsџџџџџџџџџ  
Њ

trainingp"2Ђ/
(%
0џџџџџџџџџ
 Б
(__inference_encoder3d_layer_call_fn_3895ghijklmnopqrstKЂH
1Ђ.
,)
inputsџџџџџџџџџ  
Њ

trainingp"%"џџџџџџџџџА
'__inference_encoder3d_layer_call_fn_837ghijklmnopqrstKЂH
1Ђ.
,)
inputsџџџџџџџџџ  
Њ

trainingp "%"џџџџџџџџџЅ
D__inference_flatten_1_layer_call_and_return_conditional_losses_13672]3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ@
Њ "&Ђ#

0џџџџџџџџџ
 }
)__inference_flatten_1_layer_call_fn_13666P3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ@
Њ "џџџџџџџџџЈ
B__inference_flatten_layer_call_and_return_conditional_losses_14222b8Ђ5
.Ђ+
)&
inputsџџџџџџџџџ
Њ "&Ђ#

0џџџџџџџџџ
 
'__inference_flatten_layer_call_fn_14216U8Ђ5
.Ђ+
)&
inputsџџџџџџџџџ
Њ "џџџџџџџџџЙ
R__inference_frame_position_embedding_layer_call_and_return_conditional_losses_3199cw3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ@
Њ ")Ђ&

0џџџџџџџџџ@
 
7__inference_frame_position_embedding_layer_call_fn_2248Vw3Ђ0
)Ђ&
$!
inputsџџџџџџџџџ@
Њ "џџџџџџџџџ@
J__inference_max_pooling3d_1_layer_call_and_return_conditional_losses_14201И_Ђ\
UЂR
PM
inputsAџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "UЂR
KH
0Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 п
/__inference_max_pooling3d_1_layer_call_fn_14196Ћ_Ђ\
UЂR
PM
inputsAџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "HEAџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
J__inference_max_pooling3d_2_layer_call_and_return_conditional_losses_14211И_Ђ\
UЂR
PM
inputsAџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "UЂR
KH
0Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 п
/__inference_max_pooling3d_2_layer_call_fn_14206Ћ_Ђ\
UЂR
PM
inputsAџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "HEAџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
H__inference_max_pooling3d_layer_call_and_return_conditional_losses_14191И_Ђ\
UЂR
PM
inputsAџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "UЂR
KH
0Aџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
 н
-__inference_max_pooling3d_layer_call_fn_14186Ћ_Ђ\
UЂR
PM
inputsAџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџ
Њ "HEAџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџџё
@__inference_model_layer_call_and_return_conditional_losses_12431Ќ=ghijklmnopqrstuvwxyz{|}~[\deDЂA
:Ђ7
-*
input_1џџџџџџџџџ  
p 

 
Њ "%Ђ"

0џџџџџџџџџ
 ё
@__inference_model_layer_call_and_return_conditional_losses_12538Ќ=ghijklmnopqrstuvwxyz{|}~[\deDЂA
:Ђ7
-*
input_1џџџџџџџџџ  
p

 
Њ "%Ђ"

0џџџџџџџџџ
 №
@__inference_model_layer_call_and_return_conditional_losses_12968Ћ=ghijklmnopqrstuvwxyz{|}~[\deCЂ@
9Ђ6
,)
inputsџџџџџџџџџ  
p 

 
Њ "%Ђ"

0џџџџџџџџџ
 №
@__inference_model_layer_call_and_return_conditional_losses_13105Ћ=ghijklmnopqrstuvwxyz{|}~[\deCЂ@
9Ђ6
,)
inputsџџџџџџџџџ  
p

 
Њ "%Ђ"

0џџџџџџџџџ
 Щ
%__inference_model_layer_call_fn_11815=ghijklmnopqrstuvwxyz{|}~[\deDЂA
:Ђ7
-*
input_1џџџџџџџџџ  
p 

 
Њ "џџџџџџџџџЩ
%__inference_model_layer_call_fn_12324=ghijklmnopqrstuvwxyz{|}~[\deDЂA
:Ђ7
-*
input_1џџџџџџџџџ  
p

 
Њ "џџџџџџџџџШ
%__inference_model_layer_call_fn_12736=ghijklmnopqrstuvwxyz{|}~[\deCЂ@
9Ђ6
,)
inputsџџџџџџџџџ  
p 

 
Њ "џџџџџџџџџШ
%__inference_model_layer_call_fn_12831=ghijklmnopqrstuvwxyz{|}~[\deCЂ@
9Ђ6
,)
inputsџџџџџџџџџ  
p

 
Њ "џџџџџџџџџФ
G__inference_sequential_1_layer_call_and_return_conditional_losses_13647yBЂ?
8Ђ5
+(
dense_3_inputџџџџџџџџџ@
p 

 
Њ ")Ђ&

0џџџџџџџџџ@
 Ф
G__inference_sequential_1_layer_call_and_return_conditional_losses_13661yBЂ?
8Ђ5
+(
dense_3_inputџџџџџџџџџ@
p

 
Њ ")Ђ&

0џџџџџџџџџ@
 в
G__inference_sequential_1_layer_call_and_return_conditional_losses_14013mnopKЂH
AЂ>
41
conv3d_2_inputџџџџџџџџџ 
p 

 
Њ "1Ђ.
'$
0џџџџџџџџџ@
 в
G__inference_sequential_1_layer_call_and_return_conditional_losses_14027mnopKЂH
AЂ>
41
conv3d_2_inputџџџџџџџџџ 
p

 
Њ "1Ђ.
'$
0џџџџџџџџџ@
 Н
G__inference_sequential_1_layer_call_and_return_conditional_losses_14493r;Ђ8
1Ђ.
$!
inputsџџџџџџџџџ@
p 

 
Њ ")Ђ&

0џџџџџџџџџ@
 Н
G__inference_sequential_1_layer_call_and_return_conditional_losses_14557r;Ђ8
1Ђ.
$!
inputsџџџџџџџџџ@
p

 
Њ ")Ђ&

0џџџџџџџџџ@
 Щ
G__inference_sequential_1_layer_call_and_return_conditional_losses_14663~mnopCЂ@
9Ђ6
,)
inputsџџџџџџџџџ 
p 

 
Њ "1Ђ.
'$
0џџџџџџџџџ@
 Щ
G__inference_sequential_1_layer_call_and_return_conditional_losses_14681~mnopCЂ@
9Ђ6
,)
inputsџџџџџџџџџ 
p

 
Њ "1Ђ.
'$
0џџџџџџџџџ@
 
,__inference_sequential_1_layer_call_fn_13560lBЂ?
8Ђ5
+(
dense_3_inputџџџџџџџџџ@
p 

 
Њ "џџџџџџџџџ@
,__inference_sequential_1_layer_call_fn_13633lBЂ?
8Ђ5
+(
dense_3_inputџџџџџџџџџ@
p

 
Њ "џџџџџџџџџ@Љ
,__inference_sequential_1_layer_call_fn_13926ymnopKЂH
AЂ>
41
conv3d_2_inputџџџџџџџџџ 
p 

 
Њ "$!џџџџџџџџџ@Љ
,__inference_sequential_1_layer_call_fn_13999ymnopKЂH
AЂ>
41
conv3d_2_inputџџџџџџџџџ 
p

 
Њ "$!џџџџџџџџџ@
,__inference_sequential_1_layer_call_fn_14416e;Ђ8
1Ђ.
$!
inputsџџџџџџџџџ@
p 

 
Њ "џџџџџџџџџ@
,__inference_sequential_1_layer_call_fn_14429e;Ђ8
1Ђ.
$!
inputsџџџџџџџџџ@
p

 
Њ "џџџџџџџџџ@Ё
,__inference_sequential_1_layer_call_fn_14632qmnopCЂ@
9Ђ6
,)
inputsџџџџџџџџџ 
p 

 
Њ "$!џџџџџџџџџ@Ё
,__inference_sequential_1_layer_call_fn_14645qmnopCЂ@
9Ђ6
,)
inputsџџџџџџџџџ 
p

 
Њ "$!џџџџџџџџџ@г
G__inference_sequential_2_layer_call_and_return_conditional_losses_14167qrstKЂH
AЂ>
41
conv3d_4_inputџџџџџџџџџ@
p 

 
Њ "2Ђ/
(%
0џџџџџџџџџ
 г
G__inference_sequential_2_layer_call_and_return_conditional_losses_14181qrstKЂH
AЂ>
41
conv3d_4_inputџџџџџџџџџ@
p

 
Њ "2Ђ/
(%
0џџџџџџџџџ
 Ъ
G__inference_sequential_2_layer_call_and_return_conditional_losses_14725qrstCЂ@
9Ђ6
,)
inputsџџџџџџџџџ@
p 

 
Њ "2Ђ/
(%
0џџџџџџџџџ
 Ъ
G__inference_sequential_2_layer_call_and_return_conditional_losses_14743qrstCЂ@
9Ђ6
,)
inputsџџџџџџџџџ@
p

 
Њ "2Ђ/
(%
0џџџџџџџџџ
 Њ
,__inference_sequential_2_layer_call_fn_14080zqrstKЂH
AЂ>
41
conv3d_4_inputџџџџџџџџџ@
p 

 
Њ "%"џџџџџџџџџЊ
,__inference_sequential_2_layer_call_fn_14153zqrstKЂH
AЂ>
41
conv3d_4_inputџџџџџџџџџ@
p

 
Њ "%"џџџџџџџџџЂ
,__inference_sequential_2_layer_call_fn_14694rqrstCЂ@
9Ђ6
,)
inputsџџџџџџџџџ@
p 

 
Њ "%"џџџџџџџџџЂ
,__inference_sequential_2_layer_call_fn_14707rqrstCЂ@
9Ђ6
,)
inputsџџџџџџџџџ@
p

 
Њ "%"џџџџџџџџџТ
E__inference_sequential_layer_call_and_return_conditional_losses_13447yBЂ?
8Ђ5
+(
dense_1_inputџџџџџџџџџ@
p 

 
Њ ")Ђ&

0џџџџџџџџџ@
 Т
E__inference_sequential_layer_call_and_return_conditional_losses_13461yBЂ?
8Ђ5
+(
dense_1_inputџџџџџџџџџ@
p

 
Њ ")Ђ&

0џџџџџџџџџ@
 Ю
E__inference_sequential_layer_call_and_return_conditional_losses_13859ijklIЂF
?Ђ<
2/
conv3d_inputџџџџџџџџџ  
p 

 
Њ "1Ђ.
'$
0џџџџџџџџџ   
 Ю
E__inference_sequential_layer_call_and_return_conditional_losses_13873ijklIЂF
?Ђ<
2/
conv3d_inputџџџџџџџџџ  
p

 
Њ "1Ђ.
'$
0џџџџџџџџџ   
 Л
E__inference_sequential_layer_call_and_return_conditional_losses_14339r;Ђ8
1Ђ.
$!
inputsџџџџџџџџџ@
p 

 
Њ ")Ђ&

0џџџџџџџџџ@
 Л
E__inference_sequential_layer_call_and_return_conditional_losses_14403r;Ђ8
1Ђ.
$!
inputsџџџџџџџџџ@
p

 
Њ ")Ђ&

0џџџџџџџџџ@
 Ч
E__inference_sequential_layer_call_and_return_conditional_losses_14601~ijklCЂ@
9Ђ6
,)
inputsџџџџџџџџџ  
p 

 
Њ "1Ђ.
'$
0џџџџџџџџџ   
 Ч
E__inference_sequential_layer_call_and_return_conditional_losses_14619~ijklCЂ@
9Ђ6
,)
inputsџџџџџџџџџ  
p

 
Њ "1Ђ.
'$
0џџџџџџџџџ   
 
*__inference_sequential_layer_call_fn_13360lBЂ?
8Ђ5
+(
dense_1_inputџџџџџџџџџ@
p 

 
Њ "џџџџџџџџџ@
*__inference_sequential_layer_call_fn_13433lBЂ?
8Ђ5
+(
dense_1_inputџџџџџџџџџ@
p

 
Њ "џџџџџџџџџ@Ѕ
*__inference_sequential_layer_call_fn_13772wijklIЂF
?Ђ<
2/
conv3d_inputџџџџџџџџџ  
p 

 
Њ "$!џџџџџџџџџ   Ѕ
*__inference_sequential_layer_call_fn_13845wijklIЂF
?Ђ<
2/
conv3d_inputџџџџџџџџџ  
p

 
Њ "$!џџџџџџџџџ   
*__inference_sequential_layer_call_fn_14262e;Ђ8
1Ђ.
$!
inputsџџџџџџџџџ@
p 

 
Њ "џџџџџџџџџ@
*__inference_sequential_layer_call_fn_14275e;Ђ8
1Ђ.
$!
inputsџџџџџџџџџ@
p

 
Њ "џџџџџџџџџ@
*__inference_sequential_layer_call_fn_14570qijklCЂ@
9Ђ6
,)
inputsџџџџџџџџџ  
p 

 
Њ "$!џџџџџџџџџ   
*__inference_sequential_layer_call_fn_14583qijklCЂ@
9Ђ6
,)
inputsџџџџџџџџџ  
p

 
Њ "$!џџџџџџџџџ   у
#__inference_signature_wrapper_12641Л=ghijklmnopqrstuvwxyz{|}~[\deGЂD
Ђ 
=Њ:
8
input_1-*
input_1џџџџџџџџџ  "1Њ.
,
dense_6!
dense_6џџџџџџџџџа
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_13232uvEЂB
;Ђ8
.+
inputsџџџџџџџџџџџџџџџџџџ
p 

 
Њ "2Ђ/
(%
0џџџџџџџџџџџџџџџџџџ@
 а
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_13261uvEЂB
;Ђ8
.+
inputsџџџџџџџџџџџџџџџџџџ
p

 
Њ "2Ђ/
(%
0џџџџџџџџџџџџџџџџџџ@
 Ј
2__inference_time_distributed_1_layer_call_fn_13194ruvEЂB
;Ђ8
.+
inputsџџџџџџџџџџџџџџџџџџ
p 

 
Њ "%"џџџџџџџџџџџџџџџџџџ@Ј
2__inference_time_distributed_1_layer_call_fn_13203ruvEЂB
;Ђ8
.+
inputsџџџџџџџџџџџџџџџџџџ
p

 
Њ "%"џџџџџџџџџџџџџџџџџџ@д
K__inference_time_distributed_layer_call_and_return_conditional_losses_13168MЂJ
CЂ@
63
inputs'џџџџџџџџџџџџџџџџџџ
p 

 
Њ "3Ђ0
)&
0џџџџџџџџџџџџџџџџџџ
 д
K__inference_time_distributed_layer_call_and_return_conditional_losses_13185MЂJ
CЂ@
63
inputs'џџџџџџџџџџџџџџџџџџ
p

 
Њ "3Ђ0
)&
0џџџџџџџџџџџџџџџџџџ
 Ћ
0__inference_time_distributed_layer_call_fn_13146wMЂJ
CЂ@
63
inputs'џџџџџџџџџџџџџџџџџџ
p 

 
Њ "&#џџџџџџџџџџџџџџџџџџЋ
0__inference_time_distributed_layer_call_fn_13151wMЂJ
CЂ@
63
inputs'џџџџџџџџџџџџџџџџџџ
p

 
Њ "&#џџџџџџџџџџџџџџџџџџи
M__inference_transformer_layer_1_layer_call_and_return_conditional_losses_2344xyz{|}~GЂD
-Ђ*
$!
inputsџџџџџџџџџ@

 
Њ

trainingp ")Ђ&

0џџџџџџџџџ@
 з
L__inference_transformer_layer_1_layer_call_and_return_conditional_losses_971xyz{|}~GЂD
-Ђ*
$!
inputsџџџџџџџџџ@

 
Њ

trainingp")Ђ&

0џџџџџџџџџ@
 Џ
2__inference_transformer_layer_1_layer_call_fn_1346yxyz{|}~GЂD
-Ђ*
$!
inputsџџџџџџџџџ@

 
Њ

trainingp"џџџџџџџџџ@Џ
2__inference_transformer_layer_1_layer_call_fn_3699yxyz{|}~GЂD
-Ђ*
$!
inputsџџџџџџџџџ@

 
Њ

trainingp "џџџџџџџџџ@р
M__inference_transformer_layer_2_layer_call_and_return_conditional_losses_1181GЂD
-Ђ*
$!
inputsџџџџџџџџџ@

 
Њ

trainingp")Ђ&

0џџџџџџџџџ@
 р
M__inference_transformer_layer_2_layer_call_and_return_conditional_losses_5281GЂD
-Ђ*
$!
inputsџџџџџџџџџ@

 
Њ

trainingp ")Ђ&

0џџџџџџџџџ@
 И
2__inference_transformer_layer_2_layer_call_fn_1542GЂD
-Ђ*
$!
inputsџџџџџџџџџ@

 
Њ

trainingp "џџџџџџџџџ@З
1__inference_transformer_layer_2_layer_call_fn_690GЂD
-Ђ*
$!
inputsџџџџџџџџџ@

 
Њ

trainingp"џџџџџџџџџ@