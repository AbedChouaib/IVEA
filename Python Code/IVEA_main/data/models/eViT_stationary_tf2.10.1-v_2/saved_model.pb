вд9
«Ъ
D
AddV2
x"T
y"T
z"T"
Ttype:
2	АР
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( И
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
÷
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
Ѓ
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
ј
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
Ж
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( И
?
Mul
x"T
y"T
z"T"
Ttype:
2	Р
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
Н
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
dtypetypeИ
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
•
ResourceGather
resource
indices"Tindices
output"dtype"

batch_dimsint "
validate_indicesbool("
dtypetype"
Tindicestype:
2	И
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
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
Ѕ
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
executor_typestring И®
@
StaticRegexFullMatch	
input

output
"
patternstring
ч
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
Ц
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 И"serve*2.10.12v2.10.0-76-gfdfc646704c8пэ2
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
З
Adam/dense_4/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	А@*&
shared_nameAdam/dense_4/kernel/v
А
)Adam/dense_4/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_4/kernel/v*
_output_shapes
:	А@*
dtype0

Adam/dense_3/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*$
shared_nameAdam/dense_3/bias/v
x
'Adam/dense_3/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_3/bias/v*
_output_shapes	
:А*
dtype0
З
Adam/dense_3/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@А*&
shared_nameAdam/dense_3/kernel/v
А
)Adam/dense_3/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_3/kernel/v*
_output_shapes
:	@А*
dtype0
ж
GAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*X
shared_nameIGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/v
я
[Adam/transformer_layer_2/multi_head_attention_1/attention_output/bias/v/Read/ReadVariableOpReadVariableOpGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/v*
_output_shapes
:@*
dtype0
т
IAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*Z
shared_nameKIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/v
л
]Adam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/v/Read/ReadVariableOpReadVariableOpIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/v*"
_output_shapes
:@@*
dtype0
‘
<Adam/transformer_layer_2/multi_head_attention_1/value/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*M
shared_name><Adam/transformer_layer_2/multi_head_attention_1/value/bias/v
Ќ
PAdam/transformer_layer_2/multi_head_attention_1/value/bias/v/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_2/multi_head_attention_1/value/bias/v*
_output_shapes

:@*
dtype0
№
>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*O
shared_name@>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/v
’
RAdam/transformer_layer_2/multi_head_attention_1/value/kernel/v/Read/ReadVariableOpReadVariableOp>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/v*"
_output_shapes
:@@*
dtype0
–
:Adam/transformer_layer_2/multi_head_attention_1/key/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*K
shared_name<:Adam/transformer_layer_2/multi_head_attention_1/key/bias/v
…
NAdam/transformer_layer_2/multi_head_attention_1/key/bias/v/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_2/multi_head_attention_1/key/bias/v*
_output_shapes

:@*
dtype0
Ў
<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*M
shared_name><Adam/transformer_layer_2/multi_head_attention_1/key/kernel/v
—
PAdam/transformer_layer_2/multi_head_attention_1/key/kernel/v/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/v*"
_output_shapes
:@@*
dtype0
‘
<Adam/transformer_layer_2/multi_head_attention_1/query/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*M
shared_name><Adam/transformer_layer_2/multi_head_attention_1/query/bias/v
Ќ
PAdam/transformer_layer_2/multi_head_attention_1/query/bias/v/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_2/multi_head_attention_1/query/bias/v*
_output_shapes

:@*
dtype0
№
>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*O
shared_name@>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/v
’
RAdam/transformer_layer_2/multi_head_attention_1/query/kernel/v/Read/ReadVariableOpReadVariableOp>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/v*"
_output_shapes
:@@*
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
З
Adam/dense_2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	А@*&
shared_nameAdam/dense_2/kernel/v
А
)Adam/dense_2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_2/kernel/v*
_output_shapes
:	А@*
dtype0

Adam/dense_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*$
shared_nameAdam/dense_1/bias/v
x
'Adam/dense_1/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_1/bias/v*
_output_shapes	
:А*
dtype0
З
Adam/dense_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@А*&
shared_nameAdam/dense_1/kernel/v
А
)Adam/dense_1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_1/kernel/v*
_output_shapes
:	@А*
dtype0
в
EAdam/transformer_layer_1/multi_head_attention/attention_output/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*V
shared_nameGEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/v
џ
YAdam/transformer_layer_1/multi_head_attention/attention_output/bias/v/Read/ReadVariableOpReadVariableOpEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/v*
_output_shapes
:@*
dtype0
о
GAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*X
shared_nameIGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/v
з
[Adam/transformer_layer_1/multi_head_attention/attention_output/kernel/v/Read/ReadVariableOpReadVariableOpGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/v*"
_output_shapes
:@@*
dtype0
–
:Adam/transformer_layer_1/multi_head_attention/value/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*K
shared_name<:Adam/transformer_layer_1/multi_head_attention/value/bias/v
…
NAdam/transformer_layer_1/multi_head_attention/value/bias/v/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_1/multi_head_attention/value/bias/v*
_output_shapes

:@*
dtype0
Ў
<Adam/transformer_layer_1/multi_head_attention/value/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*M
shared_name><Adam/transformer_layer_1/multi_head_attention/value/kernel/v
—
PAdam/transformer_layer_1/multi_head_attention/value/kernel/v/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_1/multi_head_attention/value/kernel/v*"
_output_shapes
:@@*
dtype0
ћ
8Adam/transformer_layer_1/multi_head_attention/key/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*I
shared_name:8Adam/transformer_layer_1/multi_head_attention/key/bias/v
≈
LAdam/transformer_layer_1/multi_head_attention/key/bias/v/Read/ReadVariableOpReadVariableOp8Adam/transformer_layer_1/multi_head_attention/key/bias/v*
_output_shapes

:@*
dtype0
‘
:Adam/transformer_layer_1/multi_head_attention/key/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*K
shared_name<:Adam/transformer_layer_1/multi_head_attention/key/kernel/v
Ќ
NAdam/transformer_layer_1/multi_head_attention/key/kernel/v/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_1/multi_head_attention/key/kernel/v*"
_output_shapes
:@@*
dtype0
–
:Adam/transformer_layer_1/multi_head_attention/query/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*K
shared_name<:Adam/transformer_layer_1/multi_head_attention/query/bias/v
…
NAdam/transformer_layer_1/multi_head_attention/query/bias/v/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_1/multi_head_attention/query/bias/v*
_output_shapes

:@*
dtype0
Ў
<Adam/transformer_layer_1/multi_head_attention/query/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*M
shared_name><Adam/transformer_layer_1/multi_head_attention/query/kernel/v
—
PAdam/transformer_layer_1/multi_head_attention/query/kernel/v/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_1/multi_head_attention/query/kernel/v*"
_output_shapes
:@@*
dtype0
ƒ
4Adam/frame_position_embedding/embedding/embeddings/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*E
shared_name64Adam/frame_position_embedding/embedding/embeddings/v
љ
HAdam/frame_position_embedding/embedding/embeddings/v/Read/ReadVariableOpReadVariableOp4Adam/frame_position_embedding/embedding/embeddings/v*
_output_shapes

:@*
dtype0
Ф
Adam/time_distributed_1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*/
shared_name Adam/time_distributed_1/bias/v
Н
2Adam/time_distributed_1/bias/v/Read/ReadVariableOpReadVariableOpAdam/time_distributed_1/bias/v*
_output_shapes
:@*
dtype0
Э
 Adam/time_distributed_1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	А@*1
shared_name" Adam/time_distributed_1/kernel/v
Ц
4Adam/time_distributed_1/kernel/v/Read/ReadVariableOpReadVariableOp Adam/time_distributed_1/kernel/v*
_output_shapes
:	А@*
dtype0
ѕ
;Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*L
shared_name=;Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/v
»
OAdam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/v/Read/ReadVariableOpReadVariableOp;Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/v*
_output_shapes	
:А*
dtype0
д
=Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*!
shape:АА*N
shared_name?=Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/v
Ё
QAdam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/v/Read/ReadVariableOpReadVariableOp=Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/v*,
_output_shapes
:АА*
dtype0
Ќ
:Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*K
shared_name<:Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/v
∆
NAdam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/v/Read/ReadVariableOpReadVariableOp:Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/v*
_output_shapes	
:А*
dtype0
б
<Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0* 
shape:@А*M
shared_name><Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/v
Џ
PAdam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/v/Read/ReadVariableOpReadVariableOp<Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/v*+
_output_shapes
:@А*
dtype0
ќ
;Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*L
shared_name=;Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/v
«
OAdam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/v/Read/ReadVariableOpReadVariableOp;Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/v*
_output_shapes
:@*
dtype0
в
=Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*N
shared_name?=Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/v
џ
QAdam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/v/Read/ReadVariableOpReadVariableOp=Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/v**
_output_shapes
:@@*
dtype0
ћ
:Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*K
shared_name<:Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/v
≈
NAdam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/v/Read/ReadVariableOpReadVariableOp:Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/v*
_output_shapes
:@*
dtype0
а
<Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*M
shared_name><Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/v
ў
PAdam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/v/Read/ReadVariableOpReadVariableOp<Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/v**
_output_shapes
: @*
dtype0
 
9Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *J
shared_name;9Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/v
√
MAdam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/v/Read/ReadVariableOpReadVariableOp9Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/v*
_output_shapes
: *
dtype0
ё
;Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *L
shared_name=;Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/v
„
OAdam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/v/Read/ReadVariableOpReadVariableOp;Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/v**
_output_shapes
:  *
dtype0
»
8Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *I
shared_name:8Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/v
Ѕ
LAdam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/v/Read/ReadVariableOpReadVariableOp8Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/v*
_output_shapes
: *
dtype0
№
:Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *K
shared_name<:Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/v
’
NAdam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/v/Read/ReadVariableOpReadVariableOp:Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/v**
_output_shapes
: *
dtype0
и
HAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*Y
shared_nameJHAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/v
б
\Adam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/v/Read/ReadVariableOpReadVariableOpHAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/v*
_output_shapes
:*
dtype0
ь
JAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*[
shared_nameLJAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/v
х
^Adam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/v/Read/ReadVariableOpReadVariableOpJAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/v**
_output_shapes
:*
dtype0
~
Adam/dense_6/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*$
shared_nameAdam/dense_6/bias/v
w
'Adam/dense_6/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_6/bias/v*
_output_shapes
:
*
dtype0
Ж
Adam/dense_6/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@
*&
shared_nameAdam/dense_6/kernel/v

)Adam/dense_6/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_6/kernel/v*
_output_shapes

:@
*
dtype0
~
Adam/dense_5/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*$
shared_nameAdam/dense_5/bias/v
w
'Adam/dense_5/bias/v/Read/ReadVariableOpReadVariableOpAdam/dense_5/bias/v*
_output_shapes
:@*
dtype0
З
Adam/dense_5/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	А
@*&
shared_nameAdam/dense_5/kernel/v
А
)Adam/dense_5/kernel/v/Read/ReadVariableOpReadVariableOpAdam/dense_5/kernel/v*
_output_shapes
:	А
@*
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
З
Adam/dense_4/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	А@*&
shared_nameAdam/dense_4/kernel/m
А
)Adam/dense_4/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_4/kernel/m*
_output_shapes
:	А@*
dtype0

Adam/dense_3/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*$
shared_nameAdam/dense_3/bias/m
x
'Adam/dense_3/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_3/bias/m*
_output_shapes	
:А*
dtype0
З
Adam/dense_3/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@А*&
shared_nameAdam/dense_3/kernel/m
А
)Adam/dense_3/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_3/kernel/m*
_output_shapes
:	@А*
dtype0
ж
GAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*X
shared_nameIGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/m
я
[Adam/transformer_layer_2/multi_head_attention_1/attention_output/bias/m/Read/ReadVariableOpReadVariableOpGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/m*
_output_shapes
:@*
dtype0
т
IAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*Z
shared_nameKIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/m
л
]Adam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/m/Read/ReadVariableOpReadVariableOpIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/m*"
_output_shapes
:@@*
dtype0
‘
<Adam/transformer_layer_2/multi_head_attention_1/value/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*M
shared_name><Adam/transformer_layer_2/multi_head_attention_1/value/bias/m
Ќ
PAdam/transformer_layer_2/multi_head_attention_1/value/bias/m/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_2/multi_head_attention_1/value/bias/m*
_output_shapes

:@*
dtype0
№
>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*O
shared_name@>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/m
’
RAdam/transformer_layer_2/multi_head_attention_1/value/kernel/m/Read/ReadVariableOpReadVariableOp>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/m*"
_output_shapes
:@@*
dtype0
–
:Adam/transformer_layer_2/multi_head_attention_1/key/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*K
shared_name<:Adam/transformer_layer_2/multi_head_attention_1/key/bias/m
…
NAdam/transformer_layer_2/multi_head_attention_1/key/bias/m/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_2/multi_head_attention_1/key/bias/m*
_output_shapes

:@*
dtype0
Ў
<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*M
shared_name><Adam/transformer_layer_2/multi_head_attention_1/key/kernel/m
—
PAdam/transformer_layer_2/multi_head_attention_1/key/kernel/m/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/m*"
_output_shapes
:@@*
dtype0
‘
<Adam/transformer_layer_2/multi_head_attention_1/query/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*M
shared_name><Adam/transformer_layer_2/multi_head_attention_1/query/bias/m
Ќ
PAdam/transformer_layer_2/multi_head_attention_1/query/bias/m/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_2/multi_head_attention_1/query/bias/m*
_output_shapes

:@*
dtype0
№
>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*O
shared_name@>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/m
’
RAdam/transformer_layer_2/multi_head_attention_1/query/kernel/m/Read/ReadVariableOpReadVariableOp>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/m*"
_output_shapes
:@@*
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
З
Adam/dense_2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	А@*&
shared_nameAdam/dense_2/kernel/m
А
)Adam/dense_2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_2/kernel/m*
_output_shapes
:	А@*
dtype0

Adam/dense_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*$
shared_nameAdam/dense_1/bias/m
x
'Adam/dense_1/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_1/bias/m*
_output_shapes	
:А*
dtype0
З
Adam/dense_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@А*&
shared_nameAdam/dense_1/kernel/m
А
)Adam/dense_1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_1/kernel/m*
_output_shapes
:	@А*
dtype0
в
EAdam/transformer_layer_1/multi_head_attention/attention_output/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*V
shared_nameGEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/m
џ
YAdam/transformer_layer_1/multi_head_attention/attention_output/bias/m/Read/ReadVariableOpReadVariableOpEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/m*
_output_shapes
:@*
dtype0
о
GAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*X
shared_nameIGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/m
з
[Adam/transformer_layer_1/multi_head_attention/attention_output/kernel/m/Read/ReadVariableOpReadVariableOpGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/m*"
_output_shapes
:@@*
dtype0
–
:Adam/transformer_layer_1/multi_head_attention/value/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*K
shared_name<:Adam/transformer_layer_1/multi_head_attention/value/bias/m
…
NAdam/transformer_layer_1/multi_head_attention/value/bias/m/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_1/multi_head_attention/value/bias/m*
_output_shapes

:@*
dtype0
Ў
<Adam/transformer_layer_1/multi_head_attention/value/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*M
shared_name><Adam/transformer_layer_1/multi_head_attention/value/kernel/m
—
PAdam/transformer_layer_1/multi_head_attention/value/kernel/m/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_1/multi_head_attention/value/kernel/m*"
_output_shapes
:@@*
dtype0
ћ
8Adam/transformer_layer_1/multi_head_attention/key/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*I
shared_name:8Adam/transformer_layer_1/multi_head_attention/key/bias/m
≈
LAdam/transformer_layer_1/multi_head_attention/key/bias/m/Read/ReadVariableOpReadVariableOp8Adam/transformer_layer_1/multi_head_attention/key/bias/m*
_output_shapes

:@*
dtype0
‘
:Adam/transformer_layer_1/multi_head_attention/key/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*K
shared_name<:Adam/transformer_layer_1/multi_head_attention/key/kernel/m
Ќ
NAdam/transformer_layer_1/multi_head_attention/key/kernel/m/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_1/multi_head_attention/key/kernel/m*"
_output_shapes
:@@*
dtype0
–
:Adam/transformer_layer_1/multi_head_attention/query/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*K
shared_name<:Adam/transformer_layer_1/multi_head_attention/query/bias/m
…
NAdam/transformer_layer_1/multi_head_attention/query/bias/m/Read/ReadVariableOpReadVariableOp:Adam/transformer_layer_1/multi_head_attention/query/bias/m*
_output_shapes

:@*
dtype0
Ў
<Adam/transformer_layer_1/multi_head_attention/query/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*M
shared_name><Adam/transformer_layer_1/multi_head_attention/query/kernel/m
—
PAdam/transformer_layer_1/multi_head_attention/query/kernel/m/Read/ReadVariableOpReadVariableOp<Adam/transformer_layer_1/multi_head_attention/query/kernel/m*"
_output_shapes
:@@*
dtype0
ƒ
4Adam/frame_position_embedding/embedding/embeddings/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*E
shared_name64Adam/frame_position_embedding/embedding/embeddings/m
љ
HAdam/frame_position_embedding/embedding/embeddings/m/Read/ReadVariableOpReadVariableOp4Adam/frame_position_embedding/embedding/embeddings/m*
_output_shapes

:@*
dtype0
Ф
Adam/time_distributed_1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*/
shared_name Adam/time_distributed_1/bias/m
Н
2Adam/time_distributed_1/bias/m/Read/ReadVariableOpReadVariableOpAdam/time_distributed_1/bias/m*
_output_shapes
:@*
dtype0
Э
 Adam/time_distributed_1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	А@*1
shared_name" Adam/time_distributed_1/kernel/m
Ц
4Adam/time_distributed_1/kernel/m/Read/ReadVariableOpReadVariableOp Adam/time_distributed_1/kernel/m*
_output_shapes
:	А@*
dtype0
ѕ
;Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*L
shared_name=;Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/m
»
OAdam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/m/Read/ReadVariableOpReadVariableOp;Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/m*
_output_shapes	
:А*
dtype0
д
=Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*!
shape:АА*N
shared_name?=Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/m
Ё
QAdam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/m/Read/ReadVariableOpReadVariableOp=Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/m*,
_output_shapes
:АА*
dtype0
Ќ
:Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*K
shared_name<:Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/m
∆
NAdam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/m/Read/ReadVariableOpReadVariableOp:Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/m*
_output_shapes	
:А*
dtype0
б
<Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0* 
shape:@А*M
shared_name><Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/m
Џ
PAdam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/m/Read/ReadVariableOpReadVariableOp<Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/m*+
_output_shapes
:@А*
dtype0
ќ
;Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*L
shared_name=;Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/m
«
OAdam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/m/Read/ReadVariableOpReadVariableOp;Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/m*
_output_shapes
:@*
dtype0
в
=Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*N
shared_name?=Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/m
џ
QAdam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/m/Read/ReadVariableOpReadVariableOp=Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/m**
_output_shapes
:@@*
dtype0
ћ
:Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*K
shared_name<:Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/m
≈
NAdam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/m/Read/ReadVariableOpReadVariableOp:Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/m*
_output_shapes
:@*
dtype0
а
<Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*M
shared_name><Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/m
ў
PAdam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/m/Read/ReadVariableOpReadVariableOp<Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/m**
_output_shapes
: @*
dtype0
 
9Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *J
shared_name;9Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/m
√
MAdam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/m/Read/ReadVariableOpReadVariableOp9Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/m*
_output_shapes
: *
dtype0
ё
;Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *L
shared_name=;Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/m
„
OAdam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/m/Read/ReadVariableOpReadVariableOp;Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/m**
_output_shapes
:  *
dtype0
»
8Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *I
shared_name:8Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/m
Ѕ
LAdam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/m/Read/ReadVariableOpReadVariableOp8Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/m*
_output_shapes
: *
dtype0
№
:Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *K
shared_name<:Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/m
’
NAdam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/m/Read/ReadVariableOpReadVariableOp:Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/m**
_output_shapes
: *
dtype0
и
HAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*Y
shared_nameJHAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/m
б
\Adam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/m/Read/ReadVariableOpReadVariableOpHAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/m*
_output_shapes
:*
dtype0
ь
JAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*[
shared_nameLJAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/m
х
^Adam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/m/Read/ReadVariableOpReadVariableOpJAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/m**
_output_shapes
:*
dtype0
~
Adam/dense_6/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*$
shared_nameAdam/dense_6/bias/m
w
'Adam/dense_6/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_6/bias/m*
_output_shapes
:
*
dtype0
Ж
Adam/dense_6/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@
*&
shared_nameAdam/dense_6/kernel/m

)Adam/dense_6/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_6/kernel/m*
_output_shapes

:@
*
dtype0
~
Adam/dense_5/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*$
shared_nameAdam/dense_5/bias/m
w
'Adam/dense_5/bias/m/Read/ReadVariableOpReadVariableOpAdam/dense_5/bias/m*
_output_shapes
:@*
dtype0
З
Adam/dense_5/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	А
@*&
shared_nameAdam/dense_5/kernel/m
А
)Adam/dense_5/kernel/m/Read/ReadVariableOpReadVariableOpAdam/dense_5/kernel/m*
_output_shapes
:	А
@*
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
shape:	А@*
shared_namedense_4/kernel
r
"dense_4/kernel/Read/ReadVariableOpReadVariableOpdense_4/kernel*
_output_shapes
:	А@*
dtype0
q
dense_3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*
shared_namedense_3/bias
j
 dense_3/bias/Read/ReadVariableOpReadVariableOpdense_3/bias*
_output_shapes	
:А*
dtype0
y
dense_3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@А*
shared_namedense_3/kernel
r
"dense_3/kernel/Read/ReadVariableOpReadVariableOpdense_3/kernel*
_output_shapes
:	@А*
dtype0
Ў
@transformer_layer_2/multi_head_attention_1/attention_output/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*Q
shared_nameB@transformer_layer_2/multi_head_attention_1/attention_output/bias
—
Ttransformer_layer_2/multi_head_attention_1/attention_output/bias/Read/ReadVariableOpReadVariableOp@transformer_layer_2/multi_head_attention_1/attention_output/bias*
_output_shapes
:@*
dtype0
д
Btransformer_layer_2/multi_head_attention_1/attention_output/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*S
shared_nameDBtransformer_layer_2/multi_head_attention_1/attention_output/kernel
Ё
Vtransformer_layer_2/multi_head_attention_1/attention_output/kernel/Read/ReadVariableOpReadVariableOpBtransformer_layer_2/multi_head_attention_1/attention_output/kernel*"
_output_shapes
:@@*
dtype0
∆
5transformer_layer_2/multi_head_attention_1/value/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*F
shared_name75transformer_layer_2/multi_head_attention_1/value/bias
њ
Itransformer_layer_2/multi_head_attention_1/value/bias/Read/ReadVariableOpReadVariableOp5transformer_layer_2/multi_head_attention_1/value/bias*
_output_shapes

:@*
dtype0
ќ
7transformer_layer_2/multi_head_attention_1/value/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*H
shared_name97transformer_layer_2/multi_head_attention_1/value/kernel
«
Ktransformer_layer_2/multi_head_attention_1/value/kernel/Read/ReadVariableOpReadVariableOp7transformer_layer_2/multi_head_attention_1/value/kernel*"
_output_shapes
:@@*
dtype0
¬
3transformer_layer_2/multi_head_attention_1/key/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*D
shared_name53transformer_layer_2/multi_head_attention_1/key/bias
ї
Gtransformer_layer_2/multi_head_attention_1/key/bias/Read/ReadVariableOpReadVariableOp3transformer_layer_2/multi_head_attention_1/key/bias*
_output_shapes

:@*
dtype0
 
5transformer_layer_2/multi_head_attention_1/key/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*F
shared_name75transformer_layer_2/multi_head_attention_1/key/kernel
√
Itransformer_layer_2/multi_head_attention_1/key/kernel/Read/ReadVariableOpReadVariableOp5transformer_layer_2/multi_head_attention_1/key/kernel*"
_output_shapes
:@@*
dtype0
∆
5transformer_layer_2/multi_head_attention_1/query/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*F
shared_name75transformer_layer_2/multi_head_attention_1/query/bias
њ
Itransformer_layer_2/multi_head_attention_1/query/bias/Read/ReadVariableOpReadVariableOp5transformer_layer_2/multi_head_attention_1/query/bias*
_output_shapes

:@*
dtype0
ќ
7transformer_layer_2/multi_head_attention_1/query/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*H
shared_name97transformer_layer_2/multi_head_attention_1/query/kernel
«
Ktransformer_layer_2/multi_head_attention_1/query/kernel/Read/ReadVariableOpReadVariableOp7transformer_layer_2/multi_head_attention_1/query/kernel*"
_output_shapes
:@@*
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
shape:	А@*
shared_namedense_2/kernel
r
"dense_2/kernel/Read/ReadVariableOpReadVariableOpdense_2/kernel*
_output_shapes
:	А@*
dtype0
q
dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*
shared_namedense_1/bias
j
 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_output_shapes	
:А*
dtype0
y
dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@А*
shared_namedense_1/kernel
r
"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel*
_output_shapes
:	@А*
dtype0
‘
>transformer_layer_1/multi_head_attention/attention_output/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*O
shared_name@>transformer_layer_1/multi_head_attention/attention_output/bias
Ќ
Rtransformer_layer_1/multi_head_attention/attention_output/bias/Read/ReadVariableOpReadVariableOp>transformer_layer_1/multi_head_attention/attention_output/bias*
_output_shapes
:@*
dtype0
а
@transformer_layer_1/multi_head_attention/attention_output/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*Q
shared_nameB@transformer_layer_1/multi_head_attention/attention_output/kernel
ў
Ttransformer_layer_1/multi_head_attention/attention_output/kernel/Read/ReadVariableOpReadVariableOp@transformer_layer_1/multi_head_attention/attention_output/kernel*"
_output_shapes
:@@*
dtype0
¬
3transformer_layer_1/multi_head_attention/value/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*D
shared_name53transformer_layer_1/multi_head_attention/value/bias
ї
Gtransformer_layer_1/multi_head_attention/value/bias/Read/ReadVariableOpReadVariableOp3transformer_layer_1/multi_head_attention/value/bias*
_output_shapes

:@*
dtype0
 
5transformer_layer_1/multi_head_attention/value/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*F
shared_name75transformer_layer_1/multi_head_attention/value/kernel
√
Itransformer_layer_1/multi_head_attention/value/kernel/Read/ReadVariableOpReadVariableOp5transformer_layer_1/multi_head_attention/value/kernel*"
_output_shapes
:@@*
dtype0
Њ
1transformer_layer_1/multi_head_attention/key/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*B
shared_name31transformer_layer_1/multi_head_attention/key/bias
Ј
Etransformer_layer_1/multi_head_attention/key/bias/Read/ReadVariableOpReadVariableOp1transformer_layer_1/multi_head_attention/key/bias*
_output_shapes

:@*
dtype0
∆
3transformer_layer_1/multi_head_attention/key/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*D
shared_name53transformer_layer_1/multi_head_attention/key/kernel
њ
Gtransformer_layer_1/multi_head_attention/key/kernel/Read/ReadVariableOpReadVariableOp3transformer_layer_1/multi_head_attention/key/kernel*"
_output_shapes
:@@*
dtype0
¬
3transformer_layer_1/multi_head_attention/query/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*D
shared_name53transformer_layer_1/multi_head_attention/query/bias
ї
Gtransformer_layer_1/multi_head_attention/query/bias/Read/ReadVariableOpReadVariableOp3transformer_layer_1/multi_head_attention/query/bias*
_output_shapes

:@*
dtype0
 
5transformer_layer_1/multi_head_attention/query/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*F
shared_name75transformer_layer_1/multi_head_attention/query/kernel
√
Itransformer_layer_1/multi_head_attention/query/kernel/Read/ReadVariableOpReadVariableOp5transformer_layer_1/multi_head_attention/query/kernel*"
_output_shapes
:@@*
dtype0
ґ
-frame_position_embedding/embedding/embeddingsVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*>
shared_name/-frame_position_embedding/embedding/embeddings
ѓ
Aframe_position_embedding/embedding/embeddings/Read/ReadVariableOpReadVariableOp-frame_position_embedding/embedding/embeddings*
_output_shapes

:@*
dtype0
Ж
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
П
time_distributed_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	А@**
shared_nametime_distributed_1/kernel
И
-time_distributed_1/kernel/Read/ReadVariableOpReadVariableOptime_distributed_1/kernel*
_output_shapes
:	А@*
dtype0
Ѕ
4encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*E
shared_name64encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias
Ї
Hencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/Read/ReadVariableOpReadVariableOp4encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias*
_output_shapes	
:А*
dtype0
÷
6encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*!
shape:АА*G
shared_name86encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel
ѕ
Jencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/Read/ReadVariableOpReadVariableOp6encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel*,
_output_shapes
:АА*
dtype0
њ
3encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*D
shared_name53encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias
Є
Gencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/Read/ReadVariableOpReadVariableOp3encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias*
_output_shapes	
:А*
dtype0
”
5encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0* 
shape:@А*F
shared_name75encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel
ћ
Iencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/Read/ReadVariableOpReadVariableOp5encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel*+
_output_shapes
:@А*
dtype0
ј
4encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*E
shared_name64encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias
є
Hencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/Read/ReadVariableOpReadVariableOp4encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias*
_output_shapes
:@*
dtype0
‘
6encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@@*G
shared_name86encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel
Ќ
Jencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/Read/ReadVariableOpReadVariableOp6encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel**
_output_shapes
:@@*
dtype0
Њ
3encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*D
shared_name53encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias
Ј
Gencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/Read/ReadVariableOpReadVariableOp3encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias*
_output_shapes
:@*
dtype0
“
5encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*F
shared_name75encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel
Ћ
Iencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/Read/ReadVariableOpReadVariableOp5encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel**
_output_shapes
: @*
dtype0
Љ
2encoder3d/conv2_plus1d/conv3D_1_temporal_conv/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *C
shared_name42encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias
µ
Fencoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/Read/ReadVariableOpReadVariableOp2encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias*
_output_shapes
: *
dtype0
–
4encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:  *E
shared_name64encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel
…
Hencoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/Read/ReadVariableOpReadVariableOp4encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel**
_output_shapes
:  *
dtype0
Ї
1encoder3d/conv2_plus1d/conv3D_1_spatial_conv/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *B
shared_name31encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias
≥
Eencoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/Read/ReadVariableOpReadVariableOp1encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias*
_output_shapes
: *
dtype0
ќ
3encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *D
shared_name53encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel
«
Gencoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/Read/ReadVariableOpReadVariableOp3encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel**
_output_shapes
: *
dtype0
Џ
Aencoder3d/spatial_attention/spatial_attention_attention_conv/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*R
shared_nameCAencoder3d/spatial_attention/spatial_attention_attention_conv/bias
”
Uencoder3d/spatial_attention/spatial_attention_attention_conv/bias/Read/ReadVariableOpReadVariableOpAencoder3d/spatial_attention/spatial_attention_attention_conv/bias*
_output_shapes
:*
dtype0
о
Cencoder3d/spatial_attention/spatial_attention_attention_conv/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*T
shared_nameECencoder3d/spatial_attention/spatial_attention_attention_conv/kernel
з
Wencoder3d/spatial_attention/spatial_attention_attention_conv/kernel/Read/ReadVariableOpReadVariableOpCencoder3d/spatial_attention/spatial_attention_attention_conv/kernel**
_output_shapes
:*
dtype0
p
dense_6/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*
shared_namedense_6/bias
i
 dense_6/bias/Read/ReadVariableOpReadVariableOpdense_6/bias*
_output_shapes
:
*
dtype0
x
dense_6/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@
*
shared_namedense_6/kernel
q
"dense_6/kernel/Read/ReadVariableOpReadVariableOpdense_6/kernel*
_output_shapes

:@
*
dtype0
p
dense_5/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_namedense_5/bias
i
 dense_5/bias/Read/ReadVariableOpReadVariableOpdense_5/bias*
_output_shapes
:@*
dtype0
y
dense_5/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	А
@*
shared_namedense_5/kernel
r
"dense_5/kernel/Read/ReadVariableOpReadVariableOpdense_5/kernel*
_output_shapes
:	А
@*
dtype0
Т
serving_default_input_1Placeholder*3
_output_shapes!
:€€€€€€€€€(*
dtype0*(
shape:€€€€€€€€€(
«
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1Cencoder3d/spatial_attention/spatial_attention_attention_conv/kernelAencoder3d/spatial_attention/spatial_attention_attention_conv/bias3encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel1encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias4encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel2encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias5encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel3encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias6encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel4encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias5encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel3encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias6encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel4encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/biastime_distributed_1/kerneltime_distributed_1/bias-frame_position_embedding/embedding/embeddings5transformer_layer_1/multi_head_attention/query/kernel3transformer_layer_1/multi_head_attention/query/bias3transformer_layer_1/multi_head_attention/key/kernel1transformer_layer_1/multi_head_attention/key/bias5transformer_layer_1/multi_head_attention/value/kernel3transformer_layer_1/multi_head_attention/value/bias@transformer_layer_1/multi_head_attention/attention_output/kernel>transformer_layer_1/multi_head_attention/attention_output/biasdense_1/kerneldense_1/biasdense_2/kerneldense_2/bias7transformer_layer_2/multi_head_attention_1/query/kernel5transformer_layer_2/multi_head_attention_1/query/bias5transformer_layer_2/multi_head_attention_1/key/kernel3transformer_layer_2/multi_head_attention_1/key/bias7transformer_layer_2/multi_head_attention_1/value/kernel5transformer_layer_2/multi_head_attention_1/value/biasBtransformer_layer_2/multi_head_attention_1/attention_output/kernel@transformer_layer_2/multi_head_attention_1/attention_output/biasdense_3/kerneldense_3/biasdense_4/kerneldense_4/biasdense_5/kerneldense_5/biasdense_6/kerneldense_6/bias*9
Tin2
02.*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€
*O
_read_only_resource_inputs1
/-	
 !"#$%&'()*+,-*0
config_proto 

CPU

GPU2*0J 8В *,
f'R%
#__inference_signature_wrapper_25701

NoOpNoOp
ЫВ
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*’Б
value БB∆Б BЊБ
Д
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
signatures*
* 
ь
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
spatial_attention

conv3d
conv3d2
conv3d3
	pooling3d

pooling3d2
 
pooling3d3*
Щ
!	variables
"trainable_variables
#regularization_losses
$	keras_api
%__call__
*&&call_and_return_all_conditional_losses
	'layer* 
Ы
(	variables
)trainable_variables
*regularization_losses
+	keras_api
,__call__
*-&call_and_return_all_conditional_losses
	.layer*
©
/	variables
0trainable_variables
1regularization_losses
2	keras_api
3__call__
*4&call_and_return_all_conditional_losses
5position_embeddings*
ѓ
6	variables
7trainable_variables
8regularization_losses
9	keras_api
:__call__
*;&call_and_return_all_conditional_losses
<	attention
=
dense_proj*
ѓ
>	variables
?trainable_variables
@regularization_losses
A	keras_api
B__call__
*C&call_and_return_all_conditional_losses
D	attention
E
dense_proj*
О
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
J__call__
*K&call_and_return_all_conditional_losses* 
¶
L	variables
Mtrainable_variables
Nregularization_losses
O	keras_api
P__call__
*Q&call_and_return_all_conditional_losses

Rkernel
Sbias*
¶
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses

Zkernel
[bias*
з
\0
]1
^2
_3
`4
a5
b6
c7
d8
e9
f10
g11
h12
i13
j14
k15
l16
m17
n18
o19
p20
q21
r22
s23
t24
u25
v26
w27
x28
y29
z30
{31
|32
}33
~34
35
А36
Б37
В38
Г39
Д40
R41
S42
Z43
[44*
з
\0
]1
^2
_3
`4
a5
b6
c7
d8
e9
f10
g11
h12
i13
j14
k15
l16
m17
n18
o19
p20
q21
r22
s23
t24
u25
v26
w27
x28
y29
z30
{31
|32
}33
~34
35
А36
Б37
В38
Г39
Д40
R41
S42
Z43
[44*
* 
µ
Еnon_trainable_variables
Жlayers
Зmetrics
 Иlayer_regularization_losses
Йlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
:
Кtrace_0
Лtrace_1
Мtrace_2
Нtrace_3* 
:
Оtrace_0
Пtrace_1
Рtrace_2
Сtrace_3* 
* 
„
	Тiter
Уbeta_1
Фbeta_2

Хdecay
Цlearning_rateRm”Sm‘Zm’[m÷\m„]mЎ^mў_mЏ`mџam№bmЁcmёdmяemаfmбgmвhmгimдjmеkmжlmзmmиnmйomкpmлqmмrmнsmоtmпumрvmсwmтxmуymфzmх{mц|mч}mш~mщmъ	Аmы	Бmь	Вmэ	Гmю	Дm€RvАSvБZvВ[vГ\vД]vЕ^vЖ_vЗ`vИavЙbvКcvЛdvМevНfvОgvПhvРivСjvТkvУlvФmvХnvЦovЧpvШqvЩrvЪsvЫtvЬuvЭvvЮwvЯxv†yv°zvҐ{v£|v§}v•~v¶vІ	Аv®	Бv©	Вv™	ГvЂ	Дvђ*

Чserving_default* 
j
\0
]1
^2
_3
`4
a5
b6
c7
d8
e9
f10
g11
h12
i13*
j
\0
]1
^2
_3
`4
a5
b6
c7
d8
e9
f10
g11
h12
i13*
* 
Ш
Шnon_trainable_variables
Щlayers
Ъmetrics
 Ыlayer_regularization_losses
Ьlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

Эtrace_0* 

Юtrace_0* 
°
Я	variables
†trainable_variables
°regularization_losses
Ґ	keras_api
£__call__
+§&call_and_return_all_conditional_losses
	•conv*
љ
¶	variables
Іtrainable_variables
®regularization_losses
©	keras_api
™__call__
+Ђ&call_and_return_all_conditional_losses
ђspatial_conv
≠temporal_conv*
љ
Ѓ	variables
ѓtrainable_variables
∞regularization_losses
±	keras_api
≤__call__
+≥&call_and_return_all_conditional_losses
іspatial_conv
µtemporal_conv*
љ
ґ	variables
Јtrainable_variables
Єregularization_losses
є	keras_api
Ї__call__
+ї&call_and_return_all_conditional_losses
Љspatial_conv
љtemporal_conv*
Ф
Њ	variables
њtrainable_variables
јregularization_losses
Ѕ	keras_api
¬__call__
+√&call_and_return_all_conditional_losses* 
Ф
ƒ	variables
≈trainable_variables
∆regularization_losses
«	keras_api
»__call__
+…&call_and_return_all_conditional_losses* 
Ф
 	variables
Ћtrainable_variables
ћregularization_losses
Ќ	keras_api
ќ__call__
+ѕ&call_and_return_all_conditional_losses* 
* 
* 
* 
Ц
–non_trainable_variables
—layers
“metrics
 ”layer_regularization_losses
‘layer_metrics
!	variables
"trainable_variables
#regularization_losses
%__call__
*&&call_and_return_all_conditional_losses
&&"call_and_return_conditional_losses* 

’trace_0
÷trace_1* 

„trace_0
Ўtrace_1* 
Ф
ў	variables
Џtrainable_variables
џregularization_losses
№	keras_api
Ё__call__
+ё&call_and_return_all_conditional_losses* 

j0
k1*

j0
k1*
* 
Ш
яnon_trainable_variables
аlayers
бmetrics
 вlayer_regularization_losses
гlayer_metrics
(	variables
)trainable_variables
*regularization_losses
,__call__
*-&call_and_return_all_conditional_losses
&-"call_and_return_conditional_losses*

дtrace_0
еtrace_1* 

жtrace_0
зtrace_1* 
ђ
и	variables
йtrainable_variables
кregularization_losses
л	keras_api
м__call__
+н&call_and_return_all_conditional_losses

jkernel
kbias*

l0*

l0*
* 
Ш
оnon_trainable_variables
пlayers
рmetrics
 сlayer_regularization_losses
тlayer_metrics
/	variables
0trainable_variables
1regularization_losses
3__call__
*4&call_and_return_all_conditional_losses
&4"call_and_return_conditional_losses*

уtrace_0* 

фtrace_0* 
¶
х	variables
цtrainable_variables
чregularization_losses
ш	keras_api
щ__call__
+ъ&call_and_return_all_conditional_losses
l
embeddings*
Z
m0
n1
o2
p3
q4
r5
s6
t7
u8
v9
w10
x11*
Z
m0
n1
o2
p3
q4
r5
s6
t7
u8
v9
w10
x11*
* 
Ш
ыnon_trainable_variables
ьlayers
эmetrics
 юlayer_regularization_losses
€layer_metrics
6	variables
7trainable_variables
8regularization_losses
:__call__
*;&call_and_return_all_conditional_losses
&;"call_and_return_conditional_losses*

Аtrace_0
Бtrace_1* 

Вtrace_0
Гtrace_1* 
Е
Д	variables
Еtrainable_variables
Жregularization_losses
З	keras_api
И__call__
+Й&call_and_return_all_conditional_losses
К_query_dense
Л
_key_dense
М_value_dense
Н_softmax
О_dropout_layer
П_output_dense*
и
Рlayer_with_weights-0
Рlayer-0
Сlayer_with_weights-1
Сlayer-1
Т	variables
Уtrainable_variables
Фregularization_losses
Х	keras_api
Ц__call__
+Ч&call_and_return_all_conditional_losses*
_
y0
z1
{2
|3
}4
~5
6
А7
Б8
В9
Г10
Д11*
_
y0
z1
{2
|3
}4
~5
6
А7
Б8
В9
Г10
Д11*
* 
Ш
Шnon_trainable_variables
Щlayers
Ъmetrics
 Ыlayer_regularization_losses
Ьlayer_metrics
>	variables
?trainable_variables
@regularization_losses
B__call__
*C&call_and_return_all_conditional_losses
&C"call_and_return_conditional_losses*

Эtrace_0
Юtrace_1* 

Яtrace_0
†trace_1* 
Е
°	variables
Ґtrainable_variables
£regularization_losses
§	keras_api
•__call__
+¶&call_and_return_all_conditional_losses
І_query_dense
®
_key_dense
©_value_dense
™_softmax
Ђ_dropout_layer
ђ_output_dense*
и
≠layer_with_weights-0
≠layer-0
Ѓlayer_with_weights-1
Ѓlayer-1
ѓ	variables
∞trainable_variables
±regularization_losses
≤	keras_api
≥__call__
+і&call_and_return_all_conditional_losses*
* 
* 
* 
Ц
µnon_trainable_variables
ґlayers
Јmetrics
 Єlayer_regularization_losses
єlayer_metrics
F	variables
Gtrainable_variables
Hregularization_losses
J__call__
*K&call_and_return_all_conditional_losses
&K"call_and_return_conditional_losses* 

Їtrace_0* 

їtrace_0* 

R0
S1*

R0
S1*
* 
Ш
Љnon_trainable_variables
љlayers
Њmetrics
 њlayer_regularization_losses
јlayer_metrics
L	variables
Mtrainable_variables
Nregularization_losses
P__call__
*Q&call_and_return_all_conditional_losses
&Q"call_and_return_conditional_losses*

Ѕtrace_0* 

¬trace_0* 
^X
VARIABLE_VALUEdense_5/kernel6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_5/bias4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUE*

Z0
[1*

Z0
[1*
* 
Ш
√non_trainable_variables
ƒlayers
≈metrics
 ∆layer_regularization_losses
«layer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses*

»trace_0* 

…trace_0* 
^X
VARIABLE_VALUEdense_6/kernel6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_6/bias4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUE*
Г}
VARIABLE_VALUECencoder3d/spatial_attention/spatial_attention_attention_conv/kernel&variables/0/.ATTRIBUTES/VARIABLE_VALUE*
Б{
VARIABLE_VALUEAencoder3d/spatial_attention/spatial_attention_attention_conv/bias&variables/1/.ATTRIBUTES/VARIABLE_VALUE*
sm
VARIABLE_VALUE3encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel&variables/2/.ATTRIBUTES/VARIABLE_VALUE*
qk
VARIABLE_VALUE1encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias&variables/3/.ATTRIBUTES/VARIABLE_VALUE*
tn
VARIABLE_VALUE4encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel&variables/4/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUE2encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias&variables/5/.ATTRIBUTES/VARIABLE_VALUE*
uo
VARIABLE_VALUE5encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel&variables/6/.ATTRIBUTES/VARIABLE_VALUE*
sm
VARIABLE_VALUE3encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias&variables/7/.ATTRIBUTES/VARIABLE_VALUE*
vp
VARIABLE_VALUE6encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel&variables/8/.ATTRIBUTES/VARIABLE_VALUE*
tn
VARIABLE_VALUE4encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias&variables/9/.ATTRIBUTES/VARIABLE_VALUE*
vp
VARIABLE_VALUE5encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel'variables/10/.ATTRIBUTES/VARIABLE_VALUE*
tn
VARIABLE_VALUE3encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias'variables/11/.ATTRIBUTES/VARIABLE_VALUE*
wq
VARIABLE_VALUE6encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel'variables/12/.ATTRIBUTES/VARIABLE_VALUE*
uo
VARIABLE_VALUE4encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias'variables/13/.ATTRIBUTES/VARIABLE_VALUE*
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
Б{
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
Г}
VARIABLE_VALUEBtransformer_layer_2/multi_head_attention_1/attention_output/kernel'variables/35/.ATTRIBUTES/VARIABLE_VALUE*
Б{
VARIABLE_VALUE@transformer_layer_2/multi_head_attention_1/attention_output/bias'variables/36/.ATTRIBUTES/VARIABLE_VALUE*
OI
VARIABLE_VALUEdense_3/kernel'variables/37/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEdense_3/bias'variables/38/.ATTRIBUTES/VARIABLE_VALUE*
OI
VARIABLE_VALUEdense_4/kernel'variables/39/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEdense_4/bias'variables/40/.ATTRIBUTES/VARIABLE_VALUE*
* 
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
 0
Ћ1*
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
* 
5
0
1
2
3
4
5
 6*
* 
* 
* 
* 
* 

\0
]1*

\0
]1*
* 
Ю
ћnon_trainable_variables
Ќlayers
ќmetrics
 ѕlayer_regularization_losses
–layer_metrics
Я	variables
†trainable_variables
°regularization_losses
£__call__
+§&call_and_return_all_conditional_losses
'§"call_and_return_conditional_losses*
* 
* 
ѕ
—	variables
“trainable_variables
”regularization_losses
‘	keras_api
’__call__
+÷&call_and_return_all_conditional_losses

\kernel
]bias
!„_jit_compiled_convolution_op*
 
^0
_1
`2
a3*
 
^0
_1
`2
a3*
* 
Ю
Ўnon_trainable_variables
ўlayers
Џmetrics
 џlayer_regularization_losses
№layer_metrics
¶	variables
Іtrainable_variables
®regularization_losses
™__call__
+Ђ&call_and_return_all_conditional_losses
'Ђ"call_and_return_conditional_losses*
* 
* 
ѕ
Ё	variables
ёtrainable_variables
яregularization_losses
а	keras_api
б__call__
+в&call_and_return_all_conditional_losses

^kernel
_bias
!г_jit_compiled_convolution_op*
ѕ
д	variables
еtrainable_variables
жregularization_losses
з	keras_api
и__call__
+й&call_and_return_all_conditional_losses

`kernel
abias
!к_jit_compiled_convolution_op*
 
b0
c1
d2
e3*
 
b0
c1
d2
e3*
* 
Ю
лnon_trainable_variables
мlayers
нmetrics
 оlayer_regularization_losses
пlayer_metrics
Ѓ	variables
ѓtrainable_variables
∞regularization_losses
≤__call__
+≥&call_and_return_all_conditional_losses
'≥"call_and_return_conditional_losses*
* 
* 
ѕ
р	variables
сtrainable_variables
тregularization_losses
у	keras_api
ф__call__
+х&call_and_return_all_conditional_losses

bkernel
cbias
!ц_jit_compiled_convolution_op*
ѕ
ч	variables
шtrainable_variables
щregularization_losses
ъ	keras_api
ы__call__
+ь&call_and_return_all_conditional_losses

dkernel
ebias
!э_jit_compiled_convolution_op*
 
f0
g1
h2
i3*
 
f0
g1
h2
i3*
* 
Ю
юnon_trainable_variables
€layers
Аmetrics
 Бlayer_regularization_losses
Вlayer_metrics
ґ	variables
Јtrainable_variables
Єregularization_losses
Ї__call__
+ї&call_and_return_all_conditional_losses
'ї"call_and_return_conditional_losses*
* 
* 
ѕ
Г	variables
Дtrainable_variables
Еregularization_losses
Ж	keras_api
З__call__
+И&call_and_return_all_conditional_losses

fkernel
gbias
!Й_jit_compiled_convolution_op*
ѕ
К	variables
Лtrainable_variables
Мregularization_losses
Н	keras_api
О__call__
+П&call_and_return_all_conditional_losses

hkernel
ibias
!Р_jit_compiled_convolution_op*
* 
* 
* 
Ь
Сnon_trainable_variables
Тlayers
Уmetrics
 Фlayer_regularization_losses
Хlayer_metrics
Њ	variables
њtrainable_variables
јregularization_losses
¬__call__
+√&call_and_return_all_conditional_losses
'√"call_and_return_conditional_losses* 

Цtrace_0* 

Чtrace_0* 
* 
* 
* 
Ь
Шnon_trainable_variables
Щlayers
Ъmetrics
 Ыlayer_regularization_losses
Ьlayer_metrics
ƒ	variables
≈trainable_variables
∆regularization_losses
»__call__
+…&call_and_return_all_conditional_losses
'…"call_and_return_conditional_losses* 

Эtrace_0* 

Юtrace_0* 
* 
* 
* 
Ь
Яnon_trainable_variables
†layers
°metrics
 Ґlayer_regularization_losses
£layer_metrics
 	variables
Ћtrainable_variables
ћregularization_losses
ќ__call__
+ѕ&call_and_return_all_conditional_losses
'ѕ"call_and_return_conditional_losses* 

§trace_0* 

•trace_0* 
* 
	
'0* 
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
Ь
¶non_trainable_variables
Іlayers
®metrics
 ©layer_regularization_losses
™layer_metrics
ў	variables
Џtrainable_variables
џregularization_losses
Ё__call__
+ё&call_and_return_all_conditional_losses
'ё"call_and_return_conditional_losses* 

Ђtrace_0* 

ђtrace_0* 
* 

.0*
* 
* 
* 
* 
* 
* 
* 

j0
k1*

j0
k1*
* 
Ю
≠non_trainable_variables
Ѓlayers
ѓmetrics
 ∞layer_regularization_losses
±layer_metrics
и	variables
йtrainable_variables
кregularization_losses
м__call__
+н&call_and_return_all_conditional_losses
'н"call_and_return_conditional_losses*

≤trace_0* 

≥trace_0* 
* 

50*
* 
* 
* 
* 
* 

l0*

l0*
* 
Ю
іnon_trainable_variables
µlayers
ґmetrics
 Јlayer_regularization_losses
Єlayer_metrics
х	variables
цtrainable_variables
чregularization_losses
щ__call__
+ъ&call_and_return_all_conditional_losses
'ъ"call_and_return_conditional_losses*
* 
* 
* 

<0
=1*
* 
* 
* 
* 
* 
* 
* 
<
m0
n1
o2
p3
q4
r5
s6
t7*
<
m0
n1
o2
p3
q4
r5
s6
t7*
* 
Ю
єnon_trainable_variables
Їlayers
їmetrics
 Љlayer_regularization_losses
љlayer_metrics
Д	variables
Еtrainable_variables
Жregularization_losses
И__call__
+Й&call_and_return_all_conditional_losses
'Й"call_and_return_conditional_losses*
* 
* 
я
Њ	variables
њtrainable_variables
јregularization_losses
Ѕ	keras_api
¬__call__
+√&call_and_return_all_conditional_losses
ƒpartial_output_shape
≈full_output_shape

mkernel
nbias*
я
∆	variables
«trainable_variables
»regularization_losses
…	keras_api
 __call__
+Ћ&call_and_return_all_conditional_losses
ћpartial_output_shape
Ќfull_output_shape

okernel
pbias*
я
ќ	variables
ѕtrainable_variables
–regularization_losses
—	keras_api
“__call__
+”&call_and_return_all_conditional_losses
‘partial_output_shape
’full_output_shape

qkernel
rbias*
Ф
÷	variables
„trainable_variables
Ўregularization_losses
ў	keras_api
Џ__call__
+џ&call_and_return_all_conditional_losses* 
ђ
№	variables
Ёtrainable_variables
ёregularization_losses
я	keras_api
а__call__
+б&call_and_return_all_conditional_losses
в_random_generator* 
я
г	variables
дtrainable_variables
еregularization_losses
ж	keras_api
з__call__
+и&call_and_return_all_conditional_losses
йpartial_output_shape
кfull_output_shape

skernel
tbias*
ђ
л	variables
мtrainable_variables
нregularization_losses
о	keras_api
п__call__
+р&call_and_return_all_conditional_losses

ukernel
vbias*
ђ
с	variables
тtrainable_variables
уregularization_losses
ф	keras_api
х__call__
+ц&call_and_return_all_conditional_losses

wkernel
xbias*
 
u0
v1
w2
x3*
 
u0
v1
w2
x3*
* 
Ю
чnon_trainable_variables
шlayers
щmetrics
 ъlayer_regularization_losses
ыlayer_metrics
Т	variables
Уtrainable_variables
Фregularization_losses
Ц__call__
+Ч&call_and_return_all_conditional_losses
'Ч"call_and_return_conditional_losses*
:
ьtrace_0
эtrace_1
юtrace_2
€trace_3* 
:
Аtrace_0
Бtrace_1
Вtrace_2
Гtrace_3* 
* 

D0
E1*
* 
* 
* 
* 
* 
* 
* 
=
y0
z1
{2
|3
}4
~5
6
А7*
=
y0
z1
{2
|3
}4
~5
6
А7*
* 
Ю
Дnon_trainable_variables
Еlayers
Жmetrics
 Зlayer_regularization_losses
Иlayer_metrics
°	variables
Ґtrainable_variables
£regularization_losses
•__call__
+¶&call_and_return_all_conditional_losses
'¶"call_and_return_conditional_losses*
* 
* 
я
Й	variables
Кtrainable_variables
Лregularization_losses
М	keras_api
Н__call__
+О&call_and_return_all_conditional_losses
Пpartial_output_shape
Рfull_output_shape

ykernel
zbias*
я
С	variables
Тtrainable_variables
Уregularization_losses
Ф	keras_api
Х__call__
+Ц&call_and_return_all_conditional_losses
Чpartial_output_shape
Шfull_output_shape

{kernel
|bias*
я
Щ	variables
Ъtrainable_variables
Ыregularization_losses
Ь	keras_api
Э__call__
+Ю&call_and_return_all_conditional_losses
Яpartial_output_shape
†full_output_shape

}kernel
~bias*
Ф
°	variables
Ґtrainable_variables
£regularization_losses
§	keras_api
•__call__
+¶&call_and_return_all_conditional_losses* 
ђ
І	variables
®trainable_variables
©regularization_losses
™	keras_api
Ђ__call__
+ђ&call_and_return_all_conditional_losses
≠_random_generator* 
а
Ѓ	variables
ѓtrainable_variables
∞regularization_losses
±	keras_api
≤__call__
+≥&call_and_return_all_conditional_losses
іpartial_output_shape
µfull_output_shape

kernel
	Аbias*
Ѓ
ґ	variables
Јtrainable_variables
Єregularization_losses
є	keras_api
Ї__call__
+ї&call_and_return_all_conditional_losses
Бkernel
	Вbias*
Ѓ
Љ	variables
љtrainable_variables
Њregularization_losses
њ	keras_api
ј__call__
+Ѕ&call_and_return_all_conditional_losses
Гkernel
	Дbias*
$
Б0
В1
Г2
Д3*
$
Б0
В1
Г2
Д3*
* 
Ю
¬non_trainable_variables
√layers
ƒmetrics
 ≈layer_regularization_losses
∆layer_metrics
ѓ	variables
∞trainable_variables
±regularization_losses
≥__call__
+і&call_and_return_all_conditional_losses
'і"call_and_return_conditional_losses*
:
«trace_0
»trace_1
…trace_2
 trace_3* 
:
Ћtrace_0
ћtrace_1
Ќtrace_2
ќtrace_3* 
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
ѕ	variables
–	keras_api

—total

“count*
M
”	variables
‘	keras_api

’total

÷count
„
_fn_kwargs*
* 

•0*
* 
* 
* 

\0
]1*

\0
]1*
* 
Ю
Ўnon_trainable_variables
ўlayers
Џmetrics
 џlayer_regularization_losses
№layer_metrics
—	variables
“trainable_variables
”regularization_losses
’__call__
+÷&call_and_return_all_conditional_losses
'÷"call_and_return_conditional_losses*
* 
* 
* 
* 

ђ0
≠1*
* 
* 
* 

^0
_1*

^0
_1*
* 
Ю
Ёnon_trainable_variables
ёlayers
яmetrics
 аlayer_regularization_losses
бlayer_metrics
Ё	variables
ёtrainable_variables
яregularization_losses
б__call__
+в&call_and_return_all_conditional_losses
'в"call_and_return_conditional_losses*
* 
* 
* 

`0
a1*

`0
a1*
* 
Ю
вnon_trainable_variables
гlayers
дmetrics
 еlayer_regularization_losses
жlayer_metrics
д	variables
еtrainable_variables
жregularization_losses
и__call__
+й&call_and_return_all_conditional_losses
'й"call_and_return_conditional_losses*
* 
* 
* 
* 

і0
µ1*
* 
* 
* 

b0
c1*

b0
c1*
* 
Ю
зnon_trainable_variables
иlayers
йmetrics
 кlayer_regularization_losses
лlayer_metrics
р	variables
сtrainable_variables
тregularization_losses
ф__call__
+х&call_and_return_all_conditional_losses
'х"call_and_return_conditional_losses*
* 
* 
* 

d0
e1*

d0
e1*
* 
Ю
мnon_trainable_variables
нlayers
оmetrics
 пlayer_regularization_losses
рlayer_metrics
ч	variables
шtrainable_variables
щregularization_losses
ы__call__
+ь&call_and_return_all_conditional_losses
'ь"call_and_return_conditional_losses*
* 
* 
* 
* 

Љ0
љ1*
* 
* 
* 

f0
g1*

f0
g1*
* 
Ю
сnon_trainable_variables
тlayers
уmetrics
 фlayer_regularization_losses
хlayer_metrics
Г	variables
Дtrainable_variables
Еregularization_losses
З__call__
+И&call_and_return_all_conditional_losses
'И"call_and_return_conditional_losses*
* 
* 
* 

h0
i1*

h0
i1*
* 
Ю
цnon_trainable_variables
чlayers
шmetrics
 щlayer_regularization_losses
ъlayer_metrics
К	variables
Лtrainable_variables
Мregularization_losses
О__call__
+П&call_and_return_all_conditional_losses
'П"call_and_return_conditional_losses*
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
4
К0
Л1
М2
Н3
О4
П5*
* 
* 
* 

m0
n1*

m0
n1*
* 
Ю
ыnon_trainable_variables
ьlayers
эmetrics
 юlayer_regularization_losses
€layer_metrics
Њ	variables
њtrainable_variables
јregularization_losses
¬__call__
+√&call_and_return_all_conditional_losses
'√"call_and_return_conditional_losses*
* 
* 
* 
* 

o0
p1*

o0
p1*
* 
Ю
Аnon_trainable_variables
Бlayers
Вmetrics
 Гlayer_regularization_losses
Дlayer_metrics
∆	variables
«trainable_variables
»regularization_losses
 __call__
+Ћ&call_and_return_all_conditional_losses
'Ћ"call_and_return_conditional_losses*
* 
* 
* 
* 

q0
r1*

q0
r1*
* 
Ю
Еnon_trainable_variables
Жlayers
Зmetrics
 Иlayer_regularization_losses
Йlayer_metrics
ќ	variables
ѕtrainable_variables
–regularization_losses
“__call__
+”&call_and_return_all_conditional_losses
'”"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
* 
* 
Ь
Кnon_trainable_variables
Лlayers
Мmetrics
 Нlayer_regularization_losses
Оlayer_metrics
÷	variables
„trainable_variables
Ўregularization_losses
Џ__call__
+џ&call_and_return_all_conditional_losses
'џ"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 
Ь
Пnon_trainable_variables
Рlayers
Сmetrics
 Тlayer_regularization_losses
Уlayer_metrics
№	variables
Ёtrainable_variables
ёregularization_losses
а__call__
+б&call_and_return_all_conditional_losses
'б"call_and_return_conditional_losses* 
* 
* 
* 

s0
t1*

s0
t1*
* 
Ю
Фnon_trainable_variables
Хlayers
Цmetrics
 Чlayer_regularization_losses
Шlayer_metrics
г	variables
дtrainable_variables
еregularization_losses
з__call__
+и&call_and_return_all_conditional_losses
'и"call_and_return_conditional_losses*
* 
* 
* 
* 

u0
v1*

u0
v1*
* 
Ю
Щnon_trainable_variables
Ъlayers
Ыmetrics
 Ьlayer_regularization_losses
Эlayer_metrics
л	variables
мtrainable_variables
нregularization_losses
п__call__
+р&call_and_return_all_conditional_losses
'р"call_and_return_conditional_losses*

Юtrace_0* 

Яtrace_0* 

w0
x1*

w0
x1*
* 
Ю
†non_trainable_variables
°layers
Ґmetrics
 £layer_regularization_losses
§layer_metrics
с	variables
тtrainable_variables
уregularization_losses
х__call__
+ц&call_and_return_all_conditional_losses
'ц"call_and_return_conditional_losses*

•trace_0* 

¶trace_0* 
* 

Р0
С1*
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
4
І0
®1
©2
™3
Ђ4
ђ5*
* 
* 
* 

y0
z1*

y0
z1*
* 
Ю
Іnon_trainable_variables
®layers
©metrics
 ™layer_regularization_losses
Ђlayer_metrics
Й	variables
Кtrainable_variables
Лregularization_losses
Н__call__
+О&call_and_return_all_conditional_losses
'О"call_and_return_conditional_losses*
* 
* 
* 
* 

{0
|1*

{0
|1*
* 
Ю
ђnon_trainable_variables
≠layers
Ѓmetrics
 ѓlayer_regularization_losses
∞layer_metrics
С	variables
Тtrainable_variables
Уregularization_losses
Х__call__
+Ц&call_and_return_all_conditional_losses
'Ц"call_and_return_conditional_losses*
* 
* 
* 
* 

}0
~1*

}0
~1*
* 
Ю
±non_trainable_variables
≤layers
≥metrics
 іlayer_regularization_losses
µlayer_metrics
Щ	variables
Ъtrainable_variables
Ыregularization_losses
Э__call__
+Ю&call_and_return_all_conditional_losses
'Ю"call_and_return_conditional_losses*
* 
* 
* 
* 
* 
* 
* 
Ь
ґnon_trainable_variables
Јlayers
Єmetrics
 єlayer_regularization_losses
Їlayer_metrics
°	variables
Ґtrainable_variables
£regularization_losses
•__call__
+¶&call_and_return_all_conditional_losses
'¶"call_and_return_conditional_losses* 
* 
* 
* 
* 
* 
Ь
їnon_trainable_variables
Љlayers
љmetrics
 Њlayer_regularization_losses
њlayer_metrics
І	variables
®trainable_variables
©regularization_losses
Ђ__call__
+ђ&call_and_return_all_conditional_losses
'ђ"call_and_return_conditional_losses* 
* 
* 
* 

0
А1*

0
А1*
* 
Ю
јnon_trainable_variables
Ѕlayers
¬metrics
 √layer_regularization_losses
ƒlayer_metrics
Ѓ	variables
ѓtrainable_variables
∞regularization_losses
≤__call__
+≥&call_and_return_all_conditional_losses
'≥"call_and_return_conditional_losses*
* 
* 
* 
* 

Б0
В1*

Б0
В1*
* 
Ю
≈non_trainable_variables
∆layers
«metrics
 »layer_regularization_losses
…layer_metrics
ґ	variables
Јtrainable_variables
Єregularization_losses
Ї__call__
+ї&call_and_return_all_conditional_losses
'ї"call_and_return_conditional_losses*

 trace_0* 

Ћtrace_0* 

Г0
Д1*

Г0
Д1*
* 
Ю
ћnon_trainable_variables
Ќlayers
ќmetrics
 ѕlayer_regularization_losses
–layer_metrics
Љ	variables
љtrainable_variables
Њregularization_losses
ј__call__
+Ѕ&call_and_return_all_conditional_losses
'Ѕ"call_and_return_conditional_losses*

—trace_0* 

“trace_0* 
* 

≠0
Ѓ1*
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
—0
“1*

ѕ	variables*
UO
VARIABLE_VALUEtotal_14keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_14keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

’0
÷1*

”	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE*
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
* 
* 
* 
* 
* 
* 
* 
* 
Б{
VARIABLE_VALUEAdam/dense_5/kernel/mRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdam/dense_5/bias/mPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
Б{
VARIABLE_VALUEAdam/dense_6/kernel/mRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdam/dense_6/bias/mPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
І†
VARIABLE_VALUEJAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/mBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
•Ю
VARIABLE_VALUEHAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/mBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЧР
VARIABLE_VALUE:Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/mBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ХО
VARIABLE_VALUE8Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/mBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ШС
VARIABLE_VALUE;Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/mBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЦП
VARIABLE_VALUE9Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/mBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЩТ
VARIABLE_VALUE<Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/mBvariables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЧР
VARIABLE_VALUE:Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/mBvariables/7/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЪУ
VARIABLE_VALUE=Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/mBvariables/8/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ШС
VARIABLE_VALUE;Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/mBvariables/9/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЪУ
VARIABLE_VALUE<Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/mCvariables/10/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ШС
VARIABLE_VALUE:Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/mCvariables/11/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЫФ
VARIABLE_VALUE=Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/mCvariables/12/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЩТ
VARIABLE_VALUE;Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/mCvariables/13/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUE Adam/time_distributed_1/kernel/mCvariables/14/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
{u
VARIABLE_VALUEAdam/time_distributed_1/bias/mCvariables/15/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ТЛ
VARIABLE_VALUE4Adam/frame_position_embedding/embedding/embeddings/mCvariables/16/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЪУ
VARIABLE_VALUE<Adam/transformer_layer_1/multi_head_attention/query/kernel/mCvariables/17/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ШС
VARIABLE_VALUE:Adam/transformer_layer_1/multi_head_attention/query/bias/mCvariables/18/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ШС
VARIABLE_VALUE:Adam/transformer_layer_1/multi_head_attention/key/kernel/mCvariables/19/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЦП
VARIABLE_VALUE8Adam/transformer_layer_1/multi_head_attention/key/bias/mCvariables/20/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЪУ
VARIABLE_VALUE<Adam/transformer_layer_1/multi_head_attention/value/kernel/mCvariables/21/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ШС
VARIABLE_VALUE:Adam/transformer_layer_1/multi_head_attention/value/bias/mCvariables/22/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
•Ю
VARIABLE_VALUEGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/mCvariables/23/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
£Ь
VARIABLE_VALUEEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/mCvariables/24/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/dense_1/kernel/mCvariables/25/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/dense_1/bias/mCvariables/26/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/dense_2/kernel/mCvariables/27/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/dense_2/bias/mCvariables/28/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЬХ
VARIABLE_VALUE>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/mCvariables/29/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЪУ
VARIABLE_VALUE<Adam/transformer_layer_2/multi_head_attention_1/query/bias/mCvariables/30/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЪУ
VARIABLE_VALUE<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/mCvariables/31/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ШС
VARIABLE_VALUE:Adam/transformer_layer_2/multi_head_attention_1/key/bias/mCvariables/32/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЬХ
VARIABLE_VALUE>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/mCvariables/33/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
ЪУ
VARIABLE_VALUE<Adam/transformer_layer_2/multi_head_attention_1/value/bias/mCvariables/34/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
І†
VARIABLE_VALUEIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/mCvariables/35/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
•Ю
VARIABLE_VALUEGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/mCvariables/36/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/dense_3/kernel/mCvariables/37/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/dense_3/bias/mCvariables/38/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/dense_4/kernel/mCvariables/39/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/dense_4/bias/mCvariables/40/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE*
Б{
VARIABLE_VALUEAdam/dense_5/kernel/vRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdam/dense_5/bias/vPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
Б{
VARIABLE_VALUEAdam/dense_6/kernel/vRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUEAdam/dense_6/bias/vPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
І†
VARIABLE_VALUEJAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/vBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
•Ю
VARIABLE_VALUEHAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/vBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЧР
VARIABLE_VALUE:Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/vBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ХО
VARIABLE_VALUE8Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/vBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ШС
VARIABLE_VALUE;Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/vBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЦП
VARIABLE_VALUE9Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/vBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЩТ
VARIABLE_VALUE<Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/vBvariables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЧР
VARIABLE_VALUE:Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/vBvariables/7/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЪУ
VARIABLE_VALUE=Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/vBvariables/8/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ШС
VARIABLE_VALUE;Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/vBvariables/9/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЪУ
VARIABLE_VALUE<Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/vCvariables/10/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ШС
VARIABLE_VALUE:Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/vCvariables/11/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЫФ
VARIABLE_VALUE=Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/vCvariables/12/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЩТ
VARIABLE_VALUE;Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/vCvariables/13/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
}w
VARIABLE_VALUE Adam/time_distributed_1/kernel/vCvariables/14/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
{u
VARIABLE_VALUEAdam/time_distributed_1/bias/vCvariables/15/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ТЛ
VARIABLE_VALUE4Adam/frame_position_embedding/embedding/embeddings/vCvariables/16/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЪУ
VARIABLE_VALUE<Adam/transformer_layer_1/multi_head_attention/query/kernel/vCvariables/17/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ШС
VARIABLE_VALUE:Adam/transformer_layer_1/multi_head_attention/query/bias/vCvariables/18/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ШС
VARIABLE_VALUE:Adam/transformer_layer_1/multi_head_attention/key/kernel/vCvariables/19/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЦП
VARIABLE_VALUE8Adam/transformer_layer_1/multi_head_attention/key/bias/vCvariables/20/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЪУ
VARIABLE_VALUE<Adam/transformer_layer_1/multi_head_attention/value/kernel/vCvariables/21/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ШС
VARIABLE_VALUE:Adam/transformer_layer_1/multi_head_attention/value/bias/vCvariables/22/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
•Ю
VARIABLE_VALUEGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/vCvariables/23/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
£Ь
VARIABLE_VALUEEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/vCvariables/24/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/dense_1/kernel/vCvariables/25/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/dense_1/bias/vCvariables/26/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
rl
VARIABLE_VALUEAdam/dense_2/kernel/vCvariables/27/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
pj
VARIABLE_VALUEAdam/dense_2/bias/vCvariables/28/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЬХ
VARIABLE_VALUE>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/vCvariables/29/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЪУ
VARIABLE_VALUE<Adam/transformer_layer_2/multi_head_attention_1/query/bias/vCvariables/30/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЪУ
VARIABLE_VALUE<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/vCvariables/31/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ШС
VARIABLE_VALUE:Adam/transformer_layer_2/multi_head_attention_1/key/bias/vCvariables/32/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЬХ
VARIABLE_VALUE>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/vCvariables/33/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
ЪУ
VARIABLE_VALUE<Adam/transformer_layer_2/multi_head_attention_1/value/bias/vCvariables/34/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
І†
VARIABLE_VALUEIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/vCvariables/35/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE*
•Ю
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
чM
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename"dense_5/kernel/Read/ReadVariableOp dense_5/bias/Read/ReadVariableOp"dense_6/kernel/Read/ReadVariableOp dense_6/bias/Read/ReadVariableOpWencoder3d/spatial_attention/spatial_attention_attention_conv/kernel/Read/ReadVariableOpUencoder3d/spatial_attention/spatial_attention_attention_conv/bias/Read/ReadVariableOpGencoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/Read/ReadVariableOpEencoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/Read/ReadVariableOpHencoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/Read/ReadVariableOpFencoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/Read/ReadVariableOpIencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/Read/ReadVariableOpGencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/Read/ReadVariableOpJencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/Read/ReadVariableOpHencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/Read/ReadVariableOpIencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/Read/ReadVariableOpGencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/Read/ReadVariableOpJencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/Read/ReadVariableOpHencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/Read/ReadVariableOp-time_distributed_1/kernel/Read/ReadVariableOp+time_distributed_1/bias/Read/ReadVariableOpAframe_position_embedding/embedding/embeddings/Read/ReadVariableOpItransformer_layer_1/multi_head_attention/query/kernel/Read/ReadVariableOpGtransformer_layer_1/multi_head_attention/query/bias/Read/ReadVariableOpGtransformer_layer_1/multi_head_attention/key/kernel/Read/ReadVariableOpEtransformer_layer_1/multi_head_attention/key/bias/Read/ReadVariableOpItransformer_layer_1/multi_head_attention/value/kernel/Read/ReadVariableOpGtransformer_layer_1/multi_head_attention/value/bias/Read/ReadVariableOpTtransformer_layer_1/multi_head_attention/attention_output/kernel/Read/ReadVariableOpRtransformer_layer_1/multi_head_attention/attention_output/bias/Read/ReadVariableOp"dense_1/kernel/Read/ReadVariableOp dense_1/bias/Read/ReadVariableOp"dense_2/kernel/Read/ReadVariableOp dense_2/bias/Read/ReadVariableOpKtransformer_layer_2/multi_head_attention_1/query/kernel/Read/ReadVariableOpItransformer_layer_2/multi_head_attention_1/query/bias/Read/ReadVariableOpItransformer_layer_2/multi_head_attention_1/key/kernel/Read/ReadVariableOpGtransformer_layer_2/multi_head_attention_1/key/bias/Read/ReadVariableOpKtransformer_layer_2/multi_head_attention_1/value/kernel/Read/ReadVariableOpItransformer_layer_2/multi_head_attention_1/value/bias/Read/ReadVariableOpVtransformer_layer_2/multi_head_attention_1/attention_output/kernel/Read/ReadVariableOpTtransformer_layer_2/multi_head_attention_1/attention_output/bias/Read/ReadVariableOp"dense_3/kernel/Read/ReadVariableOp dense_3/bias/Read/ReadVariableOp"dense_4/kernel/Read/ReadVariableOp dense_4/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOp)Adam/dense_5/kernel/m/Read/ReadVariableOp'Adam/dense_5/bias/m/Read/ReadVariableOp)Adam/dense_6/kernel/m/Read/ReadVariableOp'Adam/dense_6/bias/m/Read/ReadVariableOp^Adam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/m/Read/ReadVariableOp\Adam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/m/Read/ReadVariableOpNAdam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/m/Read/ReadVariableOpLAdam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/m/Read/ReadVariableOpOAdam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/m/Read/ReadVariableOpMAdam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/m/Read/ReadVariableOpPAdam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/m/Read/ReadVariableOpNAdam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/m/Read/ReadVariableOpQAdam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/m/Read/ReadVariableOpOAdam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/m/Read/ReadVariableOpPAdam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/m/Read/ReadVariableOpNAdam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/m/Read/ReadVariableOpQAdam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/m/Read/ReadVariableOpOAdam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/m/Read/ReadVariableOp4Adam/time_distributed_1/kernel/m/Read/ReadVariableOp2Adam/time_distributed_1/bias/m/Read/ReadVariableOpHAdam/frame_position_embedding/embedding/embeddings/m/Read/ReadVariableOpPAdam/transformer_layer_1/multi_head_attention/query/kernel/m/Read/ReadVariableOpNAdam/transformer_layer_1/multi_head_attention/query/bias/m/Read/ReadVariableOpNAdam/transformer_layer_1/multi_head_attention/key/kernel/m/Read/ReadVariableOpLAdam/transformer_layer_1/multi_head_attention/key/bias/m/Read/ReadVariableOpPAdam/transformer_layer_1/multi_head_attention/value/kernel/m/Read/ReadVariableOpNAdam/transformer_layer_1/multi_head_attention/value/bias/m/Read/ReadVariableOp[Adam/transformer_layer_1/multi_head_attention/attention_output/kernel/m/Read/ReadVariableOpYAdam/transformer_layer_1/multi_head_attention/attention_output/bias/m/Read/ReadVariableOp)Adam/dense_1/kernel/m/Read/ReadVariableOp'Adam/dense_1/bias/m/Read/ReadVariableOp)Adam/dense_2/kernel/m/Read/ReadVariableOp'Adam/dense_2/bias/m/Read/ReadVariableOpRAdam/transformer_layer_2/multi_head_attention_1/query/kernel/m/Read/ReadVariableOpPAdam/transformer_layer_2/multi_head_attention_1/query/bias/m/Read/ReadVariableOpPAdam/transformer_layer_2/multi_head_attention_1/key/kernel/m/Read/ReadVariableOpNAdam/transformer_layer_2/multi_head_attention_1/key/bias/m/Read/ReadVariableOpRAdam/transformer_layer_2/multi_head_attention_1/value/kernel/m/Read/ReadVariableOpPAdam/transformer_layer_2/multi_head_attention_1/value/bias/m/Read/ReadVariableOp]Adam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/m/Read/ReadVariableOp[Adam/transformer_layer_2/multi_head_attention_1/attention_output/bias/m/Read/ReadVariableOp)Adam/dense_3/kernel/m/Read/ReadVariableOp'Adam/dense_3/bias/m/Read/ReadVariableOp)Adam/dense_4/kernel/m/Read/ReadVariableOp'Adam/dense_4/bias/m/Read/ReadVariableOp)Adam/dense_5/kernel/v/Read/ReadVariableOp'Adam/dense_5/bias/v/Read/ReadVariableOp)Adam/dense_6/kernel/v/Read/ReadVariableOp'Adam/dense_6/bias/v/Read/ReadVariableOp^Adam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/v/Read/ReadVariableOp\Adam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/v/Read/ReadVariableOpNAdam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/v/Read/ReadVariableOpLAdam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/v/Read/ReadVariableOpOAdam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/v/Read/ReadVariableOpMAdam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/v/Read/ReadVariableOpPAdam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/v/Read/ReadVariableOpNAdam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/v/Read/ReadVariableOpQAdam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/v/Read/ReadVariableOpOAdam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/v/Read/ReadVariableOpPAdam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/v/Read/ReadVariableOpNAdam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/v/Read/ReadVariableOpQAdam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/v/Read/ReadVariableOpOAdam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/v/Read/ReadVariableOp4Adam/time_distributed_1/kernel/v/Read/ReadVariableOp2Adam/time_distributed_1/bias/v/Read/ReadVariableOpHAdam/frame_position_embedding/embedding/embeddings/v/Read/ReadVariableOpPAdam/transformer_layer_1/multi_head_attention/query/kernel/v/Read/ReadVariableOpNAdam/transformer_layer_1/multi_head_attention/query/bias/v/Read/ReadVariableOpNAdam/transformer_layer_1/multi_head_attention/key/kernel/v/Read/ReadVariableOpLAdam/transformer_layer_1/multi_head_attention/key/bias/v/Read/ReadVariableOpPAdam/transformer_layer_1/multi_head_attention/value/kernel/v/Read/ReadVariableOpNAdam/transformer_layer_1/multi_head_attention/value/bias/v/Read/ReadVariableOp[Adam/transformer_layer_1/multi_head_attention/attention_output/kernel/v/Read/ReadVariableOpYAdam/transformer_layer_1/multi_head_attention/attention_output/bias/v/Read/ReadVariableOp)Adam/dense_1/kernel/v/Read/ReadVariableOp'Adam/dense_1/bias/v/Read/ReadVariableOp)Adam/dense_2/kernel/v/Read/ReadVariableOp'Adam/dense_2/bias/v/Read/ReadVariableOpRAdam/transformer_layer_2/multi_head_attention_1/query/kernel/v/Read/ReadVariableOpPAdam/transformer_layer_2/multi_head_attention_1/query/bias/v/Read/ReadVariableOpPAdam/transformer_layer_2/multi_head_attention_1/key/kernel/v/Read/ReadVariableOpNAdam/transformer_layer_2/multi_head_attention_1/key/bias/v/Read/ReadVariableOpRAdam/transformer_layer_2/multi_head_attention_1/value/kernel/v/Read/ReadVariableOpPAdam/transformer_layer_2/multi_head_attention_1/value/bias/v/Read/ReadVariableOp]Adam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/v/Read/ReadVariableOp[Adam/transformer_layer_2/multi_head_attention_1/attention_output/bias/v/Read/ReadVariableOp)Adam/dense_3/kernel/v/Read/ReadVariableOp'Adam/dense_3/bias/v/Read/ReadVariableOp)Adam/dense_4/kernel/v/Read/ReadVariableOp'Adam/dense_4/bias/v/Read/ReadVariableOpConst*†
TinШ
Х2Т	*
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
GPU2*0J 8В *'
f"R 
__inference__traced_save_28316
≤7
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamedense_5/kerneldense_5/biasdense_6/kerneldense_6/biasCencoder3d/spatial_attention/spatial_attention_attention_conv/kernelAencoder3d/spatial_attention/spatial_attention_attention_conv/bias3encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel1encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias4encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel2encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias5encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel3encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias6encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel4encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias5encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel3encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias6encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel4encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/biastime_distributed_1/kerneltime_distributed_1/bias-frame_position_embedding/embedding/embeddings5transformer_layer_1/multi_head_attention/query/kernel3transformer_layer_1/multi_head_attention/query/bias3transformer_layer_1/multi_head_attention/key/kernel1transformer_layer_1/multi_head_attention/key/bias5transformer_layer_1/multi_head_attention/value/kernel3transformer_layer_1/multi_head_attention/value/bias@transformer_layer_1/multi_head_attention/attention_output/kernel>transformer_layer_1/multi_head_attention/attention_output/biasdense_1/kerneldense_1/biasdense_2/kerneldense_2/bias7transformer_layer_2/multi_head_attention_1/query/kernel5transformer_layer_2/multi_head_attention_1/query/bias5transformer_layer_2/multi_head_attention_1/key/kernel3transformer_layer_2/multi_head_attention_1/key/bias7transformer_layer_2/multi_head_attention_1/value/kernel5transformer_layer_2/multi_head_attention_1/value/biasBtransformer_layer_2/multi_head_attention_1/attention_output/kernel@transformer_layer_2/multi_head_attention_1/attention_output/biasdense_3/kerneldense_3/biasdense_4/kerneldense_4/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotal_1count_1totalcountAdam/dense_5/kernel/mAdam/dense_5/bias/mAdam/dense_6/kernel/mAdam/dense_6/bias/mJAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/mHAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/m:Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/m8Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/m;Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/m9Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/m<Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/m:Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/m=Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/m;Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/m<Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/m:Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/m=Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/m;Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/m Adam/time_distributed_1/kernel/mAdam/time_distributed_1/bias/m4Adam/frame_position_embedding/embedding/embeddings/m<Adam/transformer_layer_1/multi_head_attention/query/kernel/m:Adam/transformer_layer_1/multi_head_attention/query/bias/m:Adam/transformer_layer_1/multi_head_attention/key/kernel/m8Adam/transformer_layer_1/multi_head_attention/key/bias/m<Adam/transformer_layer_1/multi_head_attention/value/kernel/m:Adam/transformer_layer_1/multi_head_attention/value/bias/mGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/mEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/mAdam/dense_1/kernel/mAdam/dense_1/bias/mAdam/dense_2/kernel/mAdam/dense_2/bias/m>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/m<Adam/transformer_layer_2/multi_head_attention_1/query/bias/m<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/m:Adam/transformer_layer_2/multi_head_attention_1/key/bias/m>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/m<Adam/transformer_layer_2/multi_head_attention_1/value/bias/mIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/mGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/mAdam/dense_3/kernel/mAdam/dense_3/bias/mAdam/dense_4/kernel/mAdam/dense_4/bias/mAdam/dense_5/kernel/vAdam/dense_5/bias/vAdam/dense_6/kernel/vAdam/dense_6/bias/vJAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/vHAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/v:Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/v8Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/v;Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/v9Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/v<Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/v:Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/v=Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/v;Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/v<Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/v:Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/v=Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/v;Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/v Adam/time_distributed_1/kernel/vAdam/time_distributed_1/bias/v4Adam/frame_position_embedding/embedding/embeddings/v<Adam/transformer_layer_1/multi_head_attention/query/kernel/v:Adam/transformer_layer_1/multi_head_attention/query/bias/v:Adam/transformer_layer_1/multi_head_attention/key/kernel/v8Adam/transformer_layer_1/multi_head_attention/key/bias/v<Adam/transformer_layer_1/multi_head_attention/value/kernel/v:Adam/transformer_layer_1/multi_head_attention/value/bias/vGAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/vEAdam/transformer_layer_1/multi_head_attention/attention_output/bias/vAdam/dense_1/kernel/vAdam/dense_1/bias/vAdam/dense_2/kernel/vAdam/dense_2/bias/v>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/v<Adam/transformer_layer_2/multi_head_attention_1/query/bias/v<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/v:Adam/transformer_layer_2/multi_head_attention_1/key/bias/v>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/v<Adam/transformer_layer_2/multi_head_attention_1/value/bias/vIAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/vGAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/vAdam/dense_3/kernel/vAdam/dense_3/bias/vAdam/dense_4/kernel/vAdam/dense_4/bias/v*Я
TinЧ
Ф2С*
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
GPU2*0J 8В **
f%R#
!__inference__traced_restore_28758ЯЋ+
Ѓ
ќ
3__inference_transformer_layer_2_layer_call_fn_27064

inputs
unknown:@@
	unknown_0:@
	unknown_1:@@
	unknown_2:@
	unknown_3:@@
	unknown_4:@
	unknown_5:@@
	unknown_6:@
	unknown_7:	@А
	unknown_8:	А
	unknown_9:	А@

unknown_10:@
identityИҐStatefulPartitionedCallн
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_24769s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:€€€€€€€€€@: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
€D
„
E__inference_sequential_layer_call_and_return_conditional_losses_27471

inputs<
)dense_1_tensordot_readvariableop_resource:	@А6
'dense_1_biasadd_readvariableop_resource:	А<
)dense_2_tensordot_readvariableop_resource:	А@5
'dense_2_biasadd_readvariableop_resource:@
identityИҐdense_1/BiasAdd/ReadVariableOpҐ dense_1/Tensordot/ReadVariableOpҐdense_2/BiasAdd/ReadVariableOpҐ dense_2/Tensordot/ReadVariableOpЛ
 dense_1/Tensordot/ReadVariableOpReadVariableOp)dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : џ
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
value	B : я
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
valueB: Ж
dense_1/Tensordot/ProdProd#dense_1/Tensordot/GatherV2:output:0 dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: М
dense_1/Tensordot/Prod_1Prod%dense_1/Tensordot/GatherV2_1:output:0"dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Љ
dense_1/Tensordot/concatConcatV2dense_1/Tensordot/free:output:0dense_1/Tensordot/axes:output:0&dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:С
dense_1/Tensordot/stackPackdense_1/Tensordot/Prod:output:0!dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Й
dense_1/Tensordot/transpose	Transposeinputs!dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Ґ
dense_1/Tensordot/ReshapeReshapedense_1/Tensordot/transpose:y:0 dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€£
dense_1/Tensordot/MatMulMatMul"dense_1/Tensordot/Reshape:output:0(dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€Аd
dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Аa
dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : «
dense_1/Tensordot/concat_1ConcatV2#dense_1/Tensordot/GatherV2:output:0"dense_1/Tensordot/Const_2:output:0(dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ь
dense_1/TensordotReshape"dense_1/Tensordot/MatMul:product:0#dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АГ
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Х
dense_1/BiasAddBiasAdddense_1/Tensordot:output:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€АW
dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Е
dense_1/Gelu/mulMuldense_1/Gelu/mul/x:output:0dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€АX
dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?О
dense_1/Gelu/truedivRealDivdense_1/BiasAdd:output:0dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аh
dense_1/Gelu/ErfErfdense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€АW
dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Г
dense_1/Gelu/addAddV2dense_1/Gelu/add/x:output:0dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€А|
dense_1/Gelu/mul_1Muldense_1/Gelu/mul:z:0dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€АЛ
 dense_2/Tensordot/ReadVariableOpReadVariableOp)dense_2_tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : џ
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
value	B : я
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
valueB: Ж
dense_2/Tensordot/ProdProd#dense_2/Tensordot/GatherV2:output:0 dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: М
dense_2/Tensordot/Prod_1Prod%dense_2/Tensordot/GatherV2_1:output:0"dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Љ
dense_2/Tensordot/concatConcatV2dense_2/Tensordot/free:output:0dense_2/Tensordot/axes:output:0&dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:С
dense_2/Tensordot/stackPackdense_2/Tensordot/Prod:output:0!dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Ъ
dense_2/Tensordot/transpose	Transposedense_1/Gelu/mul_1:z:0!dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€АҐ
dense_2/Tensordot/ReshapeReshapedense_2/Tensordot/transpose:y:0 dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Ґ
dense_2/Tensordot/MatMulMatMul"dense_2/Tensordot/Reshape:output:0(dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@c
dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@a
dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : «
dense_2/Tensordot/concat_1ConcatV2#dense_2/Tensordot/GatherV2:output:0"dense_2/Tensordot/Const_2:output:0(dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ы
dense_2/TensordotReshape"dense_2/Tensordot/MatMul:product:0#dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@В
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Ф
dense_2/BiasAddBiasAdddense_2/Tensordot:output:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@k
IdentityIdentitydense_2/BiasAdd:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@ќ
NoOpNoOp^dense_1/BiasAdd/ReadVariableOp!^dense_1/Tensordot/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp!^dense_2/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2D
 dense_1/Tensordot/ReadVariableOp dense_1/Tensordot/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2D
 dense_2/Tensordot/ReadVariableOp dense_2/Tensordot/ReadVariableOp:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
јЖ
И
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_27006

inputsV
@multi_head_attention_query_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_query_add_readvariableop_resource:@T
>multi_head_attention_key_einsum_einsum_readvariableop_resource:@@F
4multi_head_attention_key_add_readvariableop_resource:@V
@multi_head_attention_value_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_value_add_readvariableop_resource:@a
Kmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource:@@O
Amulti_head_attention_attention_output_add_readvariableop_resource:@G
4sequential_dense_1_tensordot_readvariableop_resource:	@АA
2sequential_dense_1_biasadd_readvariableop_resource:	АG
4sequential_dense_2_tensordot_readvariableop_resource:	А@@
2sequential_dense_2_biasadd_readvariableop_resource:@
identityИҐ8multi_head_attention/attention_output/add/ReadVariableOpҐBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpҐ+multi_head_attention/key/add/ReadVariableOpҐ5multi_head_attention/key/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/query/add/ReadVariableOpҐ7multi_head_attention/query/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/value/add/ReadVariableOpҐ7multi_head_attention/value/einsum/Einsum/ReadVariableOpҐ)sequential/dense_1/BiasAdd/ReadVariableOpҐ+sequential/dense_1/Tensordot/ReadVariableOpҐ)sequential/dense_2/BiasAdd/ReadVariableOpҐ+sequential/dense_2/Tensordot/ReadVariableOpЉ
7multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0џ
(multi_head_attention/query/einsum/EinsumEinsuminputs?multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde§
-multi_head_attention/query/add/ReadVariableOpReadVariableOp6multi_head_attention_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ћ
multi_head_attention/query/addAddV21multi_head_attention/query/einsum/Einsum:output:05multi_head_attention/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@Є
5multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOp>multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0„
&multi_head_attention/key/einsum/EinsumEinsuminputs=multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde†
+multi_head_attention/key/add/ReadVariableOpReadVariableOp4multi_head_attention_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0≈
multi_head_attention/key/addAddV2/multi_head_attention/key/einsum/Einsum:output:03multi_head_attention/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@Љ
7multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0џ
(multi_head_attention/value/einsum/EinsumEinsuminputs?multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde§
-multi_head_attention/value/add/ReadVariableOpReadVariableOp6multi_head_attention_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ћ
multi_head_attention/value/addAddV21multi_head_attention/value/einsum/Einsum:output:05multi_head_attention/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@_
multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >Ґ
multi_head_attention/MulMul"multi_head_attention/query/add:z:0#multi_head_attention/Mul/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€@ќ
"multi_head_attention/einsum/EinsumEinsum multi_head_attention/key/add:z:0multi_head_attention/Mul:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€*
equationaecd,abcd->acbeЦ
$multi_head_attention/softmax/SoftmaxSoftmax+multi_head_attention/einsum/Einsum:output:0*
T0*/
_output_shapes
:€€€€€€€€€д
$multi_head_attention/einsum_1/EinsumEinsum.multi_head_attention/softmax/Softmax:softmax:0"multi_head_attention/value/add:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationacbe,aecd->abcd“
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpKmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ф
3multi_head_attention/attention_output/einsum/EinsumEinsum-multi_head_attention/einsum_1/Einsum:output:0Jmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:€€€€€€€€€@*
equationabcd,cde->abeґ
8multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpAmulti_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0и
)multi_head_attention/attention_output/addAddV2<multi_head_attention/attention_output/einsum/Einsum:output:0@multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@y
addAddV2inputs-multi_head_attention/attention_output/add:z:0*
T0*+
_output_shapes
:€€€€€€€€€@°
+sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : З
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
value	B : Л
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
valueB: І
!sequential/dense_1/Tensordot/ProdProd.sequential/dense_1/Tensordot/GatherV2:output:0+sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≠
#sequential/dense_1/Tensordot/Prod_1Prod0sequential/dense_1/Tensordot/GatherV2_1:output:0-sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : и
#sequential/dense_1/Tensordot/concatConcatV2*sequential/dense_1/Tensordot/free:output:0*sequential/dense_1/Tensordot/axes:output:01sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:≤
"sequential/dense_1/Tensordot/stackPack*sequential/dense_1/Tensordot/Prod:output:0,sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:†
&sequential/dense_1/Tensordot/transpose	Transposeadd:z:0,sequential/dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@√
$sequential/dense_1/Tensordot/ReshapeReshape*sequential/dense_1/Tensordot/transpose:y:0+sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€ƒ
#sequential/dense_1/Tensordot/MatMulMatMul-sequential/dense_1/Tensordot/Reshape:output:03sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€Аo
$sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Аl
*sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : у
%sequential/dense_1/Tensordot/concat_1ConcatV2.sequential/dense_1/Tensordot/GatherV2:output:0-sequential/dense_1/Tensordot/Const_2:output:03sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:љ
sequential/dense_1/TensordotReshape-sequential/dense_1/Tensordot/MatMul:product:0.sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АЩ
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0ґ
sequential/dense_1/BiasAddBiasAdd%sequential/dense_1/Tensordot:output:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€Аb
sequential/dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?¶
sequential/dense_1/Gelu/mulMul&sequential/dense_1/Gelu/mul/x:output:0#sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аc
sequential/dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?ѓ
sequential/dense_1/Gelu/truedivRealDiv#sequential/dense_1/BiasAdd:output:0'sequential/dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€А~
sequential/dense_1/Gelu/ErfErf#sequential/dense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аb
sequential/dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?§
sequential/dense_1/Gelu/addAddV2&sequential/dense_1/Gelu/add/x:output:0sequential/dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€АЭ
sequential/dense_1/Gelu/mul_1Mulsequential/dense_1/Gelu/mul:z:0sequential/dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€А°
+sequential/dense_2/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_2_tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : З
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
value	B : Л
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
valueB: І
!sequential/dense_2/Tensordot/ProdProd.sequential/dense_2/Tensordot/GatherV2:output:0+sequential/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≠
#sequential/dense_2/Tensordot/Prod_1Prod0sequential/dense_2/Tensordot/GatherV2_1:output:0-sequential/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : и
#sequential/dense_2/Tensordot/concatConcatV2*sequential/dense_2/Tensordot/free:output:0*sequential/dense_2/Tensordot/axes:output:01sequential/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:≤
"sequential/dense_2/Tensordot/stackPack*sequential/dense_2/Tensordot/Prod:output:0,sequential/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:ї
&sequential/dense_2/Tensordot/transpose	Transpose!sequential/dense_1/Gelu/mul_1:z:0,sequential/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€А√
$sequential/dense_2/Tensordot/ReshapeReshape*sequential/dense_2/Tensordot/transpose:y:0+sequential/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€√
#sequential/dense_2/Tensordot/MatMulMatMul-sequential/dense_2/Tensordot/Reshape:output:03sequential/dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@n
$sequential/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@l
*sequential/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : у
%sequential/dense_2/Tensordot/concat_1ConcatV2.sequential/dense_2/Tensordot/GatherV2:output:0-sequential/dense_2/Tensordot/Const_2:output:03sequential/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Љ
sequential/dense_2/TensordotReshape-sequential/dense_2/Tensordot/MatMul:product:0.sequential/dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Ш
)sequential/dense_2/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0µ
sequential/dense_2/BiasAddBiasAdd%sequential/dense_2/Tensordot:output:01sequential/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@r
add_1AddV2add:z:0#sequential/dense_2/BiasAdd:output:0*
T0*+
_output_shapes
:€€€€€€€€€@\
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@і
NoOpNoOp9^multi_head_attention/attention_output/add/ReadVariableOpC^multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp,^multi_head_attention/key/add/ReadVariableOp6^multi_head_attention/key/einsum/Einsum/ReadVariableOp.^multi_head_attention/query/add/ReadVariableOp8^multi_head_attention/query/einsum/Einsum/ReadVariableOp.^multi_head_attention/value/add/ReadVariableOp8^multi_head_attention/value/einsum/Einsum/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp,^sequential/dense_1/Tensordot/ReadVariableOp*^sequential/dense_2/BiasAdd/ReadVariableOp,^sequential/dense_2/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:€€€€€€€€€@: : : : : : : : : : : : 2t
8multi_head_attention/attention_output/add/ReadVariableOp8multi_head_attention/attention_output/add/ReadVariableOp2И
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
:€€€€€€€€€@
 
_user_specified_nameinputs
ДE
ф
@__inference_model_layer_call_and_return_conditional_losses_25196

inputs-
encoder3d_25092:
encoder3d_25094:-
encoder3d_25096: 
encoder3d_25098: -
encoder3d_25100:  
encoder3d_25102: -
encoder3d_25104: @
encoder3d_25106:@-
encoder3d_25108:@@
encoder3d_25110:@.
encoder3d_25112:@А
encoder3d_25114:	А/
encoder3d_25116:АА
encoder3d_25118:	А+
time_distributed_1_25124:	А@&
time_distributed_1_25126:@0
frame_position_embedding_25131:@/
transformer_layer_1_25134:@@+
transformer_layer_1_25136:@/
transformer_layer_1_25138:@@+
transformer_layer_1_25140:@/
transformer_layer_1_25142:@@+
transformer_layer_1_25144:@/
transformer_layer_1_25146:@@'
transformer_layer_1_25148:@,
transformer_layer_1_25150:	@А(
transformer_layer_1_25152:	А,
transformer_layer_1_25154:	А@'
transformer_layer_1_25156:@/
transformer_layer_2_25159:@@+
transformer_layer_2_25161:@/
transformer_layer_2_25163:@@+
transformer_layer_2_25165:@/
transformer_layer_2_25167:@@+
transformer_layer_2_25169:@/
transformer_layer_2_25171:@@'
transformer_layer_2_25173:@,
transformer_layer_2_25175:	@А(
transformer_layer_2_25177:	А,
transformer_layer_2_25179:	А@'
transformer_layer_2_25181:@ 
dense_5_25185:	А
@
dense_5_25187:@
dense_6_25190:@

dense_6_25192:

identityИҐdense_5/StatefulPartitionedCallҐdense_6/StatefulPartitionedCallҐ!encoder3d/StatefulPartitionedCallҐ0frame_position_embedding/StatefulPartitionedCallҐ*time_distributed_1/StatefulPartitionedCallҐ+transformer_layer_1/StatefulPartitionedCallҐ+transformer_layer_2/StatefulPartitionedCallе
!encoder3d/StatefulPartitionedCallStatefulPartitionedCallinputsencoder3d_25092encoder3d_25094encoder3d_25096encoder3d_25098encoder3d_25100encoder3d_25102encoder3d_25104encoder3d_25106encoder3d_25108encoder3d_25110encoder3d_25112encoder3d_25114encoder3d_25116encoder3d_25118*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :€€€€€€€€€А*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_encoder3d_layer_call_and_return_conditional_losses_24167у
 time_distributed/PartitionedCallPartitionedCall*encoder3d/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *T
fORM
K__inference_time_distributed_layer_call_and_return_conditional_losses_23604w
time_distributed/Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"€€€€      А   ≥
time_distributed/ReshapeReshape*encoder3d/StatefulPartitionedCall:output:0'time_distributed/Reshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€Ањ
*time_distributed_1/StatefulPartitionedCallStatefulPartitionedCall)time_distributed/PartitionedCall:output:0time_distributed_1_25124time_distributed_1_25126*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *V
fQRO
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_23689q
 time_distributed_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"€€€€   Ѓ
time_distributed_1/ReshapeReshape)time_distributed/PartitionedCall:output:0)time_distributed_1/Reshape/shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€Ањ
0frame_position_embedding/StatefulPartitionedCallStatefulPartitionedCall3time_distributed_1/StatefulPartitionedCall:output:0frame_position_embedding_25131*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *\
fWRU
S__inference_frame_position_embedding_layer_call_and_return_conditional_losses_24225х
+transformer_layer_1/StatefulPartitionedCallStatefulPartitionedCall9frame_position_embedding/StatefulPartitionedCall:output:0transformer_layer_1_25134transformer_layer_1_25136transformer_layer_1_25138transformer_layer_1_25140transformer_layer_1_25142transformer_layer_1_25144transformer_layer_1_25146transformer_layer_1_25148transformer_layer_1_25150transformer_layer_1_25152transformer_layer_1_25154transformer_layer_1_25156*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_24923р
+transformer_layer_2/StatefulPartitionedCallStatefulPartitionedCall4transformer_layer_1/StatefulPartitionedCall:output:0transformer_layer_2_25159transformer_layer_2_25161transformer_layer_2_25163transformer_layer_2_25165transformer_layer_2_25167transformer_layer_2_25169transformer_layer_2_25171transformer_layer_2_25173transformer_layer_2_25175transformer_layer_2_25177transformer_layer_2_25179transformer_layer_2_25181*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_24769л
flatten_1/PartitionedCallPartitionedCall4transformer_layer_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А
* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_flatten_1_layer_call_and_return_conditional_losses_24479И
dense_5/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_5_25185dense_5_25187*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_24499О
dense_6/StatefulPartitionedCallStatefulPartitionedCall(dense_5/StatefulPartitionedCall:output:0dense_6_25190dense_6_25192*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_6_layer_call_and_return_conditional_losses_24516w
IdentityIdentity(dense_6/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
к
NoOpNoOp ^dense_5/StatefulPartitionedCall ^dense_6/StatefulPartitionedCall"^encoder3d/StatefulPartitionedCall1^frame_position_embedding/StatefulPartitionedCall+^time_distributed_1/StatefulPartitionedCall,^transformer_layer_1/StatefulPartitionedCall,^transformer_layer_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*М
_input_shapes{
y:€€€€€€€€€(: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2B
dense_6/StatefulPartitionedCalldense_6/StatefulPartitionedCall2F
!encoder3d/StatefulPartitionedCall!encoder3d/StatefulPartitionedCall2d
0frame_position_embedding/StatefulPartitionedCall0frame_position_embedding/StatefulPartitionedCall2X
*time_distributed_1/StatefulPartitionedCall*time_distributed_1/StatefulPartitionedCall2Z
+transformer_layer_1/StatefulPartitionedCall+transformer_layer_1/StatefulPartitionedCall2Z
+transformer_layer_2/StatefulPartitionedCall+transformer_layer_2/StatefulPartitionedCall:[ W
3
_output_shapes!
:€€€€€€€€€(
 
_user_specified_nameinputs
«
ў
,__inference_sequential_1_layer_call_fn_24068
dense_3_input
unknown:	@А
	unknown_0:	А
	unknown_1:	А@
	unknown_2:@
identityИҐStatefulPartitionedCallД
StatefulPartitionedCallStatefulPartitionedCalldense_3_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *P
fKRI
G__inference_sequential_1_layer_call_and_return_conditional_losses_24044s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Z V
+
_output_shapes
:€€€€€€€€€@
'
_user_specified_namedense_3_input
‘
Х
'__inference_dense_4_layer_call_fn_27831

inputs
unknown:	А@
	unknown_0:@
identityИҐStatefulPartitionedCallё
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_23977s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А: : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
Щ
©
G__inference_sequential_1_layer_call_and_return_conditional_losses_23984

inputs 
dense_3_23942:	@А
dense_3_23944:	А 
dense_4_23978:	А@
dense_4_23980:@
identityИҐdense_3/StatefulPartitionedCallҐdense_4/StatefulPartitionedCallс
dense_3/StatefulPartitionedCallStatefulPartitionedCallinputsdense_3_23942dense_3_23944*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_23941Т
dense_4/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0dense_4_23978dense_4_23980*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_23977{
IdentityIdentity(dense_4/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@К
NoOpNoOp ^dense_3/StatefulPartitionedCall ^dense_4/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
ј
У
%__inference_dense_layer_call_fn_27363

inputs
unknown:	А@
	unknown_0:@
identityИҐStatefulPartitionedCallЎ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_23639o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:€€€€€€€€€А: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
∆
^
B__inference_flatten_layer_call_and_return_conditional_losses_23570

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:€€€€€€€€€АY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
™
E
)__inference_flatten_1_layer_call_fn_27260

inputs
identity≥
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А
* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_flatten_1_layer_call_and_return_conditional_losses_24479a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:€€€€€€€€€А
"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€@:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
ёЗ
И
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_24325

inputsV
@multi_head_attention_query_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_query_add_readvariableop_resource:@T
>multi_head_attention_key_einsum_einsum_readvariableop_resource:@@F
4multi_head_attention_key_add_readvariableop_resource:@V
@multi_head_attention_value_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_value_add_readvariableop_resource:@a
Kmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource:@@O
Amulti_head_attention_attention_output_add_readvariableop_resource:@G
4sequential_dense_1_tensordot_readvariableop_resource:	@АA
2sequential_dense_1_biasadd_readvariableop_resource:	АG
4sequential_dense_2_tensordot_readvariableop_resource:	А@@
2sequential_dense_2_biasadd_readvariableop_resource:@
identityИҐ8multi_head_attention/attention_output/add/ReadVariableOpҐBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpҐ+multi_head_attention/key/add/ReadVariableOpҐ5multi_head_attention/key/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/query/add/ReadVariableOpҐ7multi_head_attention/query/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/value/add/ReadVariableOpҐ7multi_head_attention/value/einsum/Einsum/ReadVariableOpҐ)sequential/dense_1/BiasAdd/ReadVariableOpҐ+sequential/dense_1/Tensordot/ReadVariableOpҐ)sequential/dense_2/BiasAdd/ReadVariableOpҐ+sequential/dense_2/Tensordot/ReadVariableOpЉ
7multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0џ
(multi_head_attention/query/einsum/EinsumEinsuminputs?multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde§
-multi_head_attention/query/add/ReadVariableOpReadVariableOp6multi_head_attention_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ћ
multi_head_attention/query/addAddV21multi_head_attention/query/einsum/Einsum:output:05multi_head_attention/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@Є
5multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOp>multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0„
&multi_head_attention/key/einsum/EinsumEinsuminputs=multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde†
+multi_head_attention/key/add/ReadVariableOpReadVariableOp4multi_head_attention_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0≈
multi_head_attention/key/addAddV2/multi_head_attention/key/einsum/Einsum:output:03multi_head_attention/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@Љ
7multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0џ
(multi_head_attention/value/einsum/EinsumEinsuminputs?multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde§
-multi_head_attention/value/add/ReadVariableOpReadVariableOp6multi_head_attention_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ћ
multi_head_attention/value/addAddV21multi_head_attention/value/einsum/Einsum:output:05multi_head_attention/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@_
multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >Ґ
multi_head_attention/MulMul"multi_head_attention/query/add:z:0#multi_head_attention/Mul/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€@ќ
"multi_head_attention/einsum/EinsumEinsum multi_head_attention/key/add:z:0multi_head_attention/Mul:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€*
equationaecd,abcd->acbeЦ
$multi_head_attention/softmax/SoftmaxSoftmax+multi_head_attention/einsum/Einsum:output:0*
T0*/
_output_shapes
:€€€€€€€€€Ы
%multi_head_attention/dropout/IdentityIdentity.multi_head_attention/softmax/Softmax:softmax:0*
T0*/
_output_shapes
:€€€€€€€€€д
$multi_head_attention/einsum_1/EinsumEinsum.multi_head_attention/dropout/Identity:output:0"multi_head_attention/value/add:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationacbe,aecd->abcd“
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpKmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ф
3multi_head_attention/attention_output/einsum/EinsumEinsum-multi_head_attention/einsum_1/Einsum:output:0Jmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:€€€€€€€€€@*
equationabcd,cde->abeґ
8multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpAmulti_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0и
)multi_head_attention/attention_output/addAddV2<multi_head_attention/attention_output/einsum/Einsum:output:0@multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@y
addAddV2inputs-multi_head_attention/attention_output/add:z:0*
T0*+
_output_shapes
:€€€€€€€€€@°
+sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : З
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
value	B : Л
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
valueB: І
!sequential/dense_1/Tensordot/ProdProd.sequential/dense_1/Tensordot/GatherV2:output:0+sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≠
#sequential/dense_1/Tensordot/Prod_1Prod0sequential/dense_1/Tensordot/GatherV2_1:output:0-sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : и
#sequential/dense_1/Tensordot/concatConcatV2*sequential/dense_1/Tensordot/free:output:0*sequential/dense_1/Tensordot/axes:output:01sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:≤
"sequential/dense_1/Tensordot/stackPack*sequential/dense_1/Tensordot/Prod:output:0,sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:†
&sequential/dense_1/Tensordot/transpose	Transposeadd:z:0,sequential/dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@√
$sequential/dense_1/Tensordot/ReshapeReshape*sequential/dense_1/Tensordot/transpose:y:0+sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€ƒ
#sequential/dense_1/Tensordot/MatMulMatMul-sequential/dense_1/Tensordot/Reshape:output:03sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€Аo
$sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Аl
*sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : у
%sequential/dense_1/Tensordot/concat_1ConcatV2.sequential/dense_1/Tensordot/GatherV2:output:0-sequential/dense_1/Tensordot/Const_2:output:03sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:љ
sequential/dense_1/TensordotReshape-sequential/dense_1/Tensordot/MatMul:product:0.sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АЩ
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0ґ
sequential/dense_1/BiasAddBiasAdd%sequential/dense_1/Tensordot:output:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€Аb
sequential/dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?¶
sequential/dense_1/Gelu/mulMul&sequential/dense_1/Gelu/mul/x:output:0#sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аc
sequential/dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?ѓ
sequential/dense_1/Gelu/truedivRealDiv#sequential/dense_1/BiasAdd:output:0'sequential/dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€А~
sequential/dense_1/Gelu/ErfErf#sequential/dense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аb
sequential/dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?§
sequential/dense_1/Gelu/addAddV2&sequential/dense_1/Gelu/add/x:output:0sequential/dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€АЭ
sequential/dense_1/Gelu/mul_1Mulsequential/dense_1/Gelu/mul:z:0sequential/dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€А°
+sequential/dense_2/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_2_tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : З
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
value	B : Л
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
valueB: І
!sequential/dense_2/Tensordot/ProdProd.sequential/dense_2/Tensordot/GatherV2:output:0+sequential/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≠
#sequential/dense_2/Tensordot/Prod_1Prod0sequential/dense_2/Tensordot/GatherV2_1:output:0-sequential/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : и
#sequential/dense_2/Tensordot/concatConcatV2*sequential/dense_2/Tensordot/free:output:0*sequential/dense_2/Tensordot/axes:output:01sequential/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:≤
"sequential/dense_2/Tensordot/stackPack*sequential/dense_2/Tensordot/Prod:output:0,sequential/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:ї
&sequential/dense_2/Tensordot/transpose	Transpose!sequential/dense_1/Gelu/mul_1:z:0,sequential/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€А√
$sequential/dense_2/Tensordot/ReshapeReshape*sequential/dense_2/Tensordot/transpose:y:0+sequential/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€√
#sequential/dense_2/Tensordot/MatMulMatMul-sequential/dense_2/Tensordot/Reshape:output:03sequential/dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@n
$sequential/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@l
*sequential/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : у
%sequential/dense_2/Tensordot/concat_1ConcatV2.sequential/dense_2/Tensordot/GatherV2:output:0-sequential/dense_2/Tensordot/Const_2:output:03sequential/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Љ
sequential/dense_2/TensordotReshape-sequential/dense_2/Tensordot/MatMul:product:0.sequential/dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Ш
)sequential/dense_2/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0µ
sequential/dense_2/BiasAddBiasAdd%sequential/dense_2/Tensordot:output:01sequential/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@r
add_1AddV2add:z:0#sequential/dense_2/BiasAdd:output:0*
T0*+
_output_shapes
:€€€€€€€€€@\
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@і
NoOpNoOp9^multi_head_attention/attention_output/add/ReadVariableOpC^multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp,^multi_head_attention/key/add/ReadVariableOp6^multi_head_attention/key/einsum/Einsum/ReadVariableOp.^multi_head_attention/query/add/ReadVariableOp8^multi_head_attention/query/einsum/Einsum/ReadVariableOp.^multi_head_attention/value/add/ReadVariableOp8^multi_head_attention/value/einsum/Einsum/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp,^sequential/dense_1/Tensordot/ReadVariableOp*^sequential/dense_2/BiasAdd/ReadVariableOp,^sequential/dense_2/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:€€€€€€€€€@: : : : : : : : : : : : 2t
8multi_head_attention/attention_output/add/ReadVariableOp8multi_head_attention/attention_output/add/ReadVariableOp2И
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
:€€€€€€€€€@
 
_user_specified_nameinputs
ЩК
Є
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_24769

inputsX
Bmulti_head_attention_1_query_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_query_add_readvariableop_resource:@V
@multi_head_attention_1_key_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_1_key_add_readvariableop_resource:@X
Bmulti_head_attention_1_value_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_value_add_readvariableop_resource:@c
Mmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource:@@Q
Cmulti_head_attention_1_attention_output_add_readvariableop_resource:@I
6sequential_1_dense_3_tensordot_readvariableop_resource:	@АC
4sequential_1_dense_3_biasadd_readvariableop_resource:	АI
6sequential_1_dense_4_tensordot_readvariableop_resource:	А@B
4sequential_1_dense_4_biasadd_readvariableop_resource:@
identityИҐ:multi_head_attention_1/attention_output/add/ReadVariableOpҐDmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpҐ-multi_head_attention_1/key/add/ReadVariableOpҐ7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpҐ/multi_head_attention_1/query/add/ReadVariableOpҐ9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpҐ/multi_head_attention_1/value/add/ReadVariableOpҐ9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpҐ+sequential_1/dense_3/BiasAdd/ReadVariableOpҐ-sequential_1/dense_3/Tensordot/ReadVariableOpҐ+sequential_1/dense_4/BiasAdd/ReadVariableOpҐ-sequential_1/dense_4/Tensordot/ReadVariableOpј
9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0я
*multi_head_attention_1/query/einsum/EinsumEinsuminputsAmulti_head_attention_1/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde®
/multi_head_attention_1/query/add/ReadVariableOpReadVariableOp8multi_head_attention_1_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0—
 multi_head_attention_1/query/addAddV23multi_head_attention_1/query/einsum/Einsum:output:07multi_head_attention_1/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@Љ
7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_1_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0џ
(multi_head_attention_1/key/einsum/EinsumEinsuminputs?multi_head_attention_1/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde§
-multi_head_attention_1/key/add/ReadVariableOpReadVariableOp6multi_head_attention_1_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ћ
multi_head_attention_1/key/addAddV21multi_head_attention_1/key/einsum/Einsum:output:05multi_head_attention_1/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@ј
9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0я
*multi_head_attention_1/value/einsum/EinsumEinsuminputsAmulti_head_attention_1/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde®
/multi_head_attention_1/value/add/ReadVariableOpReadVariableOp8multi_head_attention_1_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0—
 multi_head_attention_1/value/addAddV23multi_head_attention_1/value/einsum/Einsum:output:07multi_head_attention_1/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@a
multi_head_attention_1/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >®
multi_head_attention_1/MulMul$multi_head_attention_1/query/add:z:0%multi_head_attention_1/Mul/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€@‘
$multi_head_attention_1/einsum/EinsumEinsum"multi_head_attention_1/key/add:z:0multi_head_attention_1/Mul:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€*
equationaecd,abcd->acbeЪ
&multi_head_attention_1/softmax/SoftmaxSoftmax-multi_head_attention_1/einsum/Einsum:output:0*
T0*/
_output_shapes
:€€€€€€€€€к
&multi_head_attention_1/einsum_1/EinsumEinsum0multi_head_attention_1/softmax/Softmax:softmax:0$multi_head_attention_1/value/add:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationacbe,aecd->abcd÷
Dmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpMmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ъ
5multi_head_attention_1/attention_output/einsum/EinsumEinsum/multi_head_attention_1/einsum_1/Einsum:output:0Lmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:€€€€€€€€€@*
equationabcd,cde->abeЇ
:multi_head_attention_1/attention_output/add/ReadVariableOpReadVariableOpCmulti_head_attention_1_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0о
+multi_head_attention_1/attention_output/addAddV2>multi_head_attention_1/attention_output/einsum/Einsum:output:0Bmulti_head_attention_1/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@{
addAddV2inputs/multi_head_attention_1/attention_output/add:z:0*
T0*+
_output_shapes
:€€€€€€€€€@•
-sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : П
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
value	B : У
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
valueB: ≠
#sequential_1/dense_3/Tensordot/ProdProd0sequential_1/dense_3/Tensordot/GatherV2:output:0-sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≥
%sequential_1/dense_3/Tensordot/Prod_1Prod2sequential_1/dense_3/Tensordot/GatherV2_1:output:0/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : р
%sequential_1/dense_3/Tensordot/concatConcatV2,sequential_1/dense_3/Tensordot/free:output:0,sequential_1/dense_3/Tensordot/axes:output:03sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:Є
$sequential_1/dense_3/Tensordot/stackPack,sequential_1/dense_3/Tensordot/Prod:output:0.sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:§
(sequential_1/dense_3/Tensordot/transpose	Transposeadd:z:0.sequential_1/dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@…
&sequential_1/dense_3/Tensordot/ReshapeReshape,sequential_1/dense_3/Tensordot/transpose:y:0-sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€ 
%sequential_1/dense_3/Tensordot/MatMulMatMul/sequential_1/dense_3/Tensordot/Reshape:output:05sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€Аq
&sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Аn
,sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ы
'sequential_1/dense_3/Tensordot/concat_1ConcatV20sequential_1/dense_3/Tensordot/GatherV2:output:0/sequential_1/dense_3/Tensordot/Const_2:output:05sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:√
sequential_1/dense_3/TensordotReshape/sequential_1/dense_3/Tensordot/MatMul:product:00sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АЭ
+sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Љ
sequential_1/dense_3/BiasAddBiasAdd'sequential_1/dense_3/Tensordot:output:03sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€Аd
sequential_1/dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?ђ
sequential_1/dense_3/Gelu/mulMul(sequential_1/dense_3/Gelu/mul/x:output:0%sequential_1/dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аe
 sequential_1/dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?µ
!sequential_1/dense_3/Gelu/truedivRealDiv%sequential_1/dense_3/BiasAdd:output:0)sequential_1/dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€АВ
sequential_1/dense_3/Gelu/ErfErf%sequential_1/dense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аd
sequential_1/dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?™
sequential_1/dense_3/Gelu/addAddV2(sequential_1/dense_3/Gelu/add/x:output:0!sequential_1/dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€А£
sequential_1/dense_3/Gelu/mul_1Mul!sequential_1/dense_3/Gelu/mul:z:0!sequential_1/dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€А•
-sequential_1/dense_4/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_4_tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : П
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
value	B : У
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
valueB: ≠
#sequential_1/dense_4/Tensordot/ProdProd0sequential_1/dense_4/Tensordot/GatherV2:output:0-sequential_1/dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≥
%sequential_1/dense_4/Tensordot/Prod_1Prod2sequential_1/dense_4/Tensordot/GatherV2_1:output:0/sequential_1/dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : р
%sequential_1/dense_4/Tensordot/concatConcatV2,sequential_1/dense_4/Tensordot/free:output:0,sequential_1/dense_4/Tensordot/axes:output:03sequential_1/dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:Є
$sequential_1/dense_4/Tensordot/stackPack,sequential_1/dense_4/Tensordot/Prod:output:0.sequential_1/dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Ѕ
(sequential_1/dense_4/Tensordot/transpose	Transpose#sequential_1/dense_3/Gelu/mul_1:z:0.sequential_1/dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€А…
&sequential_1/dense_4/Tensordot/ReshapeReshape,sequential_1/dense_4/Tensordot/transpose:y:0-sequential_1/dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€…
%sequential_1/dense_4/Tensordot/MatMulMatMul/sequential_1/dense_4/Tensordot/Reshape:output:05sequential_1/dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@p
&sequential_1/dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@n
,sequential_1/dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ы
'sequential_1/dense_4/Tensordot/concat_1ConcatV20sequential_1/dense_4/Tensordot/GatherV2:output:0/sequential_1/dense_4/Tensordot/Const_2:output:05sequential_1/dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:¬
sequential_1/dense_4/TensordotReshape/sequential_1/dense_4/Tensordot/MatMul:product:00sequential_1/dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Ь
+sequential_1/dense_4/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0ї
sequential_1/dense_4/BiasAddBiasAdd'sequential_1/dense_4/Tensordot:output:03sequential_1/dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@t
add_1AddV2add:z:0%sequential_1/dense_4/BiasAdd:output:0*
T0*+
_output_shapes
:€€€€€€€€€@\
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@ћ
NoOpNoOp;^multi_head_attention_1/attention_output/add/ReadVariableOpE^multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp.^multi_head_attention_1/key/add/ReadVariableOp8^multi_head_attention_1/key/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/query/add/ReadVariableOp:^multi_head_attention_1/query/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/value/add/ReadVariableOp:^multi_head_attention_1/value/einsum/Einsum/ReadVariableOp,^sequential_1/dense_3/BiasAdd/ReadVariableOp.^sequential_1/dense_3/Tensordot/ReadVariableOp,^sequential_1/dense_4/BiasAdd/ReadVariableOp.^sequential_1/dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:€€€€€€€€€@: : : : : : : : : : : : 2x
:multi_head_attention_1/attention_output/add/ReadVariableOp:multi_head_attention_1/attention_output/add/ReadVariableOp2М
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
:€€€€€€€€€@
 
_user_specified_nameinputs
ґ
ф
B__inference_dense_5_layer_call_and_return_conditional_losses_27293

inputs1
matmul_readvariableop_resource:	А
@-
biasadd_readvariableop_resource:@
identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	А
@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@O

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?h
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€@P
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?q
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*'
_output_shapes
:€€€€€€€€€@S
Gelu/ErfErfGelu/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€@O

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?f
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*'
_output_shapes
:€€€€€€€€€@_

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€@]
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€@w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:€€€€€€€€€А
: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€А

 
_user_specified_nameinputs
С
«
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_23650

inputs
dense_23640:	А@
dense_23642:@
identityИҐdense/StatefulPartitionedCall;
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
valueB:—
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
valueB"€€€€   e
ReshapeReshapeinputsReshape/shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€Ао
dense/StatefulPartitionedCallStatefulPartitionedCallReshape:output:0dense_23640dense_23642*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_23639\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
€€€€€€€€€S
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value	B :@Х
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:Х
	Reshape_1Reshape&dense/StatefulPartitionedCall:output:0Reshape_1/shape:output:0*
T0*4
_output_shapes"
 :€€€€€€€€€€€€€€€€€€@n
IdentityIdentityReshape_1:output:0^NoOp*
T0*4
_output_shapes"
 :€€€€€€€€€€€€€€€€€€@f
NoOpNoOp^dense/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:€€€€€€€€€€€€€€€€€€А: : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall:] Y
5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
Њ
`
D__inference_flatten_1_layer_call_and_return_conditional_losses_24479

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:€€€€€€€€€А
Y
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:€€€€€€€€€А
"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€@:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
”
b
F__inference_pooling3d_3_layer_call_and_return_conditional_losses_27343

inputs
identityљ
	MaxPool3D	MaxPool3Dinputs*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€*
ksize	
*
paddingSAME*
strides	
К
IdentityIdentityMaxPool3D:output:0*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€: {
W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
 
_user_specified_nameinputs
йЂ
У:
@__inference_model_layer_call_and_return_conditional_losses_26515

inputsy
[encoder3d_spatial_attention_spatial_attention_attention_conv_conv3d_readvariableop_resource:j
\encoder3d_spatial_attention_spatial_attention_attention_conv_biasadd_readvariableop_resource:i
Kencoder3d_conv2_plus1d_conv3d_1_spatial_conv_conv3d_readvariableop_resource: Z
Lencoder3d_conv2_plus1d_conv3d_1_spatial_conv_biasadd_readvariableop_resource: j
Lencoder3d_conv2_plus1d_conv3d_1_temporal_conv_conv3d_readvariableop_resource:  [
Mencoder3d_conv2_plus1d_conv3d_1_temporal_conv_biasadd_readvariableop_resource: k
Mencoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_conv3d_readvariableop_resource: @\
Nencoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_biasadd_readvariableop_resource:@l
Nencoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_conv3d_readvariableop_resource:@@]
Oencoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_biasadd_readvariableop_resource:@l
Mencoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_conv3d_readvariableop_resource:@А]
Nencoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_biasadd_readvariableop_resource:	Аn
Nencoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_conv3d_readvariableop_resource:АА^
Oencoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_biasadd_readvariableop_resource:	АJ
7time_distributed_1_dense_matmul_readvariableop_resource:	А@F
8time_distributed_1_dense_biasadd_readvariableop_resource:@K
9frame_position_embedding_embedding_embedding_lookup_26303:@j
Ttransformer_layer_1_multi_head_attention_query_einsum_einsum_readvariableop_resource:@@\
Jtransformer_layer_1_multi_head_attention_query_add_readvariableop_resource:@h
Rtransformer_layer_1_multi_head_attention_key_einsum_einsum_readvariableop_resource:@@Z
Htransformer_layer_1_multi_head_attention_key_add_readvariableop_resource:@j
Ttransformer_layer_1_multi_head_attention_value_einsum_einsum_readvariableop_resource:@@\
Jtransformer_layer_1_multi_head_attention_value_add_readvariableop_resource:@u
_transformer_layer_1_multi_head_attention_attention_output_einsum_einsum_readvariableop_resource:@@c
Utransformer_layer_1_multi_head_attention_attention_output_add_readvariableop_resource:@[
Htransformer_layer_1_sequential_dense_1_tensordot_readvariableop_resource:	@АU
Ftransformer_layer_1_sequential_dense_1_biasadd_readvariableop_resource:	А[
Htransformer_layer_1_sequential_dense_2_tensordot_readvariableop_resource:	А@T
Ftransformer_layer_1_sequential_dense_2_biasadd_readvariableop_resource:@l
Vtransformer_layer_2_multi_head_attention_1_query_einsum_einsum_readvariableop_resource:@@^
Ltransformer_layer_2_multi_head_attention_1_query_add_readvariableop_resource:@j
Ttransformer_layer_2_multi_head_attention_1_key_einsum_einsum_readvariableop_resource:@@\
Jtransformer_layer_2_multi_head_attention_1_key_add_readvariableop_resource:@l
Vtransformer_layer_2_multi_head_attention_1_value_einsum_einsum_readvariableop_resource:@@^
Ltransformer_layer_2_multi_head_attention_1_value_add_readvariableop_resource:@w
atransformer_layer_2_multi_head_attention_1_attention_output_einsum_einsum_readvariableop_resource:@@e
Wtransformer_layer_2_multi_head_attention_1_attention_output_add_readvariableop_resource:@]
Jtransformer_layer_2_sequential_1_dense_3_tensordot_readvariableop_resource:	@АW
Htransformer_layer_2_sequential_1_dense_3_biasadd_readvariableop_resource:	А]
Jtransformer_layer_2_sequential_1_dense_4_tensordot_readvariableop_resource:	А@V
Htransformer_layer_2_sequential_1_dense_4_biasadd_readvariableop_resource:@9
&dense_5_matmul_readvariableop_resource:	А
@5
'dense_5_biasadd_readvariableop_resource:@8
&dense_6_matmul_readvariableop_resource:@
5
'dense_6_biasadd_readvariableop_resource:

identityИҐdense_5/BiasAdd/ReadVariableOpҐdense_5/MatMul/ReadVariableOpҐdense_6/BiasAdd/ReadVariableOpҐdense_6/MatMul/ReadVariableOpҐCencoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpҐBencoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpҐDencoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpҐCencoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpҐEencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpҐDencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpҐFencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpҐEencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpҐEencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpҐDencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpҐFencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpҐEencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpҐSencoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpҐRencoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpҐ3frame_position_embedding/embedding/embedding_lookupҐ/time_distributed_1/dense/BiasAdd/ReadVariableOpҐ.time_distributed_1/dense/MatMul/ReadVariableOpҐLtransformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOpҐVtransformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpҐ?transformer_layer_1/multi_head_attention/key/add/ReadVariableOpҐItransformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOpҐAtransformer_layer_1/multi_head_attention/query/add/ReadVariableOpҐKtransformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOpҐAtransformer_layer_1/multi_head_attention/value/add/ReadVariableOpҐKtransformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOpҐ=transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOpҐ?transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOpҐ=transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOpҐ?transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOpҐNtransformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOpҐXtransformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpҐAtransformer_layer_2/multi_head_attention_1/key/add/ReadVariableOpҐKtransformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOpҐCtransformer_layer_2/multi_head_attention_1/query/add/ReadVariableOpҐMtransformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOpҐCtransformer_layer_2/multi_head_attention_1/value/add/ReadVariableOpҐMtransformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOpҐ?transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOpҐAtransformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOpҐ?transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOpҐAtransformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOpъ
Rencoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpReadVariableOp[encoder3d_spatial_attention_spatial_attention_attention_conv_conv3d_readvariableop_resource**
_output_shapes
:*
dtype0Ш
Cencoder3d/spatial_attention/spatial_attention_attention_conv/Conv3DConv3DinputsZencoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(*
paddingSAME*
strides	
м
Sencoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpReadVariableOp\encoder3d_spatial_attention_spatial_attention_attention_conv_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Є
Dencoder3d/spatial_attention/spatial_attention_attention_conv/BiasAddBiasAddLencoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D:output:0[encoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(М
Gencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Ђ
Eencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mulMulPencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul/x:output:0Mencoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(Н
Hencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?і
Iencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/truedivRealDivMencoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd:output:0Qencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/Cast/x:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(ў
Eencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/ErfErfMencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/truediv:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(М
Gencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?©
Eencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/addAddV2Pencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/add/x:output:0Iencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/Erf:y:0*
T0*3
_output_shapes!
:€€€€€€€€€(Ґ
Gencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul_1MulIencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul:z:0Iencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/add:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(‘
:encoder3d/spatial_attention/spatial_attention_multiply/mulMulinputsKencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul_1:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(Џ
Bencoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpReadVariableOpKencoder3d_conv2_plus1d_conv3d_1_spatial_conv_conv3d_readvariableop_resource**
_output_shapes
: *
dtype0∞
3encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3DConv3D>encoder3d/spatial_attention/spatial_attention_multiply/mul:z:0Jencoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
paddingSAME*
strides	
ћ
Cencoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpLencoder3d_conv2_plus1d_conv3d_1_spatial_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0И
4encoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAddBiasAdd<encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D:output:0Kencoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( ґ
1encoder3d/conv2_plus1d/conv3D_1_spatial_conv/ReluRelu=encoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€( №
Cencoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpReadVariableOpLencoder3d_conv2_plus1d_conv3d_1_temporal_conv_conv3d_readvariableop_resource**
_output_shapes
:  *
dtype0≥
4encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3DConv3D?encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Relu:activations:0Kencoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
paddingSAME*
strides	
ќ
Dencoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpMencoder3d_conv2_plus1d_conv3d_1_temporal_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0Л
5encoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAddBiasAdd=encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D:output:0Lencoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( Є
2encoder3d/conv2_plus1d/conv3D_1_temporal_conv/ReluRelu>encoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€( й
encoder3d/pooling3d_1/MaxPool3D	MaxPool3D@encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Relu:activations:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
ksize	
*
paddingSAME*
strides	
ё
Dencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpReadVariableOpMencoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_conv3d_readvariableop_resource**
_output_shapes
: @*
dtype0Ю
5encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3DConv3D(encoder3d/pooling3d_1/MaxPool3D:output:0Lencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
paddingSAME*
strides	
–
Eencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpNencoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0О
6encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAddBiasAdd>encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D:output:0Mencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@Ї
3encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/ReluRelu?encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(@а
Eencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpReadVariableOpNencoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_conv3d_readvariableop_resource**
_output_shapes
:@@*
dtype0є
6encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3DConv3DAencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Relu:activations:0Mencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
paddingSAME*
strides	
“
Fencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpOencoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0С
7encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAddBiasAdd?encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D:output:0Nencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@Љ
4encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/ReluRelu@encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(@л
encoder3d/pooling3d_2/MaxPool3D	MaxPool3DBencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Relu:activations:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
ksize	
*
paddingSAME*
strides	
я
Dencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpReadVariableOpMencoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_conv3d_readvariableop_resource*+
_output_shapes
:@А*
dtype0Я
5encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3DConv3D(encoder3d/pooling3d_2/MaxPool3D:output:0Lencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(А*
paddingSAME*
strides	
—
Eencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpNencoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0П
6encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAddBiasAdd>encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D:output:0Mencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(Аї
3encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/ReluRelu?encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd:output:0*
T0*4
_output_shapes"
 :€€€€€€€€€(Ав
Eencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpReadVariableOpNencoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_conv3d_readvariableop_resource*,
_output_shapes
:АА*
dtype0Ї
6encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3DConv3DAencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Relu:activations:0Mencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(А*
paddingSAME*
strides	
”
Fencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpOencoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Т
7encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAddBiasAdd?encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D:output:0Nencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(Аљ
4encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/ReluRelu@encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd:output:0*
T0*4
_output_shapes"
 :€€€€€€€€€(Ам
encoder3d/pooling3d_3/MaxPool3D	MaxPool3DBencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Relu:activations:0*
T0*4
_output_shapes"
 :€€€€€€€€€А*
ksize	
*
paddingSAME*
strides	
w
time_distributed/Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"€€€€      А   ±
time_distributed/ReshapeReshape(encoder3d/pooling3d_3/MaxPool3D:output:0'time_distributed/Reshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€Аo
time_distributed/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€   ™
 time_distributed/flatten/ReshapeReshape!time_distributed/Reshape:output:0'time_distributed/flatten/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€Аu
 time_distributed/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*!
valueB"€€€€      ≤
time_distributed/Reshape_1Reshape)time_distributed/flatten/Reshape:output:0)time_distributed/Reshape_1/shape:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аy
 time_distributed/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*%
valueB"€€€€      А   µ
time_distributed/Reshape_2Reshape(encoder3d/pooling3d_3/MaxPool3D:output:0)time_distributed/Reshape_2/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€Аq
 time_distributed_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"€€€€   ®
time_distributed_1/ReshapeReshape#time_distributed/Reshape_1:output:0)time_distributed_1/Reshape/shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€АІ
.time_distributed_1/dense/MatMul/ReadVariableOpReadVariableOp7time_distributed_1_dense_matmul_readvariableop_resource*
_output_shapes
:	А@*
dtype0Є
time_distributed_1/dense/MatMulMatMul#time_distributed_1/Reshape:output:06time_distributed_1/dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@§
/time_distributed_1/dense/BiasAdd/ReadVariableOpReadVariableOp8time_distributed_1_dense_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Ѕ
 time_distributed_1/dense/BiasAddBiasAdd)time_distributed_1/dense/MatMul:product:07time_distributed_1/dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@h
#time_distributed_1/dense/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?≥
!time_distributed_1/dense/Gelu/mulMul,time_distributed_1/dense/Gelu/mul/x:output:0)time_distributed_1/dense/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€@i
$time_distributed_1/dense/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?Љ
%time_distributed_1/dense/Gelu/truedivRealDiv)time_distributed_1/dense/BiasAdd:output:0-time_distributed_1/dense/Gelu/Cast/x:output:0*
T0*'
_output_shapes
:€€€€€€€€€@Е
!time_distributed_1/dense/Gelu/ErfErf)time_distributed_1/dense/Gelu/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€@h
#time_distributed_1/dense/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?±
!time_distributed_1/dense/Gelu/addAddV2,time_distributed_1/dense/Gelu/add/x:output:0%time_distributed_1/dense/Gelu/Erf:y:0*
T0*'
_output_shapes
:€€€€€€€€€@™
#time_distributed_1/dense/Gelu/mul_1Mul%time_distributed_1/dense/Gelu/mul:z:0%time_distributed_1/dense/Gelu/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€@w
"time_distributed_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*!
valueB"€€€€   @   ≥
time_distributed_1/Reshape_1Reshape'time_distributed_1/dense/Gelu/mul_1:z:0+time_distributed_1/Reshape_1/shape:output:0*
T0*+
_output_shapes
:€€€€€€€€€@s
"time_distributed_1/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*
valueB"€€€€   ђ
time_distributed_1/Reshape_2Reshape#time_distributed/Reshape_1:output:0+time_distributed_1/Reshape_2/shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€Аs
frame_position_embedding/ShapeShape%time_distributed_1/Reshape_1:output:0*
T0*
_output_shapes
:v
,frame_position_embedding/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:x
.frame_position_embedding/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:x
.frame_position_embedding/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ќ
&frame_position_embedding/strided_sliceStridedSlice'frame_position_embedding/Shape:output:05frame_position_embedding/strided_slice/stack:output:07frame_position_embedding/strided_slice/stack_1:output:07frame_position_embedding/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
$frame_position_embedding/range/startConst*
_output_shapes
: *
dtype0*
value	B : f
$frame_position_embedding/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :“
frame_position_embedding/rangeRange-frame_position_embedding/range/start:output:0/frame_position_embedding/strided_slice:output:0-frame_position_embedding/range/delta:output:0*
_output_shapes
:і
3frame_position_embedding/embedding/embedding_lookupResourceGather9frame_position_embedding_embedding_embedding_lookup_26303'frame_position_embedding/range:output:0*
Tindices0*L
_classB
@>loc:@frame_position_embedding/embedding/embedding_lookup/26303*
_output_shapes

:@*
dtype0э
<frame_position_embedding/embedding/embedding_lookup/IdentityIdentity<frame_position_embedding/embedding/embedding_lookup:output:0*
T0*L
_classB
@>loc:@frame_position_embedding/embedding/embedding_lookup/26303*
_output_shapes

:@Ї
>frame_position_embedding/embedding/embedding_lookup/Identity_1IdentityEframe_position_embedding/embedding/embedding_lookup/Identity:output:0*
T0*
_output_shapes

:@Ћ
frame_position_embedding/addAddV2%time_distributed_1/Reshape_1:output:0Gframe_position_embedding/embedding/embedding_lookup/Identity_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@д
Ktransformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOpTtransformer_layer_1_multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Э
<transformer_layer_1/multi_head_attention/query/einsum/EinsumEinsum frame_position_embedding/add:z:0Stransformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abdeћ
Atransformer_layer_1/multi_head_attention/query/add/ReadVariableOpReadVariableOpJtransformer_layer_1_multi_head_attention_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0З
2transformer_layer_1/multi_head_attention/query/addAddV2Etransformer_layer_1/multi_head_attention/query/einsum/Einsum:output:0Itransformer_layer_1/multi_head_attention/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@а
Itransformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOpRtransformer_layer_1_multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Щ
:transformer_layer_1/multi_head_attention/key/einsum/EinsumEinsum frame_position_embedding/add:z:0Qtransformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde»
?transformer_layer_1/multi_head_attention/key/add/ReadVariableOpReadVariableOpHtransformer_layer_1_multi_head_attention_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Б
0transformer_layer_1/multi_head_attention/key/addAddV2Ctransformer_layer_1/multi_head_attention/key/einsum/Einsum:output:0Gtransformer_layer_1/multi_head_attention/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@д
Ktransformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOpTtransformer_layer_1_multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Э
<transformer_layer_1/multi_head_attention/value/einsum/EinsumEinsum frame_position_embedding/add:z:0Stransformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abdeћ
Atransformer_layer_1/multi_head_attention/value/add/ReadVariableOpReadVariableOpJtransformer_layer_1_multi_head_attention_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0З
2transformer_layer_1/multi_head_attention/value/addAddV2Etransformer_layer_1/multi_head_attention/value/einsum/Einsum:output:0Itransformer_layer_1/multi_head_attention/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@s
.transformer_layer_1/multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >ё
,transformer_layer_1/multi_head_attention/MulMul6transformer_layer_1/multi_head_attention/query/add:z:07transformer_layer_1/multi_head_attention/Mul/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€@К
6transformer_layer_1/multi_head_attention/einsum/EinsumEinsum4transformer_layer_1/multi_head_attention/key/add:z:00transformer_layer_1/multi_head_attention/Mul:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€*
equationaecd,abcd->acbeЊ
8transformer_layer_1/multi_head_attention/softmax/SoftmaxSoftmax?transformer_layer_1/multi_head_attention/einsum/Einsum:output:0*
T0*/
_output_shapes
:€€€€€€€€€†
8transformer_layer_1/multi_head_attention/einsum_1/EinsumEinsumBtransformer_layer_1/multi_head_attention/softmax/Softmax:softmax:06transformer_layer_1/multi_head_attention/value/add:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationacbe,aecd->abcdъ
Vtransformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOp_transformer_layer_1_multi_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0–
Gtransformer_layer_1/multi_head_attention/attention_output/einsum/EinsumEinsumAtransformer_layer_1/multi_head_attention/einsum_1/Einsum:output:0^transformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:€€€€€€€€€@*
equationabcd,cde->abeё
Ltransformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpUtransformer_layer_1_multi_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0§
=transformer_layer_1/multi_head_attention/attention_output/addAddV2Ptransformer_layer_1/multi_head_attention/attention_output/einsum/Einsum:output:0Ttransformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@ї
transformer_layer_1/addAddV2 frame_position_embedding/add:z:0Atransformer_layer_1/multi_head_attention/attention_output/add:z:0*
T0*+
_output_shapes
:€€€€€€€€€@…
?transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOpReadVariableOpHtransformer_layer_1_sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@А*
dtype0
5transformer_layer_1/sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:Ж
5transformer_layer_1/sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Б
6transformer_layer_1/sequential/dense_1/Tensordot/ShapeShapetransformer_layer_1/add:z:0*
T0*
_output_shapes
:А
>transformer_layer_1/sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : „
9transformer_layer_1/sequential/dense_1/Tensordot/GatherV2GatherV2?transformer_layer_1/sequential/dense_1/Tensordot/Shape:output:0>transformer_layer_1/sequential/dense_1/Tensordot/free:output:0Gtransformer_layer_1/sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:В
@transformer_layer_1/sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : џ
;transformer_layer_1/sequential/dense_1/Tensordot/GatherV2_1GatherV2?transformer_layer_1/sequential/dense_1/Tensordot/Shape:output:0>transformer_layer_1/sequential/dense_1/Tensordot/axes:output:0Itransformer_layer_1/sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:А
6transformer_layer_1/sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: г
5transformer_layer_1/sequential/dense_1/Tensordot/ProdProdBtransformer_layer_1/sequential/dense_1/Tensordot/GatherV2:output:0?transformer_layer_1/sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: В
8transformer_layer_1/sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: й
7transformer_layer_1/sequential/dense_1/Tensordot/Prod_1ProdDtransformer_layer_1/sequential/dense_1/Tensordot/GatherV2_1:output:0Atransformer_layer_1/sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ~
<transformer_layer_1/sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Є
7transformer_layer_1/sequential/dense_1/Tensordot/concatConcatV2>transformer_layer_1/sequential/dense_1/Tensordot/free:output:0>transformer_layer_1/sequential/dense_1/Tensordot/axes:output:0Etransformer_layer_1/sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:о
6transformer_layer_1/sequential/dense_1/Tensordot/stackPack>transformer_layer_1/sequential/dense_1/Tensordot/Prod:output:0@transformer_layer_1/sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:№
:transformer_layer_1/sequential/dense_1/Tensordot/transpose	Transposetransformer_layer_1/add:z:0@transformer_layer_1/sequential/dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@€
8transformer_layer_1/sequential/dense_1/Tensordot/ReshapeReshape>transformer_layer_1/sequential/dense_1/Tensordot/transpose:y:0?transformer_layer_1/sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€А
7transformer_layer_1/sequential/dense_1/Tensordot/MatMulMatMulAtransformer_layer_1/sequential/dense_1/Tensordot/Reshape:output:0Gtransformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€АГ
8transformer_layer_1/sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:АА
>transformer_layer_1/sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : √
9transformer_layer_1/sequential/dense_1/Tensordot/concat_1ConcatV2Btransformer_layer_1/sequential/dense_1/Tensordot/GatherV2:output:0Atransformer_layer_1/sequential/dense_1/Tensordot/Const_2:output:0Gtransformer_layer_1/sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:щ
0transformer_layer_1/sequential/dense_1/TensordotReshapeAtransformer_layer_1/sequential/dense_1/Tensordot/MatMul:product:0Btransformer_layer_1/sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АЅ
=transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOpFtransformer_layer_1_sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0т
.transformer_layer_1/sequential/dense_1/BiasAddBiasAdd9transformer_layer_1/sequential/dense_1/Tensordot:output:0Etransformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€Аv
1transformer_layer_1/sequential/dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?в
/transformer_layer_1/sequential/dense_1/Gelu/mulMul:transformer_layer_1/sequential/dense_1/Gelu/mul/x:output:07transformer_layer_1/sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аw
2transformer_layer_1/sequential/dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?л
3transformer_layer_1/sequential/dense_1/Gelu/truedivRealDiv7transformer_layer_1/sequential/dense_1/BiasAdd:output:0;transformer_layer_1/sequential/dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€А¶
/transformer_layer_1/sequential/dense_1/Gelu/ErfErf7transformer_layer_1/sequential/dense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аv
1transformer_layer_1/sequential/dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?а
/transformer_layer_1/sequential/dense_1/Gelu/addAddV2:transformer_layer_1/sequential/dense_1/Gelu/add/x:output:03transformer_layer_1/sequential/dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€Аў
1transformer_layer_1/sequential/dense_1/Gelu/mul_1Mul3transformer_layer_1/sequential/dense_1/Gelu/mul:z:03transformer_layer_1/sequential/dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€А…
?transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOpReadVariableOpHtransformer_layer_1_sequential_dense_2_tensordot_readvariableop_resource*
_output_shapes
:	А@*
dtype0
5transformer_layer_1/sequential/dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:Ж
5transformer_layer_1/sequential/dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Ы
6transformer_layer_1/sequential/dense_2/Tensordot/ShapeShape5transformer_layer_1/sequential/dense_1/Gelu/mul_1:z:0*
T0*
_output_shapes
:А
>transformer_layer_1/sequential/dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : „
9transformer_layer_1/sequential/dense_2/Tensordot/GatherV2GatherV2?transformer_layer_1/sequential/dense_2/Tensordot/Shape:output:0>transformer_layer_1/sequential/dense_2/Tensordot/free:output:0Gtransformer_layer_1/sequential/dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:В
@transformer_layer_1/sequential/dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : џ
;transformer_layer_1/sequential/dense_2/Tensordot/GatherV2_1GatherV2?transformer_layer_1/sequential/dense_2/Tensordot/Shape:output:0>transformer_layer_1/sequential/dense_2/Tensordot/axes:output:0Itransformer_layer_1/sequential/dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:А
6transformer_layer_1/sequential/dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: г
5transformer_layer_1/sequential/dense_2/Tensordot/ProdProdBtransformer_layer_1/sequential/dense_2/Tensordot/GatherV2:output:0?transformer_layer_1/sequential/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: В
8transformer_layer_1/sequential/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: й
7transformer_layer_1/sequential/dense_2/Tensordot/Prod_1ProdDtransformer_layer_1/sequential/dense_2/Tensordot/GatherV2_1:output:0Atransformer_layer_1/sequential/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ~
<transformer_layer_1/sequential/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Є
7transformer_layer_1/sequential/dense_2/Tensordot/concatConcatV2>transformer_layer_1/sequential/dense_2/Tensordot/free:output:0>transformer_layer_1/sequential/dense_2/Tensordot/axes:output:0Etransformer_layer_1/sequential/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:о
6transformer_layer_1/sequential/dense_2/Tensordot/stackPack>transformer_layer_1/sequential/dense_2/Tensordot/Prod:output:0@transformer_layer_1/sequential/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:ч
:transformer_layer_1/sequential/dense_2/Tensordot/transpose	Transpose5transformer_layer_1/sequential/dense_1/Gelu/mul_1:z:0@transformer_layer_1/sequential/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€А€
8transformer_layer_1/sequential/dense_2/Tensordot/ReshapeReshape>transformer_layer_1/sequential/dense_2/Tensordot/transpose:y:0?transformer_layer_1/sequential/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€€
7transformer_layer_1/sequential/dense_2/Tensordot/MatMulMatMulAtransformer_layer_1/sequential/dense_2/Tensordot/Reshape:output:0Gtransformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@В
8transformer_layer_1/sequential/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@А
>transformer_layer_1/sequential/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : √
9transformer_layer_1/sequential/dense_2/Tensordot/concat_1ConcatV2Btransformer_layer_1/sequential/dense_2/Tensordot/GatherV2:output:0Atransformer_layer_1/sequential/dense_2/Tensordot/Const_2:output:0Gtransformer_layer_1/sequential/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:ш
0transformer_layer_1/sequential/dense_2/TensordotReshapeAtransformer_layer_1/sequential/dense_2/Tensordot/MatMul:product:0Btransformer_layer_1/sequential/dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@ј
=transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOpReadVariableOpFtransformer_layer_1_sequential_dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0с
.transformer_layer_1/sequential/dense_2/BiasAddBiasAdd9transformer_layer_1/sequential/dense_2/Tensordot:output:0Etransformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@Ѓ
transformer_layer_1/add_1AddV2transformer_layer_1/add:z:07transformer_layer_1/sequential/dense_2/BiasAdd:output:0*
T0*+
_output_shapes
:€€€€€€€€€@и
Mtransformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOpReadVariableOpVtransformer_layer_2_multi_head_attention_1_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ю
>transformer_layer_2/multi_head_attention_1/query/einsum/EinsumEinsumtransformer_layer_1/add_1:z:0Utransformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde–
Ctransformer_layer_2/multi_head_attention_1/query/add/ReadVariableOpReadVariableOpLtransformer_layer_2_multi_head_attention_1_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0Н
4transformer_layer_2/multi_head_attention_1/query/addAddV2Gtransformer_layer_2/multi_head_attention_1/query/einsum/Einsum:output:0Ktransformer_layer_2/multi_head_attention_1/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@д
Ktransformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOpReadVariableOpTtransformer_layer_2_multi_head_attention_1_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ъ
<transformer_layer_2/multi_head_attention_1/key/einsum/EinsumEinsumtransformer_layer_1/add_1:z:0Stransformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abdeћ
Atransformer_layer_2/multi_head_attention_1/key/add/ReadVariableOpReadVariableOpJtransformer_layer_2_multi_head_attention_1_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0З
2transformer_layer_2/multi_head_attention_1/key/addAddV2Etransformer_layer_2/multi_head_attention_1/key/einsum/Einsum:output:0Itransformer_layer_2/multi_head_attention_1/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@и
Mtransformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOpReadVariableOpVtransformer_layer_2_multi_head_attention_1_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ю
>transformer_layer_2/multi_head_attention_1/value/einsum/EinsumEinsumtransformer_layer_1/add_1:z:0Utransformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde–
Ctransformer_layer_2/multi_head_attention_1/value/add/ReadVariableOpReadVariableOpLtransformer_layer_2_multi_head_attention_1_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0Н
4transformer_layer_2/multi_head_attention_1/value/addAddV2Gtransformer_layer_2/multi_head_attention_1/value/einsum/Einsum:output:0Ktransformer_layer_2/multi_head_attention_1/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@u
0transformer_layer_2/multi_head_attention_1/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >д
.transformer_layer_2/multi_head_attention_1/MulMul8transformer_layer_2/multi_head_attention_1/query/add:z:09transformer_layer_2/multi_head_attention_1/Mul/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€@Р
8transformer_layer_2/multi_head_attention_1/einsum/EinsumEinsum6transformer_layer_2/multi_head_attention_1/key/add:z:02transformer_layer_2/multi_head_attention_1/Mul:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€*
equationaecd,abcd->acbe¬
:transformer_layer_2/multi_head_attention_1/softmax/SoftmaxSoftmaxAtransformer_layer_2/multi_head_attention_1/einsum/Einsum:output:0*
T0*/
_output_shapes
:€€€€€€€€€¶
:transformer_layer_2/multi_head_attention_1/einsum_1/EinsumEinsumDtransformer_layer_2/multi_head_attention_1/softmax/Softmax:softmax:08transformer_layer_2/multi_head_attention_1/value/add:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationacbe,aecd->abcdю
Xtransformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpatransformer_layer_2_multi_head_attention_1_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0÷
Itransformer_layer_2/multi_head_attention_1/attention_output/einsum/EinsumEinsumCtransformer_layer_2/multi_head_attention_1/einsum_1/Einsum:output:0`transformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:€€€€€€€€€@*
equationabcd,cde->abeв
Ntransformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOpReadVariableOpWtransformer_layer_2_multi_head_attention_1_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0™
?transformer_layer_2/multi_head_attention_1/attention_output/addAddV2Rtransformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum:output:0Vtransformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@Ї
transformer_layer_2/addAddV2transformer_layer_1/add_1:z:0Ctransformer_layer_2/multi_head_attention_1/attention_output/add:z:0*
T0*+
_output_shapes
:€€€€€€€€€@Ќ
Atransformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOpJtransformer_layer_2_sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@А*
dtype0Б
7transformer_layer_2/sequential_1/dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:И
7transformer_layer_2/sequential_1/dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Г
8transformer_layer_2/sequential_1/dense_3/Tensordot/ShapeShapetransformer_layer_2/add:z:0*
T0*
_output_shapes
:В
@transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : я
;transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2GatherV2Atransformer_layer_2/sequential_1/dense_3/Tensordot/Shape:output:0@transformer_layer_2/sequential_1/dense_3/Tensordot/free:output:0Itransformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Д
Btransformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : г
=transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2_1GatherV2Atransformer_layer_2/sequential_1/dense_3/Tensordot/Shape:output:0@transformer_layer_2/sequential_1/dense_3/Tensordot/axes:output:0Ktransformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:В
8transformer_layer_2/sequential_1/dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: й
7transformer_layer_2/sequential_1/dense_3/Tensordot/ProdProdDtransformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2:output:0Atransformer_layer_2/sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: Д
:transformer_layer_2/sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: п
9transformer_layer_2/sequential_1/dense_3/Tensordot/Prod_1ProdFtransformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2_1:output:0Ctransformer_layer_2/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: А
>transformer_layer_2/sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ј
9transformer_layer_2/sequential_1/dense_3/Tensordot/concatConcatV2@transformer_layer_2/sequential_1/dense_3/Tensordot/free:output:0@transformer_layer_2/sequential_1/dense_3/Tensordot/axes:output:0Gtransformer_layer_2/sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:ф
8transformer_layer_2/sequential_1/dense_3/Tensordot/stackPack@transformer_layer_2/sequential_1/dense_3/Tensordot/Prod:output:0Btransformer_layer_2/sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:а
<transformer_layer_2/sequential_1/dense_3/Tensordot/transpose	Transposetransformer_layer_2/add:z:0Btransformer_layer_2/sequential_1/dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Е
:transformer_layer_2/sequential_1/dense_3/Tensordot/ReshapeReshape@transformer_layer_2/sequential_1/dense_3/Tensordot/transpose:y:0Atransformer_layer_2/sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Ж
9transformer_layer_2/sequential_1/dense_3/Tensordot/MatMulMatMulCtransformer_layer_2/sequential_1/dense_3/Tensordot/Reshape:output:0Itransformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€АЕ
:transformer_layer_2/sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:АВ
@transformer_layer_2/sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ћ
;transformer_layer_2/sequential_1/dense_3/Tensordot/concat_1ConcatV2Dtransformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2:output:0Ctransformer_layer_2/sequential_1/dense_3/Tensordot/Const_2:output:0Itransformer_layer_2/sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:€
2transformer_layer_2/sequential_1/dense_3/TensordotReshapeCtransformer_layer_2/sequential_1/dense_3/Tensordot/MatMul:product:0Dtransformer_layer_2/sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€А≈
?transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOpHtransformer_layer_2_sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0ш
0transformer_layer_2/sequential_1/dense_3/BiasAddBiasAdd;transformer_layer_2/sequential_1/dense_3/Tensordot:output:0Gtransformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€Аx
3transformer_layer_2/sequential_1/dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?и
1transformer_layer_2/sequential_1/dense_3/Gelu/mulMul<transformer_layer_2/sequential_1/dense_3/Gelu/mul/x:output:09transformer_layer_2/sequential_1/dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аy
4transformer_layer_2/sequential_1/dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?с
5transformer_layer_2/sequential_1/dense_3/Gelu/truedivRealDiv9transformer_layer_2/sequential_1/dense_3/BiasAdd:output:0=transformer_layer_2/sequential_1/dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€А™
1transformer_layer_2/sequential_1/dense_3/Gelu/ErfErf9transformer_layer_2/sequential_1/dense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аx
3transformer_layer_2/sequential_1/dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?ж
1transformer_layer_2/sequential_1/dense_3/Gelu/addAddV2<transformer_layer_2/sequential_1/dense_3/Gelu/add/x:output:05transformer_layer_2/sequential_1/dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€Ая
3transformer_layer_2/sequential_1/dense_3/Gelu/mul_1Mul5transformer_layer_2/sequential_1/dense_3/Gelu/mul:z:05transformer_layer_2/sequential_1/dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€АЌ
Atransformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOpReadVariableOpJtransformer_layer_2_sequential_1_dense_4_tensordot_readvariableop_resource*
_output_shapes
:	А@*
dtype0Б
7transformer_layer_2/sequential_1/dense_4/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:И
7transformer_layer_2/sequential_1/dense_4/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Я
8transformer_layer_2/sequential_1/dense_4/Tensordot/ShapeShape7transformer_layer_2/sequential_1/dense_3/Gelu/mul_1:z:0*
T0*
_output_shapes
:В
@transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : я
;transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2GatherV2Atransformer_layer_2/sequential_1/dense_4/Tensordot/Shape:output:0@transformer_layer_2/sequential_1/dense_4/Tensordot/free:output:0Itransformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Д
Btransformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : г
=transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2_1GatherV2Atransformer_layer_2/sequential_1/dense_4/Tensordot/Shape:output:0@transformer_layer_2/sequential_1/dense_4/Tensordot/axes:output:0Ktransformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:В
8transformer_layer_2/sequential_1/dense_4/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: й
7transformer_layer_2/sequential_1/dense_4/Tensordot/ProdProdDtransformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2:output:0Atransformer_layer_2/sequential_1/dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: Д
:transformer_layer_2/sequential_1/dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: п
9transformer_layer_2/sequential_1/dense_4/Tensordot/Prod_1ProdFtransformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2_1:output:0Ctransformer_layer_2/sequential_1/dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: А
>transformer_layer_2/sequential_1/dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ј
9transformer_layer_2/sequential_1/dense_4/Tensordot/concatConcatV2@transformer_layer_2/sequential_1/dense_4/Tensordot/free:output:0@transformer_layer_2/sequential_1/dense_4/Tensordot/axes:output:0Gtransformer_layer_2/sequential_1/dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:ф
8transformer_layer_2/sequential_1/dense_4/Tensordot/stackPack@transformer_layer_2/sequential_1/dense_4/Tensordot/Prod:output:0Btransformer_layer_2/sequential_1/dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:э
<transformer_layer_2/sequential_1/dense_4/Tensordot/transpose	Transpose7transformer_layer_2/sequential_1/dense_3/Gelu/mul_1:z:0Btransformer_layer_2/sequential_1/dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€АЕ
:transformer_layer_2/sequential_1/dense_4/Tensordot/ReshapeReshape@transformer_layer_2/sequential_1/dense_4/Tensordot/transpose:y:0Atransformer_layer_2/sequential_1/dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Е
9transformer_layer_2/sequential_1/dense_4/Tensordot/MatMulMatMulCtransformer_layer_2/sequential_1/dense_4/Tensordot/Reshape:output:0Itransformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@Д
:transformer_layer_2/sequential_1/dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@В
@transformer_layer_2/sequential_1/dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ћ
;transformer_layer_2/sequential_1/dense_4/Tensordot/concat_1ConcatV2Dtransformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2:output:0Ctransformer_layer_2/sequential_1/dense_4/Tensordot/Const_2:output:0Itransformer_layer_2/sequential_1/dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:ю
2transformer_layer_2/sequential_1/dense_4/TensordotReshapeCtransformer_layer_2/sequential_1/dense_4/Tensordot/MatMul:product:0Dtransformer_layer_2/sequential_1/dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@ƒ
?transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOpReadVariableOpHtransformer_layer_2_sequential_1_dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0ч
0transformer_layer_2/sequential_1/dense_4/BiasAddBiasAdd;transformer_layer_2/sequential_1/dense_4/Tensordot:output:0Gtransformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@∞
transformer_layer_2/add_1AddV2transformer_layer_2/add:z:09transformer_layer_2/sequential_1/dense_4/BiasAdd:output:0*
T0*+
_output_shapes
:€€€€€€€€€@`
flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€   И
flatten_1/ReshapeReshapetransformer_layer_2/add_1:z:0flatten_1/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€А
Е
dense_5/MatMul/ReadVariableOpReadVariableOp&dense_5_matmul_readvariableop_resource*
_output_shapes
:	А
@*
dtype0Н
dense_5/MatMulMatMulflatten_1/Reshape:output:0%dense_5/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@В
dense_5/BiasAdd/ReadVariableOpReadVariableOp'dense_5_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0О
dense_5/BiasAddBiasAdddense_5/MatMul:product:0&dense_5/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@W
dense_5/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?А
dense_5/Gelu/mulMuldense_5/Gelu/mul/x:output:0dense_5/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€@X
dense_5/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?Й
dense_5/Gelu/truedivRealDivdense_5/BiasAdd:output:0dense_5/Gelu/Cast/x:output:0*
T0*'
_output_shapes
:€€€€€€€€€@c
dense_5/Gelu/ErfErfdense_5/Gelu/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€@W
dense_5/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?~
dense_5/Gelu/addAddV2dense_5/Gelu/add/x:output:0dense_5/Gelu/Erf:y:0*
T0*'
_output_shapes
:€€€€€€€€€@w
dense_5/Gelu/mul_1Muldense_5/Gelu/mul:z:0dense_5/Gelu/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€@Д
dense_6/MatMul/ReadVariableOpReadVariableOp&dense_6_matmul_readvariableop_resource*
_output_shapes

:@
*
dtype0Й
dense_6/MatMulMatMuldense_5/Gelu/mul_1:z:0%dense_6/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€
В
dense_6/BiasAdd/ReadVariableOpReadVariableOp'dense_6_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype0О
dense_6/BiasAddBiasAdddense_6/MatMul:product:0&dense_6/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€
f
dense_6/SoftmaxSoftmaxdense_6/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€
h
IdentityIdentitydense_6/Softmax:softmax:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
Є
NoOpNoOp^dense_5/BiasAdd/ReadVariableOp^dense_5/MatMul/ReadVariableOp^dense_6/BiasAdd/ReadVariableOp^dense_6/MatMul/ReadVariableOpD^encoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpC^encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpE^encoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpD^encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpF^encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpE^encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpG^encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpF^encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpF^encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpE^encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpG^encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpF^encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpT^encoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpS^encoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp4^frame_position_embedding/embedding/embedding_lookup0^time_distributed_1/dense/BiasAdd/ReadVariableOp/^time_distributed_1/dense/MatMul/ReadVariableOpM^transformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOpW^transformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp@^transformer_layer_1/multi_head_attention/key/add/ReadVariableOpJ^transformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOpB^transformer_layer_1/multi_head_attention/query/add/ReadVariableOpL^transformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOpB^transformer_layer_1/multi_head_attention/value/add/ReadVariableOpL^transformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOp>^transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOp@^transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOp>^transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOp@^transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOpO^transformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOpY^transformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpB^transformer_layer_2/multi_head_attention_1/key/add/ReadVariableOpL^transformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOpD^transformer_layer_2/multi_head_attention_1/query/add/ReadVariableOpN^transformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOpD^transformer_layer_2/multi_head_attention_1/value/add/ReadVariableOpN^transformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOp@^transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOpB^transformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOp@^transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOpB^transformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*М
_input_shapes{
y:€€€€€€€€€(: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2@
dense_5/BiasAdd/ReadVariableOpdense_5/BiasAdd/ReadVariableOp2>
dense_5/MatMul/ReadVariableOpdense_5/MatMul/ReadVariableOp2@
dense_6/BiasAdd/ReadVariableOpdense_6/BiasAdd/ReadVariableOp2>
dense_6/MatMul/ReadVariableOpdense_6/MatMul/ReadVariableOp2К
Cencoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpCencoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOp2И
Bencoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpBencoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOp2М
Dencoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpDencoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOp2К
Cencoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpCencoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOp2О
Eencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpEencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOp2М
Dencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpDencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOp2Р
Fencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpFencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOp2О
Eencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpEencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOp2О
Eencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpEencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOp2М
Dencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpDencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOp2Р
Fencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpFencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOp2О
Eencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpEencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOp2™
Sencoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpSencoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOp2®
Rencoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpRencoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp2j
3frame_position_embedding/embedding/embedding_lookup3frame_position_embedding/embedding/embedding_lookup2b
/time_distributed_1/dense/BiasAdd/ReadVariableOp/time_distributed_1/dense/BiasAdd/ReadVariableOp2`
.time_distributed_1/dense/MatMul/ReadVariableOp.time_distributed_1/dense/MatMul/ReadVariableOp2Ь
Ltransformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOpLtransformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOp2∞
Vtransformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpVtransformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp2В
?transformer_layer_1/multi_head_attention/key/add/ReadVariableOp?transformer_layer_1/multi_head_attention/key/add/ReadVariableOp2Ц
Itransformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOpItransformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOp2Ж
Atransformer_layer_1/multi_head_attention/query/add/ReadVariableOpAtransformer_layer_1/multi_head_attention/query/add/ReadVariableOp2Ъ
Ktransformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOpKtransformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOp2Ж
Atransformer_layer_1/multi_head_attention/value/add/ReadVariableOpAtransformer_layer_1/multi_head_attention/value/add/ReadVariableOp2Ъ
Ktransformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOpKtransformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOp2~
=transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOp=transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOp2В
?transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOp?transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOp2~
=transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOp=transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOp2В
?transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOp?transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOp2†
Ntransformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOpNtransformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOp2і
Xtransformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpXtransformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp2Ж
Atransformer_layer_2/multi_head_attention_1/key/add/ReadVariableOpAtransformer_layer_2/multi_head_attention_1/key/add/ReadVariableOp2Ъ
Ktransformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOpKtransformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOp2К
Ctransformer_layer_2/multi_head_attention_1/query/add/ReadVariableOpCtransformer_layer_2/multi_head_attention_1/query/add/ReadVariableOp2Ю
Mtransformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOpMtransformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOp2К
Ctransformer_layer_2/multi_head_attention_1/value/add/ReadVariableOpCtransformer_layer_2/multi_head_attention_1/value/add/ReadVariableOp2Ю
Mtransformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOpMtransformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOp2В
?transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOp?transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOp2Ж
Atransformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOpAtransformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOp2В
?transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOp?transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOp2Ж
Atransformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOpAtransformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOp:[ W
3
_output_shapes!
:€€€€€€€€€(
 
_user_specified_nameinputs
ќx
ъ
D__inference_encoder3d_layer_call_and_return_conditional_losses_24167

inputso
Qspatial_attention_spatial_attention_attention_conv_conv3d_readvariableop_resource:`
Rspatial_attention_spatial_attention_attention_conv_biasadd_readvariableop_resource:_
Aconv2_plus1d_conv3d_1_spatial_conv_conv3d_readvariableop_resource: P
Bconv2_plus1d_conv3d_1_spatial_conv_biasadd_readvariableop_resource: `
Bconv2_plus1d_conv3d_1_temporal_conv_conv3d_readvariableop_resource:  Q
Cconv2_plus1d_conv3d_1_temporal_conv_biasadd_readvariableop_resource: a
Cconv2_plus1d_1_conv3d_2_spatial_conv_conv3d_readvariableop_resource: @R
Dconv2_plus1d_1_conv3d_2_spatial_conv_biasadd_readvariableop_resource:@b
Dconv2_plus1d_1_conv3d_2_temporal_conv_conv3d_readvariableop_resource:@@S
Econv2_plus1d_1_conv3d_2_temporal_conv_biasadd_readvariableop_resource:@b
Cconv2_plus1d_2_conv3d_3_spatial_conv_conv3d_readvariableop_resource:@АS
Dconv2_plus1d_2_conv3d_3_spatial_conv_biasadd_readvariableop_resource:	Аd
Dconv2_plus1d_2_conv3d_3_temporal_conv_conv3d_readvariableop_resource:ААT
Econv2_plus1d_2_conv3d_3_temporal_conv_biasadd_readvariableop_resource:	А
identityИҐ9conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpҐ8conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpҐ:conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpҐ9conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpҐ;conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpҐ:conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpҐ<conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpҐ;conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpҐ;conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpҐ:conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpҐ<conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpҐ;conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpҐIspatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpҐHspatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpж
Hspatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpReadVariableOpQspatial_attention_spatial_attention_attention_conv_conv3d_readvariableop_resource**
_output_shapes
:*
dtype0Д
9spatial_attention/spatial_attention_attention_conv/Conv3DConv3DinputsPspatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(*
paddingSAME*
strides	
Ў
Ispatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpReadVariableOpRspatial_attention_spatial_attention_attention_conv_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Ъ
:spatial_attention/spatial_attention_attention_conv/BiasAddBiasAddBspatial_attention/spatial_attention_attention_conv/Conv3D:output:0Qspatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(В
=spatial_attention/spatial_attention_attention_conv/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Н
;spatial_attention/spatial_attention_attention_conv/Gelu/mulMulFspatial_attention/spatial_attention_attention_conv/Gelu/mul/x:output:0Cspatial_attention/spatial_attention_attention_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(Г
>spatial_attention/spatial_attention_attention_conv/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?Ц
?spatial_attention/spatial_attention_attention_conv/Gelu/truedivRealDivCspatial_attention/spatial_attention_attention_conv/BiasAdd:output:0Gspatial_attention/spatial_attention_attention_conv/Gelu/Cast/x:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(≈
;spatial_attention/spatial_attention_attention_conv/Gelu/ErfErfCspatial_attention/spatial_attention_attention_conv/Gelu/truediv:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(В
=spatial_attention/spatial_attention_attention_conv/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Л
;spatial_attention/spatial_attention_attention_conv/Gelu/addAddV2Fspatial_attention/spatial_attention_attention_conv/Gelu/add/x:output:0?spatial_attention/spatial_attention_attention_conv/Gelu/Erf:y:0*
T0*3
_output_shapes!
:€€€€€€€€€(Д
=spatial_attention/spatial_attention_attention_conv/Gelu/mul_1Mul?spatial_attention/spatial_attention_attention_conv/Gelu/mul:z:0?spatial_attention/spatial_attention_attention_conv/Gelu/add:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(ј
0spatial_attention/spatial_attention_multiply/mulMulinputsAspatial_attention/spatial_attention_attention_conv/Gelu/mul_1:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(∆
8conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpReadVariableOpAconv2_plus1d_conv3d_1_spatial_conv_conv3d_readvariableop_resource**
_output_shapes
: *
dtype0Т
)conv2_plus1d/conv3D_1_spatial_conv/Conv3DConv3D4spatial_attention/spatial_attention_multiply/mul:z:0@conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
paddingSAME*
strides	
Є
9conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpBconv2_plus1d_conv3d_1_spatial_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0к
*conv2_plus1d/conv3D_1_spatial_conv/BiasAddBiasAdd2conv2_plus1d/conv3D_1_spatial_conv/Conv3D:output:0Aconv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( Ґ
'conv2_plus1d/conv3D_1_spatial_conv/ReluRelu3conv2_plus1d/conv3D_1_spatial_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€( »
9conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpReadVariableOpBconv2_plus1d_conv3d_1_temporal_conv_conv3d_readvariableop_resource**
_output_shapes
:  *
dtype0Х
*conv2_plus1d/conv3D_1_temporal_conv/Conv3DConv3D5conv2_plus1d/conv3D_1_spatial_conv/Relu:activations:0Aconv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
paddingSAME*
strides	
Ї
:conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpCconv2_plus1d_conv3d_1_temporal_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0н
+conv2_plus1d/conv3D_1_temporal_conv/BiasAddBiasAdd3conv2_plus1d/conv3D_1_temporal_conv/Conv3D:output:0Bconv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( §
(conv2_plus1d/conv3D_1_temporal_conv/ReluRelu4conv2_plus1d/conv3D_1_temporal_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€( ’
pooling3d_1/MaxPool3D	MaxPool3D6conv2_plus1d/conv3D_1_temporal_conv/Relu:activations:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
ksize	
*
paddingSAME*
strides	
 
:conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_1_conv3d_2_spatial_conv_conv3d_readvariableop_resource**
_output_shapes
: @*
dtype0А
+conv2_plus1d_1/conv3D_2_spatial_conv/Conv3DConv3Dpooling3d_1/MaxPool3D:output:0Bconv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
paddingSAME*
strides	
Љ
;conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_1_conv3d_2_spatial_conv_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0р
,conv2_plus1d_1/conv3D_2_spatial_conv/BiasAddBiasAdd4conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D:output:0Cconv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@¶
)conv2_plus1d_1/conv3D_2_spatial_conv/ReluRelu5conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(@ћ
;conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpReadVariableOpDconv2_plus1d_1_conv3d_2_temporal_conv_conv3d_readvariableop_resource**
_output_shapes
:@@*
dtype0Ы
,conv2_plus1d_1/conv3D_2_temporal_conv/Conv3DConv3D7conv2_plus1d_1/conv3D_2_spatial_conv/Relu:activations:0Cconv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
paddingSAME*
strides	
Њ
<conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpEconv2_plus1d_1_conv3d_2_temporal_conv_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0у
-conv2_plus1d_1/conv3D_2_temporal_conv/BiasAddBiasAdd5conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D:output:0Dconv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@®
*conv2_plus1d_1/conv3D_2_temporal_conv/ReluRelu6conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(@„
pooling3d_2/MaxPool3D	MaxPool3D8conv2_plus1d_1/conv3D_2_temporal_conv/Relu:activations:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
ksize	
*
paddingSAME*
strides	
Ћ
:conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_2_conv3d_3_spatial_conv_conv3d_readvariableop_resource*+
_output_shapes
:@А*
dtype0Б
+conv2_plus1d_2/conv3D_3_spatial_conv/Conv3DConv3Dpooling3d_2/MaxPool3D:output:0Bconv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(А*
paddingSAME*
strides	
љ
;conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_2_conv3d_3_spatial_conv_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0с
,conv2_plus1d_2/conv3D_3_spatial_conv/BiasAddBiasAdd4conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D:output:0Cconv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(АІ
)conv2_plus1d_2/conv3D_3_spatial_conv/ReluRelu5conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd:output:0*
T0*4
_output_shapes"
 :€€€€€€€€€(Аќ
;conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpReadVariableOpDconv2_plus1d_2_conv3d_3_temporal_conv_conv3d_readvariableop_resource*,
_output_shapes
:АА*
dtype0Ь
,conv2_plus1d_2/conv3D_3_temporal_conv/Conv3DConv3D7conv2_plus1d_2/conv3D_3_spatial_conv/Relu:activations:0Cconv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(А*
paddingSAME*
strides	
њ
<conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpEconv2_plus1d_2_conv3d_3_temporal_conv_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0ф
-conv2_plus1d_2/conv3D_3_temporal_conv/BiasAddBiasAdd5conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D:output:0Dconv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(А©
*conv2_plus1d_2/conv3D_3_temporal_conv/ReluRelu6conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd:output:0*
T0*4
_output_shapes"
 :€€€€€€€€€(АЎ
pooling3d_3/MaxPool3D	MaxPool3D8conv2_plus1d_2/conv3D_3_temporal_conv/Relu:activations:0*
T0*4
_output_shapes"
 :€€€€€€€€€А*
ksize	
*
paddingSAME*
strides	
z
IdentityIdentitypooling3d_3/MaxPool3D:output:0^NoOp*
T0*4
_output_shapes"
 :€€€€€€€€€Аљ
NoOpNoOp:^conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOp9^conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOp;^conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOp:^conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOp<^conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOp;^conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOp=^conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOp<^conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOp<^conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOp;^conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOp=^conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOp<^conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpJ^spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpI^spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:€€€€€€€€€(: : : : : : : : : : : : : : 2v
9conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOp9conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOp2t
8conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOp8conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOp2x
:conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOp:conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOp2v
9conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOp9conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOp2z
;conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOp;conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOp2x
:conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOp:conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOp2|
<conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOp<conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOp2z
;conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOp;conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOp2z
;conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOp;conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOp2x
:conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOp:conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOp2|
<conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOp<conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOp2z
;conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOp;conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOp2Ц
Ispatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpIspatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOp2Ф
Hspatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpHspatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp:[ W
3
_output_shapes!
:€€€€€€€€€(
 
_user_specified_nameinputs
ќ
ъ
B__inference_dense_2_layer_call_and_return_conditional_losses_23777

inputs4
!tensordot_readvariableop_resource:	А@-
biasadd_readvariableop_resource:@
identityИҐBiasAdd/ReadVariableOpҐTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : ї
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
value	B : њ
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
value	B : Ь
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
:€€€€€€€€€АК
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€К
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@[
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : І
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Г
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0|
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@c
IdentityIdentityBiasAdd:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
Ѓ
–
*__inference_sequential_layer_call_fn_27407

inputs
unknown:	@А
	unknown_0:	А
	unknown_1:	А@
	unknown_2:@
identityИҐStatefulPartitionedCallы
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_23844s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
Ѓ
∞
G__inference_sequential_1_layer_call_and_return_conditional_losses_24096
dense_3_input 
dense_3_24085:	@А
dense_3_24087:	А 
dense_4_24090:	А@
dense_4_24092:@
identityИҐdense_3/StatefulPartitionedCallҐdense_4/StatefulPartitionedCallш
dense_3/StatefulPartitionedCallStatefulPartitionedCalldense_3_inputdense_3_24085dense_3_24087*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_23941Т
dense_4/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0dense_4_24090dense_4_24092*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_23977{
IdentityIdentity(dense_4/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@К
NoOpNoOp ^dense_3/StatefulPartitionedCall ^dense_4/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall:Z V
+
_output_shapes
:€€€€€€€€€@
'
_user_specified_namedense_3_input
≤
“
,__inference_sequential_1_layer_call_fn_27548

inputs
unknown:	@А
	unknown_0:	А
	unknown_1:	А@
	unknown_2:@
identityИҐStatefulPartitionedCallэ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *P
fKRI
G__inference_sequential_1_layer_call_and_return_conditional_losses_23984s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
√
Ў
%__inference_model_layer_call_fn_25891

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
	unknown_9:@А

unknown_10:	А*

unknown_11:АА

unknown_12:	А

unknown_13:	А@

unknown_14:@

unknown_15:@ 

unknown_16:@@

unknown_17:@ 

unknown_18:@@

unknown_19:@ 

unknown_20:@@

unknown_21:@ 

unknown_22:@@

unknown_23:@

unknown_24:	@А

unknown_25:	А

unknown_26:	А@

unknown_27:@ 

unknown_28:@@

unknown_29:@ 

unknown_30:@@

unknown_31:@ 

unknown_32:@@

unknown_33:@ 

unknown_34:@@

unknown_35:@

unknown_36:	@А

unknown_37:	А

unknown_38:	А@

unknown_39:@

unknown_40:	А
@

unknown_41:@

unknown_42:@


unknown_43:

identityИҐStatefulPartitionedCall©
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
:€€€€€€€€€
*O
_read_only_resource_inputs1
/-	
 !"#$%&'()*+,-*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_25196o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*М
_input_shapes{
y:€€€€€€€€€(: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:€€€€€€€€€(
 
_user_specified_nameinputs
∞
C
'__inference_flatten_layer_call_fn_27348

inputs
identity±
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_flatten_layer_call_and_return_conditional_losses_23570a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
√
Ў
%__inference_model_layer_call_fn_25796

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
	unknown_9:@А

unknown_10:	А*

unknown_11:АА

unknown_12:	А

unknown_13:	А@

unknown_14:@

unknown_15:@ 

unknown_16:@@

unknown_17:@ 

unknown_18:@@

unknown_19:@ 

unknown_20:@@

unknown_21:@ 

unknown_22:@@

unknown_23:@

unknown_24:	@А

unknown_25:	А

unknown_26:	А@

unknown_27:@ 

unknown_28:@@

unknown_29:@ 

unknown_30:@@

unknown_31:@ 

unknown_32:@@

unknown_33:@ 

unknown_34:@@

unknown_35:@

unknown_36:	@А

unknown_37:	А

unknown_38:	А@

unknown_39:@

unknown_40:	А
@

unknown_41:@

unknown_42:@


unknown_43:

identityИҐStatefulPartitionedCall©
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
:€€€€€€€€€
*O
_read_only_resource_inputs1
/-	
 !"#$%&'()*+,-*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_24523o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*М
_input_shapes{
y:€€€€€€€€€(: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:€€€€€€€€€(
 
_user_specified_nameinputs
№
√
S__inference_frame_position_embedding_layer_call_and_return_conditional_losses_26757

inputs2
 embedding_embedding_lookup_26750:@
identityИҐembedding/embedding_lookup;
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
valueB:—
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
:–
embedding/embedding_lookupResourceGather embedding_embedding_lookup_26750range:output:0*
Tindices0*3
_class)
'%loc:@embedding/embedding_lookup/26750*
_output_shapes

:@*
dtype0≤
#embedding/embedding_lookup/IdentityIdentity#embedding/embedding_lookup:output:0*
T0*3
_class)
'%loc:@embedding/embedding_lookup/26750*
_output_shapes

:@И
%embedding/embedding_lookup/Identity_1Identity,embedding/embedding_lookup/Identity:output:0*
T0*
_output_shapes

:@z
addAddV2inputs.embedding/embedding_lookup/Identity_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Z
IdentityIdentityadd:z:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@c
NoOpNoOp^embedding/embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*,
_input_shapes
:€€€€€€€€€@: 28
embedding/embedding_lookupembedding/embedding_lookup:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
ќ
ъ
B__inference_dense_4_layer_call_and_return_conditional_losses_27861

inputs4
!tensordot_readvariableop_resource:	А@-
biasadd_readvariableop_resource:@
identityИҐBiasAdd/ReadVariableOpҐTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : ї
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
value	B : њ
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
value	B : Ь
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
:€€€€€€€€€АК
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€К
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@[
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : І
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Г
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0|
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@c
IdentityIdentityBiasAdd:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
е’
Р>
 __inference__wrapped_model_23514
input_1
amodel_encoder3d_spatial_attention_spatial_attention_attention_conv_conv3d_readvariableop_resource:p
bmodel_encoder3d_spatial_attention_spatial_attention_attention_conv_biasadd_readvariableop_resource:o
Qmodel_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_conv3d_readvariableop_resource: `
Rmodel_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_biasadd_readvariableop_resource: p
Rmodel_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_conv3d_readvariableop_resource:  a
Smodel_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_biasadd_readvariableop_resource: q
Smodel_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_conv3d_readvariableop_resource: @b
Tmodel_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_biasadd_readvariableop_resource:@r
Tmodel_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_conv3d_readvariableop_resource:@@c
Umodel_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_biasadd_readvariableop_resource:@r
Smodel_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_conv3d_readvariableop_resource:@Аc
Tmodel_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_biasadd_readvariableop_resource:	Аt
Tmodel_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_conv3d_readvariableop_resource:ААd
Umodel_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_biasadd_readvariableop_resource:	АP
=model_time_distributed_1_dense_matmul_readvariableop_resource:	А@L
>model_time_distributed_1_dense_biasadd_readvariableop_resource:@Q
?model_frame_position_embedding_embedding_embedding_lookup_23300:@p
Zmodel_transformer_layer_1_multi_head_attention_query_einsum_einsum_readvariableop_resource:@@b
Pmodel_transformer_layer_1_multi_head_attention_query_add_readvariableop_resource:@n
Xmodel_transformer_layer_1_multi_head_attention_key_einsum_einsum_readvariableop_resource:@@`
Nmodel_transformer_layer_1_multi_head_attention_key_add_readvariableop_resource:@p
Zmodel_transformer_layer_1_multi_head_attention_value_einsum_einsum_readvariableop_resource:@@b
Pmodel_transformer_layer_1_multi_head_attention_value_add_readvariableop_resource:@{
emodel_transformer_layer_1_multi_head_attention_attention_output_einsum_einsum_readvariableop_resource:@@i
[model_transformer_layer_1_multi_head_attention_attention_output_add_readvariableop_resource:@a
Nmodel_transformer_layer_1_sequential_dense_1_tensordot_readvariableop_resource:	@А[
Lmodel_transformer_layer_1_sequential_dense_1_biasadd_readvariableop_resource:	Аa
Nmodel_transformer_layer_1_sequential_dense_2_tensordot_readvariableop_resource:	А@Z
Lmodel_transformer_layer_1_sequential_dense_2_biasadd_readvariableop_resource:@r
\model_transformer_layer_2_multi_head_attention_1_query_einsum_einsum_readvariableop_resource:@@d
Rmodel_transformer_layer_2_multi_head_attention_1_query_add_readvariableop_resource:@p
Zmodel_transformer_layer_2_multi_head_attention_1_key_einsum_einsum_readvariableop_resource:@@b
Pmodel_transformer_layer_2_multi_head_attention_1_key_add_readvariableop_resource:@r
\model_transformer_layer_2_multi_head_attention_1_value_einsum_einsum_readvariableop_resource:@@d
Rmodel_transformer_layer_2_multi_head_attention_1_value_add_readvariableop_resource:@}
gmodel_transformer_layer_2_multi_head_attention_1_attention_output_einsum_einsum_readvariableop_resource:@@k
]model_transformer_layer_2_multi_head_attention_1_attention_output_add_readvariableop_resource:@c
Pmodel_transformer_layer_2_sequential_1_dense_3_tensordot_readvariableop_resource:	@А]
Nmodel_transformer_layer_2_sequential_1_dense_3_biasadd_readvariableop_resource:	Аc
Pmodel_transformer_layer_2_sequential_1_dense_4_tensordot_readvariableop_resource:	А@\
Nmodel_transformer_layer_2_sequential_1_dense_4_biasadd_readvariableop_resource:@?
,model_dense_5_matmul_readvariableop_resource:	А
@;
-model_dense_5_biasadd_readvariableop_resource:@>
,model_dense_6_matmul_readvariableop_resource:@
;
-model_dense_6_biasadd_readvariableop_resource:

identityИҐ$model/dense_5/BiasAdd/ReadVariableOpҐ#model/dense_5/MatMul/ReadVariableOpҐ$model/dense_6/BiasAdd/ReadVariableOpҐ#model/dense_6/MatMul/ReadVariableOpҐImodel/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpҐHmodel/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpҐJmodel/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpҐImodel/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpҐKmodel/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpҐJmodel/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpҐLmodel/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpҐKmodel/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpҐKmodel/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpҐJmodel/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpҐLmodel/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpҐKmodel/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpҐYmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpҐXmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpҐ9model/frame_position_embedding/embedding/embedding_lookupҐ5model/time_distributed_1/dense/BiasAdd/ReadVariableOpҐ4model/time_distributed_1/dense/MatMul/ReadVariableOpҐRmodel/transformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOpҐ\model/transformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpҐEmodel/transformer_layer_1/multi_head_attention/key/add/ReadVariableOpҐOmodel/transformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOpҐGmodel/transformer_layer_1/multi_head_attention/query/add/ReadVariableOpҐQmodel/transformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOpҐGmodel/transformer_layer_1/multi_head_attention/value/add/ReadVariableOpҐQmodel/transformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOpҐCmodel/transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOpҐEmodel/transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOpҐCmodel/transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOpҐEmodel/transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOpҐTmodel/transformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOpҐ^model/transformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpҐGmodel/transformer_layer_2/multi_head_attention_1/key/add/ReadVariableOpҐQmodel/transformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOpҐImodel/transformer_layer_2/multi_head_attention_1/query/add/ReadVariableOpҐSmodel/transformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOpҐImodel/transformer_layer_2/multi_head_attention_1/value/add/ReadVariableOpҐSmodel/transformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOpҐEmodel/transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOpҐGmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOpҐEmodel/transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOpҐGmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOpЖ
Xmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpReadVariableOpamodel_encoder3d_spatial_attention_spatial_attention_attention_conv_conv3d_readvariableop_resource**
_output_shapes
:*
dtype0•
Imodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Conv3DConv3Dinput_1`model/encoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(*
paddingSAME*
strides	
ш
Ymodel/encoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpReadVariableOpbmodel_encoder3d_spatial_attention_spatial_attention_attention_conv_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0 
Jmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/BiasAddBiasAddRmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D:output:0amodel/encoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(Т
Mmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?љ
Kmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mulMulVmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul/x:output:0Smodel/encoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(У
Nmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?∆
Omodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/truedivRealDivSmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd:output:0Wmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/Cast/x:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(е
Kmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/ErfErfSmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/truediv:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(Т
Mmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?ї
Kmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/addAddV2Vmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/add/x:output:0Omodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/Erf:y:0*
T0*3
_output_shapes!
:€€€€€€€€€(і
Mmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul_1MulOmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul:z:0Omodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/add:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(б
@model/encoder3d/spatial_attention/spatial_attention_multiply/mulMulinput_1Qmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul_1:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(ж
Hmodel/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpReadVariableOpQmodel_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_conv3d_readvariableop_resource**
_output_shapes
: *
dtype0¬
9model/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3DConv3DDmodel/encoder3d/spatial_attention/spatial_attention_multiply/mul:z:0Pmodel/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
paddingSAME*
strides	
Ў
Imodel/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpRmodel_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0Ъ
:model/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAddBiasAddBmodel/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D:output:0Qmodel/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( ¬
7model/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/ReluReluCmodel/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€( и
Imodel/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpReadVariableOpRmodel_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_conv3d_readvariableop_resource**
_output_shapes
:  *
dtype0≈
:model/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3DConv3DEmodel/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Relu:activations:0Qmodel/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
paddingSAME*
strides	
Џ
Jmodel/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpSmodel_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0Э
;model/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAddBiasAddCmodel/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D:output:0Rmodel/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( ƒ
8model/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/ReluReluDmodel/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€( х
%model/encoder3d/pooling3d_1/MaxPool3D	MaxPool3DFmodel/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Relu:activations:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
ksize	
*
paddingSAME*
strides	
к
Jmodel/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpReadVariableOpSmodel_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_conv3d_readvariableop_resource**
_output_shapes
: @*
dtype0∞
;model/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3DConv3D.model/encoder3d/pooling3d_1/MaxPool3D:output:0Rmodel/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
paddingSAME*
strides	
№
Kmodel/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpTmodel_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0†
<model/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAddBiasAddDmodel/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D:output:0Smodel/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@∆
9model/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/ReluReluEmodel/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(@м
Kmodel/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpReadVariableOpTmodel_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_conv3d_readvariableop_resource**
_output_shapes
:@@*
dtype0Ћ
<model/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3DConv3DGmodel/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Relu:activations:0Smodel/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
paddingSAME*
strides	
ё
Lmodel/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpUmodel_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0£
=model/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAddBiasAddEmodel/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D:output:0Tmodel/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@»
:model/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/ReluReluFmodel/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(@ч
%model/encoder3d/pooling3d_2/MaxPool3D	MaxPool3DHmodel/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Relu:activations:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
ksize	
*
paddingSAME*
strides	
л
Jmodel/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpReadVariableOpSmodel_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_conv3d_readvariableop_resource*+
_output_shapes
:@А*
dtype0±
;model/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3DConv3D.model/encoder3d/pooling3d_2/MaxPool3D:output:0Rmodel/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(А*
paddingSAME*
strides	
Ё
Kmodel/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpTmodel_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0°
<model/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAddBiasAddDmodel/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D:output:0Smodel/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(А«
9model/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/ReluReluEmodel/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd:output:0*
T0*4
_output_shapes"
 :€€€€€€€€€(Ао
Kmodel/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpReadVariableOpTmodel_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_conv3d_readvariableop_resource*,
_output_shapes
:АА*
dtype0ћ
<model/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3DConv3DGmodel/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Relu:activations:0Smodel/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(А*
paddingSAME*
strides	
я
Lmodel/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpUmodel_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0§
=model/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAddBiasAddEmodel/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D:output:0Tmodel/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(А…
:model/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/ReluReluFmodel/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd:output:0*
T0*4
_output_shapes"
 :€€€€€€€€€(Аш
%model/encoder3d/pooling3d_3/MaxPool3D	MaxPool3DHmodel/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Relu:activations:0*
T0*4
_output_shapes"
 :€€€€€€€€€А*
ksize	
*
paddingSAME*
strides	
}
$model/time_distributed/Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"€€€€      А   √
model/time_distributed/ReshapeReshape.model/encoder3d/pooling3d_3/MaxPool3D:output:0-model/time_distributed/Reshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€Аu
$model/time_distributed/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€   Љ
&model/time_distributed/flatten/ReshapeReshape'model/time_distributed/Reshape:output:0-model/time_distributed/flatten/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€А{
&model/time_distributed/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*!
valueB"€€€€      ƒ
 model/time_distributed/Reshape_1Reshape/model/time_distributed/flatten/Reshape:output:0/model/time_distributed/Reshape_1/shape:output:0*
T0*,
_output_shapes
:€€€€€€€€€А
&model/time_distributed/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*%
valueB"€€€€      А   «
 model/time_distributed/Reshape_2Reshape.model/encoder3d/pooling3d_3/MaxPool3D:output:0/model/time_distributed/Reshape_2/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€Аw
&model/time_distributed_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"€€€€   Ї
 model/time_distributed_1/ReshapeReshape)model/time_distributed/Reshape_1:output:0/model/time_distributed_1/Reshape/shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€А≥
4model/time_distributed_1/dense/MatMul/ReadVariableOpReadVariableOp=model_time_distributed_1_dense_matmul_readvariableop_resource*
_output_shapes
:	А@*
dtype0 
%model/time_distributed_1/dense/MatMulMatMul)model/time_distributed_1/Reshape:output:0<model/time_distributed_1/dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@∞
5model/time_distributed_1/dense/BiasAdd/ReadVariableOpReadVariableOp>model_time_distributed_1_dense_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0”
&model/time_distributed_1/dense/BiasAddBiasAdd/model/time_distributed_1/dense/MatMul:product:0=model/time_distributed_1/dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@n
)model/time_distributed_1/dense/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?≈
'model/time_distributed_1/dense/Gelu/mulMul2model/time_distributed_1/dense/Gelu/mul/x:output:0/model/time_distributed_1/dense/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€@o
*model/time_distributed_1/dense/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?ќ
+model/time_distributed_1/dense/Gelu/truedivRealDiv/model/time_distributed_1/dense/BiasAdd:output:03model/time_distributed_1/dense/Gelu/Cast/x:output:0*
T0*'
_output_shapes
:€€€€€€€€€@С
'model/time_distributed_1/dense/Gelu/ErfErf/model/time_distributed_1/dense/Gelu/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€@n
)model/time_distributed_1/dense/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?√
'model/time_distributed_1/dense/Gelu/addAddV22model/time_distributed_1/dense/Gelu/add/x:output:0+model/time_distributed_1/dense/Gelu/Erf:y:0*
T0*'
_output_shapes
:€€€€€€€€€@Љ
)model/time_distributed_1/dense/Gelu/mul_1Mul+model/time_distributed_1/dense/Gelu/mul:z:0+model/time_distributed_1/dense/Gelu/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€@}
(model/time_distributed_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*!
valueB"€€€€   @   ≈
"model/time_distributed_1/Reshape_1Reshape-model/time_distributed_1/dense/Gelu/mul_1:z:01model/time_distributed_1/Reshape_1/shape:output:0*
T0*+
_output_shapes
:€€€€€€€€€@y
(model/time_distributed_1/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*
valueB"€€€€   Њ
"model/time_distributed_1/Reshape_2Reshape)model/time_distributed/Reshape_1:output:01model/time_distributed_1/Reshape_2/shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€А
$model/frame_position_embedding/ShapeShape+model/time_distributed_1/Reshape_1:output:0*
T0*
_output_shapes
:|
2model/frame_position_embedding/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:~
4model/frame_position_embedding/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:~
4model/frame_position_embedding/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:м
,model/frame_position_embedding/strided_sliceStridedSlice-model/frame_position_embedding/Shape:output:0;model/frame_position_embedding/strided_slice/stack:output:0=model/frame_position_embedding/strided_slice/stack_1:output:0=model/frame_position_embedding/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskl
*model/frame_position_embedding/range/startConst*
_output_shapes
: *
dtype0*
value	B : l
*model/frame_position_embedding/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :к
$model/frame_position_embedding/rangeRange3model/frame_position_embedding/range/start:output:05model/frame_position_embedding/strided_slice:output:03model/frame_position_embedding/range/delta:output:0*
_output_shapes
:ћ
9model/frame_position_embedding/embedding/embedding_lookupResourceGather?model_frame_position_embedding_embedding_embedding_lookup_23300-model/frame_position_embedding/range:output:0*
Tindices0*R
_classH
FDloc:@model/frame_position_embedding/embedding/embedding_lookup/23300*
_output_shapes

:@*
dtype0П
Bmodel/frame_position_embedding/embedding/embedding_lookup/IdentityIdentityBmodel/frame_position_embedding/embedding/embedding_lookup:output:0*
T0*R
_classH
FDloc:@model/frame_position_embedding/embedding/embedding_lookup/23300*
_output_shapes

:@∆
Dmodel/frame_position_embedding/embedding/embedding_lookup/Identity_1IdentityKmodel/frame_position_embedding/embedding/embedding_lookup/Identity:output:0*
T0*
_output_shapes

:@Ё
"model/frame_position_embedding/addAddV2+model/time_distributed_1/Reshape_1:output:0Mmodel/frame_position_embedding/embedding/embedding_lookup/Identity_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@р
Qmodel/transformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOpZmodel_transformer_layer_1_multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0ѓ
Bmodel/transformer_layer_1/multi_head_attention/query/einsum/EinsumEinsum&model/frame_position_embedding/add:z:0Ymodel/transformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abdeЎ
Gmodel/transformer_layer_1/multi_head_attention/query/add/ReadVariableOpReadVariableOpPmodel_transformer_layer_1_multi_head_attention_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0Щ
8model/transformer_layer_1/multi_head_attention/query/addAddV2Kmodel/transformer_layer_1/multi_head_attention/query/einsum/Einsum:output:0Omodel/transformer_layer_1/multi_head_attention/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@м
Omodel/transformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOpXmodel_transformer_layer_1_multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ђ
@model/transformer_layer_1/multi_head_attention/key/einsum/EinsumEinsum&model/frame_position_embedding/add:z:0Wmodel/transformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde‘
Emodel/transformer_layer_1/multi_head_attention/key/add/ReadVariableOpReadVariableOpNmodel_transformer_layer_1_multi_head_attention_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0У
6model/transformer_layer_1/multi_head_attention/key/addAddV2Imodel/transformer_layer_1/multi_head_attention/key/einsum/Einsum:output:0Mmodel/transformer_layer_1/multi_head_attention/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@р
Qmodel/transformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOpZmodel_transformer_layer_1_multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0ѓ
Bmodel/transformer_layer_1/multi_head_attention/value/einsum/EinsumEinsum&model/frame_position_embedding/add:z:0Ymodel/transformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abdeЎ
Gmodel/transformer_layer_1/multi_head_attention/value/add/ReadVariableOpReadVariableOpPmodel_transformer_layer_1_multi_head_attention_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0Щ
8model/transformer_layer_1/multi_head_attention/value/addAddV2Kmodel/transformer_layer_1/multi_head_attention/value/einsum/Einsum:output:0Omodel/transformer_layer_1/multi_head_attention/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@y
4model/transformer_layer_1/multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >р
2model/transformer_layer_1/multi_head_attention/MulMul<model/transformer_layer_1/multi_head_attention/query/add:z:0=model/transformer_layer_1/multi_head_attention/Mul/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€@Ь
<model/transformer_layer_1/multi_head_attention/einsum/EinsumEinsum:model/transformer_layer_1/multi_head_attention/key/add:z:06model/transformer_layer_1/multi_head_attention/Mul:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€*
equationaecd,abcd->acbe 
>model/transformer_layer_1/multi_head_attention/softmax/SoftmaxSoftmaxEmodel/transformer_layer_1/multi_head_attention/einsum/Einsum:output:0*
T0*/
_output_shapes
:€€€€€€€€€ѕ
?model/transformer_layer_1/multi_head_attention/dropout/IdentityIdentityHmodel/transformer_layer_1/multi_head_attention/softmax/Softmax:softmax:0*
T0*/
_output_shapes
:€€€€€€€€€≤
>model/transformer_layer_1/multi_head_attention/einsum_1/EinsumEinsumHmodel/transformer_layer_1/multi_head_attention/dropout/Identity:output:0<model/transformer_layer_1/multi_head_attention/value/add:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationacbe,aecd->abcdЖ
\model/transformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpemodel_transformer_layer_1_multi_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0в
Mmodel/transformer_layer_1/multi_head_attention/attention_output/einsum/EinsumEinsumGmodel/transformer_layer_1/multi_head_attention/einsum_1/Einsum:output:0dmodel/transformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:€€€€€€€€€@*
equationabcd,cde->abeк
Rmodel/transformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOpReadVariableOp[model_transformer_layer_1_multi_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0ґ
Cmodel/transformer_layer_1/multi_head_attention/attention_output/addAddV2Vmodel/transformer_layer_1/multi_head_attention/attention_output/einsum/Einsum:output:0Zmodel/transformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@Ќ
model/transformer_layer_1/addAddV2&model/frame_position_embedding/add:z:0Gmodel/transformer_layer_1/multi_head_attention/attention_output/add:z:0*
T0*+
_output_shapes
:€€€€€€€€€@’
Emodel/transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOpReadVariableOpNmodel_transformer_layer_1_sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@А*
dtype0Е
;model/transformer_layer_1/sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:М
;model/transformer_layer_1/sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Н
<model/transformer_layer_1/sequential/dense_1/Tensordot/ShapeShape!model/transformer_layer_1/add:z:0*
T0*
_output_shapes
:Ж
Dmodel/transformer_layer_1/sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : п
?model/transformer_layer_1/sequential/dense_1/Tensordot/GatherV2GatherV2Emodel/transformer_layer_1/sequential/dense_1/Tensordot/Shape:output:0Dmodel/transformer_layer_1/sequential/dense_1/Tensordot/free:output:0Mmodel/transformer_layer_1/sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:И
Fmodel/transformer_layer_1/sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : у
Amodel/transformer_layer_1/sequential/dense_1/Tensordot/GatherV2_1GatherV2Emodel/transformer_layer_1/sequential/dense_1/Tensordot/Shape:output:0Dmodel/transformer_layer_1/sequential/dense_1/Tensordot/axes:output:0Omodel/transformer_layer_1/sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Ж
<model/transformer_layer_1/sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: х
;model/transformer_layer_1/sequential/dense_1/Tensordot/ProdProdHmodel/transformer_layer_1/sequential/dense_1/Tensordot/GatherV2:output:0Emodel/transformer_layer_1/sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: И
>model/transformer_layer_1/sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ы
=model/transformer_layer_1/sequential/dense_1/Tensordot/Prod_1ProdJmodel/transformer_layer_1/sequential/dense_1/Tensordot/GatherV2_1:output:0Gmodel/transformer_layer_1/sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: Д
Bmodel/transformer_layer_1/sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : –
=model/transformer_layer_1/sequential/dense_1/Tensordot/concatConcatV2Dmodel/transformer_layer_1/sequential/dense_1/Tensordot/free:output:0Dmodel/transformer_layer_1/sequential/dense_1/Tensordot/axes:output:0Kmodel/transformer_layer_1/sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:А
<model/transformer_layer_1/sequential/dense_1/Tensordot/stackPackDmodel/transformer_layer_1/sequential/dense_1/Tensordot/Prod:output:0Fmodel/transformer_layer_1/sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:о
@model/transformer_layer_1/sequential/dense_1/Tensordot/transpose	Transpose!model/transformer_layer_1/add:z:0Fmodel/transformer_layer_1/sequential/dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@С
>model/transformer_layer_1/sequential/dense_1/Tensordot/ReshapeReshapeDmodel/transformer_layer_1/sequential/dense_1/Tensordot/transpose:y:0Emodel/transformer_layer_1/sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Т
=model/transformer_layer_1/sequential/dense_1/Tensordot/MatMulMatMulGmodel/transformer_layer_1/sequential/dense_1/Tensordot/Reshape:output:0Mmodel/transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€АЙ
>model/transformer_layer_1/sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:АЖ
Dmodel/transformer_layer_1/sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : џ
?model/transformer_layer_1/sequential/dense_1/Tensordot/concat_1ConcatV2Hmodel/transformer_layer_1/sequential/dense_1/Tensordot/GatherV2:output:0Gmodel/transformer_layer_1/sequential/dense_1/Tensordot/Const_2:output:0Mmodel/transformer_layer_1/sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Л
6model/transformer_layer_1/sequential/dense_1/TensordotReshapeGmodel/transformer_layer_1/sequential/dense_1/Tensordot/MatMul:product:0Hmodel/transformer_layer_1/sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АЌ
Cmodel/transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOpLmodel_transformer_layer_1_sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Д
4model/transformer_layer_1/sequential/dense_1/BiasAddBiasAdd?model/transformer_layer_1/sequential/dense_1/Tensordot:output:0Kmodel/transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€А|
7model/transformer_layer_1/sequential/dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?ф
5model/transformer_layer_1/sequential/dense_1/Gelu/mulMul@model/transformer_layer_1/sequential/dense_1/Gelu/mul/x:output:0=model/transformer_layer_1/sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€А}
8model/transformer_layer_1/sequential/dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?э
9model/transformer_layer_1/sequential/dense_1/Gelu/truedivRealDiv=model/transformer_layer_1/sequential/dense_1/BiasAdd:output:0Amodel/transformer_layer_1/sequential/dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€А≤
5model/transformer_layer_1/sequential/dense_1/Gelu/ErfErf=model/transformer_layer_1/sequential/dense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€А|
7model/transformer_layer_1/sequential/dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?т
5model/transformer_layer_1/sequential/dense_1/Gelu/addAddV2@model/transformer_layer_1/sequential/dense_1/Gelu/add/x:output:09model/transformer_layer_1/sequential/dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€Ал
7model/transformer_layer_1/sequential/dense_1/Gelu/mul_1Mul9model/transformer_layer_1/sequential/dense_1/Gelu/mul:z:09model/transformer_layer_1/sequential/dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€А’
Emodel/transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOpReadVariableOpNmodel_transformer_layer_1_sequential_dense_2_tensordot_readvariableop_resource*
_output_shapes
:	А@*
dtype0Е
;model/transformer_layer_1/sequential/dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:М
;model/transformer_layer_1/sequential/dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       І
<model/transformer_layer_1/sequential/dense_2/Tensordot/ShapeShape;model/transformer_layer_1/sequential/dense_1/Gelu/mul_1:z:0*
T0*
_output_shapes
:Ж
Dmodel/transformer_layer_1/sequential/dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : п
?model/transformer_layer_1/sequential/dense_2/Tensordot/GatherV2GatherV2Emodel/transformer_layer_1/sequential/dense_2/Tensordot/Shape:output:0Dmodel/transformer_layer_1/sequential/dense_2/Tensordot/free:output:0Mmodel/transformer_layer_1/sequential/dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:И
Fmodel/transformer_layer_1/sequential/dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : у
Amodel/transformer_layer_1/sequential/dense_2/Tensordot/GatherV2_1GatherV2Emodel/transformer_layer_1/sequential/dense_2/Tensordot/Shape:output:0Dmodel/transformer_layer_1/sequential/dense_2/Tensordot/axes:output:0Omodel/transformer_layer_1/sequential/dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Ж
<model/transformer_layer_1/sequential/dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: х
;model/transformer_layer_1/sequential/dense_2/Tensordot/ProdProdHmodel/transformer_layer_1/sequential/dense_2/Tensordot/GatherV2:output:0Emodel/transformer_layer_1/sequential/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: И
>model/transformer_layer_1/sequential/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ы
=model/transformer_layer_1/sequential/dense_2/Tensordot/Prod_1ProdJmodel/transformer_layer_1/sequential/dense_2/Tensordot/GatherV2_1:output:0Gmodel/transformer_layer_1/sequential/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: Д
Bmodel/transformer_layer_1/sequential/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : –
=model/transformer_layer_1/sequential/dense_2/Tensordot/concatConcatV2Dmodel/transformer_layer_1/sequential/dense_2/Tensordot/free:output:0Dmodel/transformer_layer_1/sequential/dense_2/Tensordot/axes:output:0Kmodel/transformer_layer_1/sequential/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:А
<model/transformer_layer_1/sequential/dense_2/Tensordot/stackPackDmodel/transformer_layer_1/sequential/dense_2/Tensordot/Prod:output:0Fmodel/transformer_layer_1/sequential/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Й
@model/transformer_layer_1/sequential/dense_2/Tensordot/transpose	Transpose;model/transformer_layer_1/sequential/dense_1/Gelu/mul_1:z:0Fmodel/transformer_layer_1/sequential/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€АС
>model/transformer_layer_1/sequential/dense_2/Tensordot/ReshapeReshapeDmodel/transformer_layer_1/sequential/dense_2/Tensordot/transpose:y:0Emodel/transformer_layer_1/sequential/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€С
=model/transformer_layer_1/sequential/dense_2/Tensordot/MatMulMatMulGmodel/transformer_layer_1/sequential/dense_2/Tensordot/Reshape:output:0Mmodel/transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@И
>model/transformer_layer_1/sequential/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@Ж
Dmodel/transformer_layer_1/sequential/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : џ
?model/transformer_layer_1/sequential/dense_2/Tensordot/concat_1ConcatV2Hmodel/transformer_layer_1/sequential/dense_2/Tensordot/GatherV2:output:0Gmodel/transformer_layer_1/sequential/dense_2/Tensordot/Const_2:output:0Mmodel/transformer_layer_1/sequential/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:К
6model/transformer_layer_1/sequential/dense_2/TensordotReshapeGmodel/transformer_layer_1/sequential/dense_2/Tensordot/MatMul:product:0Hmodel/transformer_layer_1/sequential/dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@ћ
Cmodel/transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOpReadVariableOpLmodel_transformer_layer_1_sequential_dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Г
4model/transformer_layer_1/sequential/dense_2/BiasAddBiasAdd?model/transformer_layer_1/sequential/dense_2/Tensordot:output:0Kmodel/transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@ј
model/transformer_layer_1/add_1AddV2!model/transformer_layer_1/add:z:0=model/transformer_layer_1/sequential/dense_2/BiasAdd:output:0*
T0*+
_output_shapes
:€€€€€€€€€@ф
Smodel/transformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOpReadVariableOp\model_transformer_layer_2_multi_head_attention_1_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0∞
Dmodel/transformer_layer_2/multi_head_attention_1/query/einsum/EinsumEinsum#model/transformer_layer_1/add_1:z:0[model/transformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde№
Imodel/transformer_layer_2/multi_head_attention_1/query/add/ReadVariableOpReadVariableOpRmodel_transformer_layer_2_multi_head_attention_1_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0Я
:model/transformer_layer_2/multi_head_attention_1/query/addAddV2Mmodel/transformer_layer_2/multi_head_attention_1/query/einsum/Einsum:output:0Qmodel/transformer_layer_2/multi_head_attention_1/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@р
Qmodel/transformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOpReadVariableOpZmodel_transformer_layer_2_multi_head_attention_1_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0ђ
Bmodel/transformer_layer_2/multi_head_attention_1/key/einsum/EinsumEinsum#model/transformer_layer_1/add_1:z:0Ymodel/transformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abdeЎ
Gmodel/transformer_layer_2/multi_head_attention_1/key/add/ReadVariableOpReadVariableOpPmodel_transformer_layer_2_multi_head_attention_1_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Щ
8model/transformer_layer_2/multi_head_attention_1/key/addAddV2Kmodel/transformer_layer_2/multi_head_attention_1/key/einsum/Einsum:output:0Omodel/transformer_layer_2/multi_head_attention_1/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@ф
Smodel/transformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOpReadVariableOp\model_transformer_layer_2_multi_head_attention_1_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0∞
Dmodel/transformer_layer_2/multi_head_attention_1/value/einsum/EinsumEinsum#model/transformer_layer_1/add_1:z:0[model/transformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde№
Imodel/transformer_layer_2/multi_head_attention_1/value/add/ReadVariableOpReadVariableOpRmodel_transformer_layer_2_multi_head_attention_1_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0Я
:model/transformer_layer_2/multi_head_attention_1/value/addAddV2Mmodel/transformer_layer_2/multi_head_attention_1/value/einsum/Einsum:output:0Qmodel/transformer_layer_2/multi_head_attention_1/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@{
6model/transformer_layer_2/multi_head_attention_1/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >ц
4model/transformer_layer_2/multi_head_attention_1/MulMul>model/transformer_layer_2/multi_head_attention_1/query/add:z:0?model/transformer_layer_2/multi_head_attention_1/Mul/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€@Ґ
>model/transformer_layer_2/multi_head_attention_1/einsum/EinsumEinsum<model/transformer_layer_2/multi_head_attention_1/key/add:z:08model/transformer_layer_2/multi_head_attention_1/Mul:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€*
equationaecd,abcd->acbeќ
@model/transformer_layer_2/multi_head_attention_1/softmax/SoftmaxSoftmaxGmodel/transformer_layer_2/multi_head_attention_1/einsum/Einsum:output:0*
T0*/
_output_shapes
:€€€€€€€€€”
Amodel/transformer_layer_2/multi_head_attention_1/dropout/IdentityIdentityJmodel/transformer_layer_2/multi_head_attention_1/softmax/Softmax:softmax:0*
T0*/
_output_shapes
:€€€€€€€€€Є
@model/transformer_layer_2/multi_head_attention_1/einsum_1/EinsumEinsumJmodel/transformer_layer_2/multi_head_attention_1/dropout/Identity:output:0>model/transformer_layer_2/multi_head_attention_1/value/add:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationacbe,aecd->abcdК
^model/transformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpgmodel_transformer_layer_2_multi_head_attention_1_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0и
Omodel/transformer_layer_2/multi_head_attention_1/attention_output/einsum/EinsumEinsumImodel/transformer_layer_2/multi_head_attention_1/einsum_1/Einsum:output:0fmodel/transformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:€€€€€€€€€@*
equationabcd,cde->abeо
Tmodel/transformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOpReadVariableOp]model_transformer_layer_2_multi_head_attention_1_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0Љ
Emodel/transformer_layer_2/multi_head_attention_1/attention_output/addAddV2Xmodel/transformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum:output:0\model/transformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@ћ
model/transformer_layer_2/addAddV2#model/transformer_layer_1/add_1:z:0Imodel/transformer_layer_2/multi_head_attention_1/attention_output/add:z:0*
T0*+
_output_shapes
:€€€€€€€€€@ў
Gmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOpPmodel_transformer_layer_2_sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@А*
dtype0З
=model/transformer_layer_2/sequential_1/dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:О
=model/transformer_layer_2/sequential_1/dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       П
>model/transformer_layer_2/sequential_1/dense_3/Tensordot/ShapeShape!model/transformer_layer_2/add:z:0*
T0*
_output_shapes
:И
Fmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ч
Amodel/transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2GatherV2Gmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/Shape:output:0Fmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/free:output:0Omodel/transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:К
Hmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ы
Cmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2_1GatherV2Gmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/Shape:output:0Fmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/axes:output:0Qmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:И
>model/transformer_layer_2/sequential_1/dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ы
=model/transformer_layer_2/sequential_1/dense_3/Tensordot/ProdProdJmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2:output:0Gmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: К
@model/transformer_layer_2/sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: Б
?model/transformer_layer_2/sequential_1/dense_3/Tensordot/Prod_1ProdLmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2_1:output:0Imodel/transformer_layer_2/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: Ж
Dmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Ў
?model/transformer_layer_2/sequential_1/dense_3/Tensordot/concatConcatV2Fmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/free:output:0Fmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/axes:output:0Mmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:Ж
>model/transformer_layer_2/sequential_1/dense_3/Tensordot/stackPackFmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/Prod:output:0Hmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:т
Bmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/transpose	Transpose!model/transformer_layer_2/add:z:0Hmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Ч
@model/transformer_layer_2/sequential_1/dense_3/Tensordot/ReshapeReshapeFmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/transpose:y:0Gmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Ш
?model/transformer_layer_2/sequential_1/dense_3/Tensordot/MatMulMatMulImodel/transformer_layer_2/sequential_1/dense_3/Tensordot/Reshape:output:0Omodel/transformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€АЛ
@model/transformer_layer_2/sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:АИ
Fmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : г
Amodel/transformer_layer_2/sequential_1/dense_3/Tensordot/concat_1ConcatV2Jmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2:output:0Imodel/transformer_layer_2/sequential_1/dense_3/Tensordot/Const_2:output:0Omodel/transformer_layer_2/sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:С
8model/transformer_layer_2/sequential_1/dense_3/TensordotReshapeImodel/transformer_layer_2/sequential_1/dense_3/Tensordot/MatMul:product:0Jmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€А—
Emodel/transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOpNmodel_transformer_layer_2_sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0К
6model/transformer_layer_2/sequential_1/dense_3/BiasAddBiasAddAmodel/transformer_layer_2/sequential_1/dense_3/Tensordot:output:0Mmodel/transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€А~
9model/transformer_layer_2/sequential_1/dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?ъ
7model/transformer_layer_2/sequential_1/dense_3/Gelu/mulMulBmodel/transformer_layer_2/sequential_1/dense_3/Gelu/mul/x:output:0?model/transformer_layer_2/sequential_1/dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€А
:model/transformer_layer_2/sequential_1/dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?Г
;model/transformer_layer_2/sequential_1/dense_3/Gelu/truedivRealDiv?model/transformer_layer_2/sequential_1/dense_3/BiasAdd:output:0Cmodel/transformer_layer_2/sequential_1/dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аґ
7model/transformer_layer_2/sequential_1/dense_3/Gelu/ErfErf?model/transformer_layer_2/sequential_1/dense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€А~
9model/transformer_layer_2/sequential_1/dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?ш
7model/transformer_layer_2/sequential_1/dense_3/Gelu/addAddV2Bmodel/transformer_layer_2/sequential_1/dense_3/Gelu/add/x:output:0;model/transformer_layer_2/sequential_1/dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€Ас
9model/transformer_layer_2/sequential_1/dense_3/Gelu/mul_1Mul;model/transformer_layer_2/sequential_1/dense_3/Gelu/mul:z:0;model/transformer_layer_2/sequential_1/dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аў
Gmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOpReadVariableOpPmodel_transformer_layer_2_sequential_1_dense_4_tensordot_readvariableop_resource*
_output_shapes
:	А@*
dtype0З
=model/transformer_layer_2/sequential_1/dense_4/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:О
=model/transformer_layer_2/sequential_1/dense_4/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Ђ
>model/transformer_layer_2/sequential_1/dense_4/Tensordot/ShapeShape=model/transformer_layer_2/sequential_1/dense_3/Gelu/mul_1:z:0*
T0*
_output_shapes
:И
Fmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : ч
Amodel/transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2GatherV2Gmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/Shape:output:0Fmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/free:output:0Omodel/transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:К
Hmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ы
Cmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2_1GatherV2Gmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/Shape:output:0Fmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/axes:output:0Qmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:И
>model/transformer_layer_2/sequential_1/dense_4/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: ы
=model/transformer_layer_2/sequential_1/dense_4/Tensordot/ProdProdJmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2:output:0Gmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: К
@model/transformer_layer_2/sequential_1/dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: Б
?model/transformer_layer_2/sequential_1/dense_4/Tensordot/Prod_1ProdLmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2_1:output:0Imodel/transformer_layer_2/sequential_1/dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: Ж
Dmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Ў
?model/transformer_layer_2/sequential_1/dense_4/Tensordot/concatConcatV2Fmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/free:output:0Fmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/axes:output:0Mmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:Ж
>model/transformer_layer_2/sequential_1/dense_4/Tensordot/stackPackFmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/Prod:output:0Hmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:П
Bmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/transpose	Transpose=model/transformer_layer_2/sequential_1/dense_3/Gelu/mul_1:z:0Hmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€АЧ
@model/transformer_layer_2/sequential_1/dense_4/Tensordot/ReshapeReshapeFmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/transpose:y:0Gmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Ч
?model/transformer_layer_2/sequential_1/dense_4/Tensordot/MatMulMatMulImodel/transformer_layer_2/sequential_1/dense_4/Tensordot/Reshape:output:0Omodel/transformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@К
@model/transformer_layer_2/sequential_1/dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@И
Fmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : г
Amodel/transformer_layer_2/sequential_1/dense_4/Tensordot/concat_1ConcatV2Jmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2:output:0Imodel/transformer_layer_2/sequential_1/dense_4/Tensordot/Const_2:output:0Omodel/transformer_layer_2/sequential_1/dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Р
8model/transformer_layer_2/sequential_1/dense_4/TensordotReshapeImodel/transformer_layer_2/sequential_1/dense_4/Tensordot/MatMul:product:0Jmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@–
Emodel/transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOpReadVariableOpNmodel_transformer_layer_2_sequential_1_dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Й
6model/transformer_layer_2/sequential_1/dense_4/BiasAddBiasAddAmodel/transformer_layer_2/sequential_1/dense_4/Tensordot:output:0Mmodel/transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@¬
model/transformer_layer_2/add_1AddV2!model/transformer_layer_2/add:z:0?model/transformer_layer_2/sequential_1/dense_4/BiasAdd:output:0*
T0*+
_output_shapes
:€€€€€€€€€@f
model/flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€   Ъ
model/flatten_1/ReshapeReshape#model/transformer_layer_2/add_1:z:0model/flatten_1/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€А
С
#model/dense_5/MatMul/ReadVariableOpReadVariableOp,model_dense_5_matmul_readvariableop_resource*
_output_shapes
:	А
@*
dtype0Я
model/dense_5/MatMulMatMul model/flatten_1/Reshape:output:0+model/dense_5/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@О
$model/dense_5/BiasAdd/ReadVariableOpReadVariableOp-model_dense_5_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0†
model/dense_5/BiasAddBiasAddmodel/dense_5/MatMul:product:0,model/dense_5/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@]
model/dense_5/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Т
model/dense_5/Gelu/mulMul!model/dense_5/Gelu/mul/x:output:0model/dense_5/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€@^
model/dense_5/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?Ы
model/dense_5/Gelu/truedivRealDivmodel/dense_5/BiasAdd:output:0"model/dense_5/Gelu/Cast/x:output:0*
T0*'
_output_shapes
:€€€€€€€€€@o
model/dense_5/Gelu/ErfErfmodel/dense_5/Gelu/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€@]
model/dense_5/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Р
model/dense_5/Gelu/addAddV2!model/dense_5/Gelu/add/x:output:0model/dense_5/Gelu/Erf:y:0*
T0*'
_output_shapes
:€€€€€€€€€@Й
model/dense_5/Gelu/mul_1Mulmodel/dense_5/Gelu/mul:z:0model/dense_5/Gelu/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€@Р
#model/dense_6/MatMul/ReadVariableOpReadVariableOp,model_dense_6_matmul_readvariableop_resource*
_output_shapes

:@
*
dtype0Ы
model/dense_6/MatMulMatMulmodel/dense_5/Gelu/mul_1:z:0+model/dense_6/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€
О
$model/dense_6/BiasAdd/ReadVariableOpReadVariableOp-model_dense_6_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype0†
model/dense_6/BiasAddBiasAddmodel/dense_6/MatMul:product:0,model/dense_6/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€
r
model/dense_6/SoftmaxSoftmaxmodel/dense_6/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€
n
IdentityIdentitymodel/dense_6/Softmax:softmax:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
∆
NoOpNoOp%^model/dense_5/BiasAdd/ReadVariableOp$^model/dense_5/MatMul/ReadVariableOp%^model/dense_6/BiasAdd/ReadVariableOp$^model/dense_6/MatMul/ReadVariableOpJ^model/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpI^model/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpK^model/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpJ^model/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpL^model/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpK^model/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpM^model/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpL^model/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpL^model/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpK^model/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpM^model/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpL^model/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpZ^model/encoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpY^model/encoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp:^model/frame_position_embedding/embedding/embedding_lookup6^model/time_distributed_1/dense/BiasAdd/ReadVariableOp5^model/time_distributed_1/dense/MatMul/ReadVariableOpS^model/transformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOp]^model/transformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpF^model/transformer_layer_1/multi_head_attention/key/add/ReadVariableOpP^model/transformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOpH^model/transformer_layer_1/multi_head_attention/query/add/ReadVariableOpR^model/transformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOpH^model/transformer_layer_1/multi_head_attention/value/add/ReadVariableOpR^model/transformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOpD^model/transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOpF^model/transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOpD^model/transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOpF^model/transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOpU^model/transformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOp_^model/transformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpH^model/transformer_layer_2/multi_head_attention_1/key/add/ReadVariableOpR^model/transformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOpJ^model/transformer_layer_2/multi_head_attention_1/query/add/ReadVariableOpT^model/transformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOpJ^model/transformer_layer_2/multi_head_attention_1/value/add/ReadVariableOpT^model/transformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOpF^model/transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOpH^model/transformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOpF^model/transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOpH^model/transformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*М
_input_shapes{
y:€€€€€€€€€(: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2L
$model/dense_5/BiasAdd/ReadVariableOp$model/dense_5/BiasAdd/ReadVariableOp2J
#model/dense_5/MatMul/ReadVariableOp#model/dense_5/MatMul/ReadVariableOp2L
$model/dense_6/BiasAdd/ReadVariableOp$model/dense_6/BiasAdd/ReadVariableOp2J
#model/dense_6/MatMul/ReadVariableOp#model/dense_6/MatMul/ReadVariableOp2Ц
Imodel/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpImodel/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOp2Ф
Hmodel/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpHmodel/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOp2Ш
Jmodel/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpJmodel/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOp2Ц
Imodel/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpImodel/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOp2Ъ
Kmodel/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpKmodel/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOp2Ш
Jmodel/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpJmodel/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOp2Ь
Lmodel/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpLmodel/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOp2Ъ
Kmodel/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpKmodel/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOp2Ъ
Kmodel/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpKmodel/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOp2Ш
Jmodel/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpJmodel/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOp2Ь
Lmodel/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpLmodel/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOp2Ъ
Kmodel/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpKmodel/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOp2ґ
Ymodel/encoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpYmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOp2і
Xmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpXmodel/encoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp2v
9model/frame_position_embedding/embedding/embedding_lookup9model/frame_position_embedding/embedding/embedding_lookup2n
5model/time_distributed_1/dense/BiasAdd/ReadVariableOp5model/time_distributed_1/dense/BiasAdd/ReadVariableOp2l
4model/time_distributed_1/dense/MatMul/ReadVariableOp4model/time_distributed_1/dense/MatMul/ReadVariableOp2®
Rmodel/transformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOpRmodel/transformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOp2Љ
\model/transformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp\model/transformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp2О
Emodel/transformer_layer_1/multi_head_attention/key/add/ReadVariableOpEmodel/transformer_layer_1/multi_head_attention/key/add/ReadVariableOp2Ґ
Omodel/transformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOpOmodel/transformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOp2Т
Gmodel/transformer_layer_1/multi_head_attention/query/add/ReadVariableOpGmodel/transformer_layer_1/multi_head_attention/query/add/ReadVariableOp2¶
Qmodel/transformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOpQmodel/transformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOp2Т
Gmodel/transformer_layer_1/multi_head_attention/value/add/ReadVariableOpGmodel/transformer_layer_1/multi_head_attention/value/add/ReadVariableOp2¶
Qmodel/transformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOpQmodel/transformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOp2К
Cmodel/transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOpCmodel/transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOp2О
Emodel/transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOpEmodel/transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOp2К
Cmodel/transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOpCmodel/transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOp2О
Emodel/transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOpEmodel/transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOp2ђ
Tmodel/transformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOpTmodel/transformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOp2ј
^model/transformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp^model/transformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp2Т
Gmodel/transformer_layer_2/multi_head_attention_1/key/add/ReadVariableOpGmodel/transformer_layer_2/multi_head_attention_1/key/add/ReadVariableOp2¶
Qmodel/transformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOpQmodel/transformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOp2Ц
Imodel/transformer_layer_2/multi_head_attention_1/query/add/ReadVariableOpImodel/transformer_layer_2/multi_head_attention_1/query/add/ReadVariableOp2™
Smodel/transformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOpSmodel/transformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOp2Ц
Imodel/transformer_layer_2/multi_head_attention_1/value/add/ReadVariableOpImodel/transformer_layer_2/multi_head_attention_1/value/add/ReadVariableOp2™
Smodel/transformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOpSmodel/transformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOp2О
Emodel/transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOpEmodel/transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOp2Т
Gmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOpGmodel/transformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOp2О
Emodel/transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOpEmodel/transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOp2Т
Gmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOpGmodel/transformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOp:\ X
3
_output_shapes!
:€€€€€€€€€(
!
_user_specified_name	input_1
ц
L
0__inference_time_distributed_layer_call_fn_26622

inputs
identity«
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *T
fORM
K__inference_time_distributed_layer_call_and_return_conditional_losses_23604n
IdentityIdentityPartitionedCall:output:0*
T0*5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'€€€€€€€€€€€€€€€€€€А:e a
=
_output_shapes+
):'€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
ДE
ф
@__inference_model_layer_call_and_return_conditional_losses_24523

inputs-
encoder3d_24168:
encoder3d_24170:-
encoder3d_24172: 
encoder3d_24174: -
encoder3d_24176:  
encoder3d_24178: -
encoder3d_24180: @
encoder3d_24182:@-
encoder3d_24184:@@
encoder3d_24186:@.
encoder3d_24188:@А
encoder3d_24190:	А/
encoder3d_24192:АА
encoder3d_24194:	А+
time_distributed_1_24200:	А@&
time_distributed_1_24202:@0
frame_position_embedding_24226:@/
transformer_layer_1_24326:@@+
transformer_layer_1_24328:@/
transformer_layer_1_24330:@@+
transformer_layer_1_24332:@/
transformer_layer_1_24334:@@+
transformer_layer_1_24336:@/
transformer_layer_1_24338:@@'
transformer_layer_1_24340:@,
transformer_layer_1_24342:	@А(
transformer_layer_1_24344:	А,
transformer_layer_1_24346:	А@'
transformer_layer_1_24348:@/
transformer_layer_2_24448:@@+
transformer_layer_2_24450:@/
transformer_layer_2_24452:@@+
transformer_layer_2_24454:@/
transformer_layer_2_24456:@@+
transformer_layer_2_24458:@/
transformer_layer_2_24460:@@'
transformer_layer_2_24462:@,
transformer_layer_2_24464:	@А(
transformer_layer_2_24466:	А,
transformer_layer_2_24468:	А@'
transformer_layer_2_24470:@ 
dense_5_24500:	А
@
dense_5_24502:@
dense_6_24517:@

dense_6_24519:

identityИҐdense_5/StatefulPartitionedCallҐdense_6/StatefulPartitionedCallҐ!encoder3d/StatefulPartitionedCallҐ0frame_position_embedding/StatefulPartitionedCallҐ*time_distributed_1/StatefulPartitionedCallҐ+transformer_layer_1/StatefulPartitionedCallҐ+transformer_layer_2/StatefulPartitionedCallе
!encoder3d/StatefulPartitionedCallStatefulPartitionedCallinputsencoder3d_24168encoder3d_24170encoder3d_24172encoder3d_24174encoder3d_24176encoder3d_24178encoder3d_24180encoder3d_24182encoder3d_24184encoder3d_24186encoder3d_24188encoder3d_24190encoder3d_24192encoder3d_24194*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :€€€€€€€€€А*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_encoder3d_layer_call_and_return_conditional_losses_24167у
 time_distributed/PartitionedCallPartitionedCall*encoder3d/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *T
fORM
K__inference_time_distributed_layer_call_and_return_conditional_losses_23577w
time_distributed/Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"€€€€      А   ≥
time_distributed/ReshapeReshape*encoder3d/StatefulPartitionedCall:output:0'time_distributed/Reshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€Ањ
*time_distributed_1/StatefulPartitionedCallStatefulPartitionedCall)time_distributed/PartitionedCall:output:0time_distributed_1_24200time_distributed_1_24202*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *V
fQRO
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_23650q
 time_distributed_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"€€€€   Ѓ
time_distributed_1/ReshapeReshape)time_distributed/PartitionedCall:output:0)time_distributed_1/Reshape/shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€Ањ
0frame_position_embedding/StatefulPartitionedCallStatefulPartitionedCall3time_distributed_1/StatefulPartitionedCall:output:0frame_position_embedding_24226*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *\
fWRU
S__inference_frame_position_embedding_layer_call_and_return_conditional_losses_24225х
+transformer_layer_1/StatefulPartitionedCallStatefulPartitionedCall9frame_position_embedding/StatefulPartitionedCall:output:0transformer_layer_1_24326transformer_layer_1_24328transformer_layer_1_24330transformer_layer_1_24332transformer_layer_1_24334transformer_layer_1_24336transformer_layer_1_24338transformer_layer_1_24340transformer_layer_1_24342transformer_layer_1_24344transformer_layer_1_24346transformer_layer_1_24348*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_24325р
+transformer_layer_2/StatefulPartitionedCallStatefulPartitionedCall4transformer_layer_1/StatefulPartitionedCall:output:0transformer_layer_2_24448transformer_layer_2_24450transformer_layer_2_24452transformer_layer_2_24454transformer_layer_2_24456transformer_layer_2_24458transformer_layer_2_24460transformer_layer_2_24462transformer_layer_2_24464transformer_layer_2_24466transformer_layer_2_24468transformer_layer_2_24470*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_24447л
flatten_1/PartitionedCallPartitionedCall4transformer_layer_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А
* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_flatten_1_layer_call_and_return_conditional_losses_24479И
dense_5/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_5_24500dense_5_24502*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_24499О
dense_6/StatefulPartitionedCallStatefulPartitionedCall(dense_5/StatefulPartitionedCall:output:0dense_6_24517dense_6_24519*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_6_layer_call_and_return_conditional_losses_24516w
IdentityIdentity(dense_6/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
к
NoOpNoOp ^dense_5/StatefulPartitionedCall ^dense_6/StatefulPartitionedCall"^encoder3d/StatefulPartitionedCall1^frame_position_embedding/StatefulPartitionedCall+^time_distributed_1/StatefulPartitionedCall,^transformer_layer_1/StatefulPartitionedCall,^transformer_layer_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*М
_input_shapes{
y:€€€€€€€€€(: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2B
dense_6/StatefulPartitionedCalldense_6/StatefulPartitionedCall2F
!encoder3d/StatefulPartitionedCall!encoder3d/StatefulPartitionedCall2d
0frame_position_embedding/StatefulPartitionedCall0frame_position_embedding/StatefulPartitionedCall2X
*time_distributed_1/StatefulPartitionedCall*time_distributed_1/StatefulPartitionedCall2Z
+transformer_layer_1/StatefulPartitionedCall+transformer_layer_1/StatefulPartitionedCall2Z
+transformer_layer_2/StatefulPartitionedCall+transformer_layer_2/StatefulPartitionedCall:[ W
3
_output_shapes!
:€€€€€€€€€(
 
_user_specified_nameinputs
е
G
+__inference_pooling3d_3_layer_call_fn_27338

inputs
identityд
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *O
fJRH
F__inference_pooling3d_3_layer_call_and_return_conditional_losses_23547Р
IdentityIdentityPartitionedCall:output:0*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€: {
W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
 
_user_specified_nameinputs
щЃ
У:
@__inference_model_layer_call_and_return_conditional_losses_26204

inputsy
[encoder3d_spatial_attention_spatial_attention_attention_conv_conv3d_readvariableop_resource:j
\encoder3d_spatial_attention_spatial_attention_attention_conv_biasadd_readvariableop_resource:i
Kencoder3d_conv2_plus1d_conv3d_1_spatial_conv_conv3d_readvariableop_resource: Z
Lencoder3d_conv2_plus1d_conv3d_1_spatial_conv_biasadd_readvariableop_resource: j
Lencoder3d_conv2_plus1d_conv3d_1_temporal_conv_conv3d_readvariableop_resource:  [
Mencoder3d_conv2_plus1d_conv3d_1_temporal_conv_biasadd_readvariableop_resource: k
Mencoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_conv3d_readvariableop_resource: @\
Nencoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_biasadd_readvariableop_resource:@l
Nencoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_conv3d_readvariableop_resource:@@]
Oencoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_biasadd_readvariableop_resource:@l
Mencoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_conv3d_readvariableop_resource:@А]
Nencoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_biasadd_readvariableop_resource:	Аn
Nencoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_conv3d_readvariableop_resource:АА^
Oencoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_biasadd_readvariableop_resource:	АJ
7time_distributed_1_dense_matmul_readvariableop_resource:	А@F
8time_distributed_1_dense_biasadd_readvariableop_resource:@K
9frame_position_embedding_embedding_embedding_lookup_25990:@j
Ttransformer_layer_1_multi_head_attention_query_einsum_einsum_readvariableop_resource:@@\
Jtransformer_layer_1_multi_head_attention_query_add_readvariableop_resource:@h
Rtransformer_layer_1_multi_head_attention_key_einsum_einsum_readvariableop_resource:@@Z
Htransformer_layer_1_multi_head_attention_key_add_readvariableop_resource:@j
Ttransformer_layer_1_multi_head_attention_value_einsum_einsum_readvariableop_resource:@@\
Jtransformer_layer_1_multi_head_attention_value_add_readvariableop_resource:@u
_transformer_layer_1_multi_head_attention_attention_output_einsum_einsum_readvariableop_resource:@@c
Utransformer_layer_1_multi_head_attention_attention_output_add_readvariableop_resource:@[
Htransformer_layer_1_sequential_dense_1_tensordot_readvariableop_resource:	@АU
Ftransformer_layer_1_sequential_dense_1_biasadd_readvariableop_resource:	А[
Htransformer_layer_1_sequential_dense_2_tensordot_readvariableop_resource:	А@T
Ftransformer_layer_1_sequential_dense_2_biasadd_readvariableop_resource:@l
Vtransformer_layer_2_multi_head_attention_1_query_einsum_einsum_readvariableop_resource:@@^
Ltransformer_layer_2_multi_head_attention_1_query_add_readvariableop_resource:@j
Ttransformer_layer_2_multi_head_attention_1_key_einsum_einsum_readvariableop_resource:@@\
Jtransformer_layer_2_multi_head_attention_1_key_add_readvariableop_resource:@l
Vtransformer_layer_2_multi_head_attention_1_value_einsum_einsum_readvariableop_resource:@@^
Ltransformer_layer_2_multi_head_attention_1_value_add_readvariableop_resource:@w
atransformer_layer_2_multi_head_attention_1_attention_output_einsum_einsum_readvariableop_resource:@@e
Wtransformer_layer_2_multi_head_attention_1_attention_output_add_readvariableop_resource:@]
Jtransformer_layer_2_sequential_1_dense_3_tensordot_readvariableop_resource:	@АW
Htransformer_layer_2_sequential_1_dense_3_biasadd_readvariableop_resource:	А]
Jtransformer_layer_2_sequential_1_dense_4_tensordot_readvariableop_resource:	А@V
Htransformer_layer_2_sequential_1_dense_4_biasadd_readvariableop_resource:@9
&dense_5_matmul_readvariableop_resource:	А
@5
'dense_5_biasadd_readvariableop_resource:@8
&dense_6_matmul_readvariableop_resource:@
5
'dense_6_biasadd_readvariableop_resource:

identityИҐdense_5/BiasAdd/ReadVariableOpҐdense_5/MatMul/ReadVariableOpҐdense_6/BiasAdd/ReadVariableOpҐdense_6/MatMul/ReadVariableOpҐCencoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpҐBencoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpҐDencoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpҐCencoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpҐEencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpҐDencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpҐFencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpҐEencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpҐEencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpҐDencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpҐFencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpҐEencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpҐSencoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpҐRencoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpҐ3frame_position_embedding/embedding/embedding_lookupҐ/time_distributed_1/dense/BiasAdd/ReadVariableOpҐ.time_distributed_1/dense/MatMul/ReadVariableOpҐLtransformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOpҐVtransformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpҐ?transformer_layer_1/multi_head_attention/key/add/ReadVariableOpҐItransformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOpҐAtransformer_layer_1/multi_head_attention/query/add/ReadVariableOpҐKtransformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOpҐAtransformer_layer_1/multi_head_attention/value/add/ReadVariableOpҐKtransformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOpҐ=transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOpҐ?transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOpҐ=transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOpҐ?transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOpҐNtransformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOpҐXtransformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpҐAtransformer_layer_2/multi_head_attention_1/key/add/ReadVariableOpҐKtransformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOpҐCtransformer_layer_2/multi_head_attention_1/query/add/ReadVariableOpҐMtransformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOpҐCtransformer_layer_2/multi_head_attention_1/value/add/ReadVariableOpҐMtransformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOpҐ?transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOpҐAtransformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOpҐ?transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOpҐAtransformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOpъ
Rencoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpReadVariableOp[encoder3d_spatial_attention_spatial_attention_attention_conv_conv3d_readvariableop_resource**
_output_shapes
:*
dtype0Ш
Cencoder3d/spatial_attention/spatial_attention_attention_conv/Conv3DConv3DinputsZencoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(*
paddingSAME*
strides	
м
Sencoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpReadVariableOp\encoder3d_spatial_attention_spatial_attention_attention_conv_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Є
Dencoder3d/spatial_attention/spatial_attention_attention_conv/BiasAddBiasAddLencoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D:output:0[encoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(М
Gencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Ђ
Eencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mulMulPencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul/x:output:0Mencoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(Н
Hencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?і
Iencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/truedivRealDivMencoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd:output:0Qencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/Cast/x:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(ў
Eencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/ErfErfMencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/truediv:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(М
Gencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?©
Eencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/addAddV2Pencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/add/x:output:0Iencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/Erf:y:0*
T0*3
_output_shapes!
:€€€€€€€€€(Ґ
Gencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul_1MulIencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul:z:0Iencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/add:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(‘
:encoder3d/spatial_attention/spatial_attention_multiply/mulMulinputsKencoder3d/spatial_attention/spatial_attention_attention_conv/Gelu/mul_1:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(Џ
Bencoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpReadVariableOpKencoder3d_conv2_plus1d_conv3d_1_spatial_conv_conv3d_readvariableop_resource**
_output_shapes
: *
dtype0∞
3encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3DConv3D>encoder3d/spatial_attention/spatial_attention_multiply/mul:z:0Jencoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
paddingSAME*
strides	
ћ
Cencoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpLencoder3d_conv2_plus1d_conv3d_1_spatial_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0И
4encoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAddBiasAdd<encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D:output:0Kencoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( ґ
1encoder3d/conv2_plus1d/conv3D_1_spatial_conv/ReluRelu=encoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€( №
Cencoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpReadVariableOpLencoder3d_conv2_plus1d_conv3d_1_temporal_conv_conv3d_readvariableop_resource**
_output_shapes
:  *
dtype0≥
4encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3DConv3D?encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Relu:activations:0Kencoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
paddingSAME*
strides	
ќ
Dencoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpMencoder3d_conv2_plus1d_conv3d_1_temporal_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0Л
5encoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAddBiasAdd=encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D:output:0Lencoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( Є
2encoder3d/conv2_plus1d/conv3D_1_temporal_conv/ReluRelu>encoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€( й
encoder3d/pooling3d_1/MaxPool3D	MaxPool3D@encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Relu:activations:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
ksize	
*
paddingSAME*
strides	
ё
Dencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpReadVariableOpMencoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_conv3d_readvariableop_resource**
_output_shapes
: @*
dtype0Ю
5encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3DConv3D(encoder3d/pooling3d_1/MaxPool3D:output:0Lencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
paddingSAME*
strides	
–
Eencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpNencoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0О
6encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAddBiasAdd>encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D:output:0Mencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@Ї
3encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/ReluRelu?encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(@а
Eencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpReadVariableOpNencoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_conv3d_readvariableop_resource**
_output_shapes
:@@*
dtype0є
6encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3DConv3DAencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Relu:activations:0Mencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
paddingSAME*
strides	
“
Fencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpOencoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0С
7encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAddBiasAdd?encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D:output:0Nencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@Љ
4encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/ReluRelu@encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(@л
encoder3d/pooling3d_2/MaxPool3D	MaxPool3DBencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Relu:activations:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
ksize	
*
paddingSAME*
strides	
я
Dencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpReadVariableOpMencoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_conv3d_readvariableop_resource*+
_output_shapes
:@А*
dtype0Я
5encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3DConv3D(encoder3d/pooling3d_2/MaxPool3D:output:0Lencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(А*
paddingSAME*
strides	
—
Eencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpNencoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0П
6encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAddBiasAdd>encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D:output:0Mencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(Аї
3encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/ReluRelu?encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd:output:0*
T0*4
_output_shapes"
 :€€€€€€€€€(Ав
Eencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpReadVariableOpNencoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_conv3d_readvariableop_resource*,
_output_shapes
:АА*
dtype0Ї
6encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3DConv3DAencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Relu:activations:0Mencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(А*
paddingSAME*
strides	
”
Fencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpOencoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Т
7encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAddBiasAdd?encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D:output:0Nencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(Аљ
4encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/ReluRelu@encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd:output:0*
T0*4
_output_shapes"
 :€€€€€€€€€(Ам
encoder3d/pooling3d_3/MaxPool3D	MaxPool3DBencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Relu:activations:0*
T0*4
_output_shapes"
 :€€€€€€€€€А*
ksize	
*
paddingSAME*
strides	
w
time_distributed/Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"€€€€      А   ±
time_distributed/ReshapeReshape(encoder3d/pooling3d_3/MaxPool3D:output:0'time_distributed/Reshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€Аo
time_distributed/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€   ™
 time_distributed/flatten/ReshapeReshape!time_distributed/Reshape:output:0'time_distributed/flatten/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€Аu
 time_distributed/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*!
valueB"€€€€      ≤
time_distributed/Reshape_1Reshape)time_distributed/flatten/Reshape:output:0)time_distributed/Reshape_1/shape:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аy
 time_distributed/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*%
valueB"€€€€      А   µ
time_distributed/Reshape_2Reshape(encoder3d/pooling3d_3/MaxPool3D:output:0)time_distributed/Reshape_2/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€Аq
 time_distributed_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"€€€€   ®
time_distributed_1/ReshapeReshape#time_distributed/Reshape_1:output:0)time_distributed_1/Reshape/shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€АІ
.time_distributed_1/dense/MatMul/ReadVariableOpReadVariableOp7time_distributed_1_dense_matmul_readvariableop_resource*
_output_shapes
:	А@*
dtype0Є
time_distributed_1/dense/MatMulMatMul#time_distributed_1/Reshape:output:06time_distributed_1/dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@§
/time_distributed_1/dense/BiasAdd/ReadVariableOpReadVariableOp8time_distributed_1_dense_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Ѕ
 time_distributed_1/dense/BiasAddBiasAdd)time_distributed_1/dense/MatMul:product:07time_distributed_1/dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@h
#time_distributed_1/dense/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?≥
!time_distributed_1/dense/Gelu/mulMul,time_distributed_1/dense/Gelu/mul/x:output:0)time_distributed_1/dense/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€@i
$time_distributed_1/dense/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?Љ
%time_distributed_1/dense/Gelu/truedivRealDiv)time_distributed_1/dense/BiasAdd:output:0-time_distributed_1/dense/Gelu/Cast/x:output:0*
T0*'
_output_shapes
:€€€€€€€€€@Е
!time_distributed_1/dense/Gelu/ErfErf)time_distributed_1/dense/Gelu/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€@h
#time_distributed_1/dense/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?±
!time_distributed_1/dense/Gelu/addAddV2,time_distributed_1/dense/Gelu/add/x:output:0%time_distributed_1/dense/Gelu/Erf:y:0*
T0*'
_output_shapes
:€€€€€€€€€@™
#time_distributed_1/dense/Gelu/mul_1Mul%time_distributed_1/dense/Gelu/mul:z:0%time_distributed_1/dense/Gelu/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€@w
"time_distributed_1/Reshape_1/shapeConst*
_output_shapes
:*
dtype0*!
valueB"€€€€   @   ≥
time_distributed_1/Reshape_1Reshape'time_distributed_1/dense/Gelu/mul_1:z:0+time_distributed_1/Reshape_1/shape:output:0*
T0*+
_output_shapes
:€€€€€€€€€@s
"time_distributed_1/Reshape_2/shapeConst*
_output_shapes
:*
dtype0*
valueB"€€€€   ђ
time_distributed_1/Reshape_2Reshape#time_distributed/Reshape_1:output:0+time_distributed_1/Reshape_2/shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€Аs
frame_position_embedding/ShapeShape%time_distributed_1/Reshape_1:output:0*
T0*
_output_shapes
:v
,frame_position_embedding/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:x
.frame_position_embedding/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:x
.frame_position_embedding/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:ќ
&frame_position_embedding/strided_sliceStridedSlice'frame_position_embedding/Shape:output:05frame_position_embedding/strided_slice/stack:output:07frame_position_embedding/strided_slice/stack_1:output:07frame_position_embedding/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
$frame_position_embedding/range/startConst*
_output_shapes
: *
dtype0*
value	B : f
$frame_position_embedding/range/deltaConst*
_output_shapes
: *
dtype0*
value	B :“
frame_position_embedding/rangeRange-frame_position_embedding/range/start:output:0/frame_position_embedding/strided_slice:output:0-frame_position_embedding/range/delta:output:0*
_output_shapes
:і
3frame_position_embedding/embedding/embedding_lookupResourceGather9frame_position_embedding_embedding_embedding_lookup_25990'frame_position_embedding/range:output:0*
Tindices0*L
_classB
@>loc:@frame_position_embedding/embedding/embedding_lookup/25990*
_output_shapes

:@*
dtype0э
<frame_position_embedding/embedding/embedding_lookup/IdentityIdentity<frame_position_embedding/embedding/embedding_lookup:output:0*
T0*L
_classB
@>loc:@frame_position_embedding/embedding/embedding_lookup/25990*
_output_shapes

:@Ї
>frame_position_embedding/embedding/embedding_lookup/Identity_1IdentityEframe_position_embedding/embedding/embedding_lookup/Identity:output:0*
T0*
_output_shapes

:@Ћ
frame_position_embedding/addAddV2%time_distributed_1/Reshape_1:output:0Gframe_position_embedding/embedding/embedding_lookup/Identity_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@д
Ktransformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOpTtransformer_layer_1_multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Э
<transformer_layer_1/multi_head_attention/query/einsum/EinsumEinsum frame_position_embedding/add:z:0Stransformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abdeћ
Atransformer_layer_1/multi_head_attention/query/add/ReadVariableOpReadVariableOpJtransformer_layer_1_multi_head_attention_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0З
2transformer_layer_1/multi_head_attention/query/addAddV2Etransformer_layer_1/multi_head_attention/query/einsum/Einsum:output:0Itransformer_layer_1/multi_head_attention/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@а
Itransformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOpRtransformer_layer_1_multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Щ
:transformer_layer_1/multi_head_attention/key/einsum/EinsumEinsum frame_position_embedding/add:z:0Qtransformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde»
?transformer_layer_1/multi_head_attention/key/add/ReadVariableOpReadVariableOpHtransformer_layer_1_multi_head_attention_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Б
0transformer_layer_1/multi_head_attention/key/addAddV2Ctransformer_layer_1/multi_head_attention/key/einsum/Einsum:output:0Gtransformer_layer_1/multi_head_attention/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@д
Ktransformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOpTtransformer_layer_1_multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Э
<transformer_layer_1/multi_head_attention/value/einsum/EinsumEinsum frame_position_embedding/add:z:0Stransformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abdeћ
Atransformer_layer_1/multi_head_attention/value/add/ReadVariableOpReadVariableOpJtransformer_layer_1_multi_head_attention_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0З
2transformer_layer_1/multi_head_attention/value/addAddV2Etransformer_layer_1/multi_head_attention/value/einsum/Einsum:output:0Itransformer_layer_1/multi_head_attention/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@s
.transformer_layer_1/multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >ё
,transformer_layer_1/multi_head_attention/MulMul6transformer_layer_1/multi_head_attention/query/add:z:07transformer_layer_1/multi_head_attention/Mul/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€@К
6transformer_layer_1/multi_head_attention/einsum/EinsumEinsum4transformer_layer_1/multi_head_attention/key/add:z:00transformer_layer_1/multi_head_attention/Mul:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€*
equationaecd,abcd->acbeЊ
8transformer_layer_1/multi_head_attention/softmax/SoftmaxSoftmax?transformer_layer_1/multi_head_attention/einsum/Einsum:output:0*
T0*/
_output_shapes
:€€€€€€€€€√
9transformer_layer_1/multi_head_attention/dropout/IdentityIdentityBtransformer_layer_1/multi_head_attention/softmax/Softmax:softmax:0*
T0*/
_output_shapes
:€€€€€€€€€†
8transformer_layer_1/multi_head_attention/einsum_1/EinsumEinsumBtransformer_layer_1/multi_head_attention/dropout/Identity:output:06transformer_layer_1/multi_head_attention/value/add:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationacbe,aecd->abcdъ
Vtransformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOp_transformer_layer_1_multi_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0–
Gtransformer_layer_1/multi_head_attention/attention_output/einsum/EinsumEinsumAtransformer_layer_1/multi_head_attention/einsum_1/Einsum:output:0^transformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:€€€€€€€€€@*
equationabcd,cde->abeё
Ltransformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpUtransformer_layer_1_multi_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0§
=transformer_layer_1/multi_head_attention/attention_output/addAddV2Ptransformer_layer_1/multi_head_attention/attention_output/einsum/Einsum:output:0Ttransformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@ї
transformer_layer_1/addAddV2 frame_position_embedding/add:z:0Atransformer_layer_1/multi_head_attention/attention_output/add:z:0*
T0*+
_output_shapes
:€€€€€€€€€@…
?transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOpReadVariableOpHtransformer_layer_1_sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@А*
dtype0
5transformer_layer_1/sequential/dense_1/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:Ж
5transformer_layer_1/sequential/dense_1/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Б
6transformer_layer_1/sequential/dense_1/Tensordot/ShapeShapetransformer_layer_1/add:z:0*
T0*
_output_shapes
:А
>transformer_layer_1/sequential/dense_1/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : „
9transformer_layer_1/sequential/dense_1/Tensordot/GatherV2GatherV2?transformer_layer_1/sequential/dense_1/Tensordot/Shape:output:0>transformer_layer_1/sequential/dense_1/Tensordot/free:output:0Gtransformer_layer_1/sequential/dense_1/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:В
@transformer_layer_1/sequential/dense_1/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : џ
;transformer_layer_1/sequential/dense_1/Tensordot/GatherV2_1GatherV2?transformer_layer_1/sequential/dense_1/Tensordot/Shape:output:0>transformer_layer_1/sequential/dense_1/Tensordot/axes:output:0Itransformer_layer_1/sequential/dense_1/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:А
6transformer_layer_1/sequential/dense_1/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: г
5transformer_layer_1/sequential/dense_1/Tensordot/ProdProdBtransformer_layer_1/sequential/dense_1/Tensordot/GatherV2:output:0?transformer_layer_1/sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: В
8transformer_layer_1/sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: й
7transformer_layer_1/sequential/dense_1/Tensordot/Prod_1ProdDtransformer_layer_1/sequential/dense_1/Tensordot/GatherV2_1:output:0Atransformer_layer_1/sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ~
<transformer_layer_1/sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Є
7transformer_layer_1/sequential/dense_1/Tensordot/concatConcatV2>transformer_layer_1/sequential/dense_1/Tensordot/free:output:0>transformer_layer_1/sequential/dense_1/Tensordot/axes:output:0Etransformer_layer_1/sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:о
6transformer_layer_1/sequential/dense_1/Tensordot/stackPack>transformer_layer_1/sequential/dense_1/Tensordot/Prod:output:0@transformer_layer_1/sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:№
:transformer_layer_1/sequential/dense_1/Tensordot/transpose	Transposetransformer_layer_1/add:z:0@transformer_layer_1/sequential/dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@€
8transformer_layer_1/sequential/dense_1/Tensordot/ReshapeReshape>transformer_layer_1/sequential/dense_1/Tensordot/transpose:y:0?transformer_layer_1/sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€А
7transformer_layer_1/sequential/dense_1/Tensordot/MatMulMatMulAtransformer_layer_1/sequential/dense_1/Tensordot/Reshape:output:0Gtransformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€АГ
8transformer_layer_1/sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:АА
>transformer_layer_1/sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : √
9transformer_layer_1/sequential/dense_1/Tensordot/concat_1ConcatV2Btransformer_layer_1/sequential/dense_1/Tensordot/GatherV2:output:0Atransformer_layer_1/sequential/dense_1/Tensordot/Const_2:output:0Gtransformer_layer_1/sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:щ
0transformer_layer_1/sequential/dense_1/TensordotReshapeAtransformer_layer_1/sequential/dense_1/Tensordot/MatMul:product:0Btransformer_layer_1/sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АЅ
=transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOpFtransformer_layer_1_sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0т
.transformer_layer_1/sequential/dense_1/BiasAddBiasAdd9transformer_layer_1/sequential/dense_1/Tensordot:output:0Etransformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€Аv
1transformer_layer_1/sequential/dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?в
/transformer_layer_1/sequential/dense_1/Gelu/mulMul:transformer_layer_1/sequential/dense_1/Gelu/mul/x:output:07transformer_layer_1/sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аw
2transformer_layer_1/sequential/dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?л
3transformer_layer_1/sequential/dense_1/Gelu/truedivRealDiv7transformer_layer_1/sequential/dense_1/BiasAdd:output:0;transformer_layer_1/sequential/dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€А¶
/transformer_layer_1/sequential/dense_1/Gelu/ErfErf7transformer_layer_1/sequential/dense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аv
1transformer_layer_1/sequential/dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?а
/transformer_layer_1/sequential/dense_1/Gelu/addAddV2:transformer_layer_1/sequential/dense_1/Gelu/add/x:output:03transformer_layer_1/sequential/dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€Аў
1transformer_layer_1/sequential/dense_1/Gelu/mul_1Mul3transformer_layer_1/sequential/dense_1/Gelu/mul:z:03transformer_layer_1/sequential/dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€А…
?transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOpReadVariableOpHtransformer_layer_1_sequential_dense_2_tensordot_readvariableop_resource*
_output_shapes
:	А@*
dtype0
5transformer_layer_1/sequential/dense_2/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:Ж
5transformer_layer_1/sequential/dense_2/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Ы
6transformer_layer_1/sequential/dense_2/Tensordot/ShapeShape5transformer_layer_1/sequential/dense_1/Gelu/mul_1:z:0*
T0*
_output_shapes
:А
>transformer_layer_1/sequential/dense_2/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : „
9transformer_layer_1/sequential/dense_2/Tensordot/GatherV2GatherV2?transformer_layer_1/sequential/dense_2/Tensordot/Shape:output:0>transformer_layer_1/sequential/dense_2/Tensordot/free:output:0Gtransformer_layer_1/sequential/dense_2/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:В
@transformer_layer_1/sequential/dense_2/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : џ
;transformer_layer_1/sequential/dense_2/Tensordot/GatherV2_1GatherV2?transformer_layer_1/sequential/dense_2/Tensordot/Shape:output:0>transformer_layer_1/sequential/dense_2/Tensordot/axes:output:0Itransformer_layer_1/sequential/dense_2/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:А
6transformer_layer_1/sequential/dense_2/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: г
5transformer_layer_1/sequential/dense_2/Tensordot/ProdProdBtransformer_layer_1/sequential/dense_2/Tensordot/GatherV2:output:0?transformer_layer_1/sequential/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: В
8transformer_layer_1/sequential/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: й
7transformer_layer_1/sequential/dense_2/Tensordot/Prod_1ProdDtransformer_layer_1/sequential/dense_2/Tensordot/GatherV2_1:output:0Atransformer_layer_1/sequential/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: ~
<transformer_layer_1/sequential/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Є
7transformer_layer_1/sequential/dense_2/Tensordot/concatConcatV2>transformer_layer_1/sequential/dense_2/Tensordot/free:output:0>transformer_layer_1/sequential/dense_2/Tensordot/axes:output:0Etransformer_layer_1/sequential/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:о
6transformer_layer_1/sequential/dense_2/Tensordot/stackPack>transformer_layer_1/sequential/dense_2/Tensordot/Prod:output:0@transformer_layer_1/sequential/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:ч
:transformer_layer_1/sequential/dense_2/Tensordot/transpose	Transpose5transformer_layer_1/sequential/dense_1/Gelu/mul_1:z:0@transformer_layer_1/sequential/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€А€
8transformer_layer_1/sequential/dense_2/Tensordot/ReshapeReshape>transformer_layer_1/sequential/dense_2/Tensordot/transpose:y:0?transformer_layer_1/sequential/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€€
7transformer_layer_1/sequential/dense_2/Tensordot/MatMulMatMulAtransformer_layer_1/sequential/dense_2/Tensordot/Reshape:output:0Gtransformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@В
8transformer_layer_1/sequential/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@А
>transformer_layer_1/sequential/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : √
9transformer_layer_1/sequential/dense_2/Tensordot/concat_1ConcatV2Btransformer_layer_1/sequential/dense_2/Tensordot/GatherV2:output:0Atransformer_layer_1/sequential/dense_2/Tensordot/Const_2:output:0Gtransformer_layer_1/sequential/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:ш
0transformer_layer_1/sequential/dense_2/TensordotReshapeAtransformer_layer_1/sequential/dense_2/Tensordot/MatMul:product:0Btransformer_layer_1/sequential/dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@ј
=transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOpReadVariableOpFtransformer_layer_1_sequential_dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0с
.transformer_layer_1/sequential/dense_2/BiasAddBiasAdd9transformer_layer_1/sequential/dense_2/Tensordot:output:0Etransformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@Ѓ
transformer_layer_1/add_1AddV2transformer_layer_1/add:z:07transformer_layer_1/sequential/dense_2/BiasAdd:output:0*
T0*+
_output_shapes
:€€€€€€€€€@и
Mtransformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOpReadVariableOpVtransformer_layer_2_multi_head_attention_1_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ю
>transformer_layer_2/multi_head_attention_1/query/einsum/EinsumEinsumtransformer_layer_1/add_1:z:0Utransformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde–
Ctransformer_layer_2/multi_head_attention_1/query/add/ReadVariableOpReadVariableOpLtransformer_layer_2_multi_head_attention_1_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0Н
4transformer_layer_2/multi_head_attention_1/query/addAddV2Gtransformer_layer_2/multi_head_attention_1/query/einsum/Einsum:output:0Ktransformer_layer_2/multi_head_attention_1/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@д
Ktransformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOpReadVariableOpTtransformer_layer_2_multi_head_attention_1_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ъ
<transformer_layer_2/multi_head_attention_1/key/einsum/EinsumEinsumtransformer_layer_1/add_1:z:0Stransformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abdeћ
Atransformer_layer_2/multi_head_attention_1/key/add/ReadVariableOpReadVariableOpJtransformer_layer_2_multi_head_attention_1_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0З
2transformer_layer_2/multi_head_attention_1/key/addAddV2Etransformer_layer_2/multi_head_attention_1/key/einsum/Einsum:output:0Itransformer_layer_2/multi_head_attention_1/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@и
Mtransformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOpReadVariableOpVtransformer_layer_2_multi_head_attention_1_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ю
>transformer_layer_2/multi_head_attention_1/value/einsum/EinsumEinsumtransformer_layer_1/add_1:z:0Utransformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde–
Ctransformer_layer_2/multi_head_attention_1/value/add/ReadVariableOpReadVariableOpLtransformer_layer_2_multi_head_attention_1_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0Н
4transformer_layer_2/multi_head_attention_1/value/addAddV2Gtransformer_layer_2/multi_head_attention_1/value/einsum/Einsum:output:0Ktransformer_layer_2/multi_head_attention_1/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@u
0transformer_layer_2/multi_head_attention_1/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >д
.transformer_layer_2/multi_head_attention_1/MulMul8transformer_layer_2/multi_head_attention_1/query/add:z:09transformer_layer_2/multi_head_attention_1/Mul/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€@Р
8transformer_layer_2/multi_head_attention_1/einsum/EinsumEinsum6transformer_layer_2/multi_head_attention_1/key/add:z:02transformer_layer_2/multi_head_attention_1/Mul:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€*
equationaecd,abcd->acbe¬
:transformer_layer_2/multi_head_attention_1/softmax/SoftmaxSoftmaxAtransformer_layer_2/multi_head_attention_1/einsum/Einsum:output:0*
T0*/
_output_shapes
:€€€€€€€€€«
;transformer_layer_2/multi_head_attention_1/dropout/IdentityIdentityDtransformer_layer_2/multi_head_attention_1/softmax/Softmax:softmax:0*
T0*/
_output_shapes
:€€€€€€€€€¶
:transformer_layer_2/multi_head_attention_1/einsum_1/EinsumEinsumDtransformer_layer_2/multi_head_attention_1/dropout/Identity:output:08transformer_layer_2/multi_head_attention_1/value/add:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationacbe,aecd->abcdю
Xtransformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpatransformer_layer_2_multi_head_attention_1_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0÷
Itransformer_layer_2/multi_head_attention_1/attention_output/einsum/EinsumEinsumCtransformer_layer_2/multi_head_attention_1/einsum_1/Einsum:output:0`transformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:€€€€€€€€€@*
equationabcd,cde->abeв
Ntransformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOpReadVariableOpWtransformer_layer_2_multi_head_attention_1_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0™
?transformer_layer_2/multi_head_attention_1/attention_output/addAddV2Rtransformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum:output:0Vtransformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@Ї
transformer_layer_2/addAddV2transformer_layer_1/add_1:z:0Ctransformer_layer_2/multi_head_attention_1/attention_output/add:z:0*
T0*+
_output_shapes
:€€€€€€€€€@Ќ
Atransformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOpJtransformer_layer_2_sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@А*
dtype0Б
7transformer_layer_2/sequential_1/dense_3/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:И
7transformer_layer_2/sequential_1/dense_3/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Г
8transformer_layer_2/sequential_1/dense_3/Tensordot/ShapeShapetransformer_layer_2/add:z:0*
T0*
_output_shapes
:В
@transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : я
;transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2GatherV2Atransformer_layer_2/sequential_1/dense_3/Tensordot/Shape:output:0@transformer_layer_2/sequential_1/dense_3/Tensordot/free:output:0Itransformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Д
Btransformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : г
=transformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2_1GatherV2Atransformer_layer_2/sequential_1/dense_3/Tensordot/Shape:output:0@transformer_layer_2/sequential_1/dense_3/Tensordot/axes:output:0Ktransformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:В
8transformer_layer_2/sequential_1/dense_3/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: й
7transformer_layer_2/sequential_1/dense_3/Tensordot/ProdProdDtransformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2:output:0Atransformer_layer_2/sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: Д
:transformer_layer_2/sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: п
9transformer_layer_2/sequential_1/dense_3/Tensordot/Prod_1ProdFtransformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2_1:output:0Ctransformer_layer_2/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: А
>transformer_layer_2/sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ј
9transformer_layer_2/sequential_1/dense_3/Tensordot/concatConcatV2@transformer_layer_2/sequential_1/dense_3/Tensordot/free:output:0@transformer_layer_2/sequential_1/dense_3/Tensordot/axes:output:0Gtransformer_layer_2/sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:ф
8transformer_layer_2/sequential_1/dense_3/Tensordot/stackPack@transformer_layer_2/sequential_1/dense_3/Tensordot/Prod:output:0Btransformer_layer_2/sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:а
<transformer_layer_2/sequential_1/dense_3/Tensordot/transpose	Transposetransformer_layer_2/add:z:0Btransformer_layer_2/sequential_1/dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Е
:transformer_layer_2/sequential_1/dense_3/Tensordot/ReshapeReshape@transformer_layer_2/sequential_1/dense_3/Tensordot/transpose:y:0Atransformer_layer_2/sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Ж
9transformer_layer_2/sequential_1/dense_3/Tensordot/MatMulMatMulCtransformer_layer_2/sequential_1/dense_3/Tensordot/Reshape:output:0Itransformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€АЕ
:transformer_layer_2/sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:АВ
@transformer_layer_2/sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ћ
;transformer_layer_2/sequential_1/dense_3/Tensordot/concat_1ConcatV2Dtransformer_layer_2/sequential_1/dense_3/Tensordot/GatherV2:output:0Ctransformer_layer_2/sequential_1/dense_3/Tensordot/Const_2:output:0Itransformer_layer_2/sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:€
2transformer_layer_2/sequential_1/dense_3/TensordotReshapeCtransformer_layer_2/sequential_1/dense_3/Tensordot/MatMul:product:0Dtransformer_layer_2/sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€А≈
?transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOpHtransformer_layer_2_sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0ш
0transformer_layer_2/sequential_1/dense_3/BiasAddBiasAdd;transformer_layer_2/sequential_1/dense_3/Tensordot:output:0Gtransformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€Аx
3transformer_layer_2/sequential_1/dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?и
1transformer_layer_2/sequential_1/dense_3/Gelu/mulMul<transformer_layer_2/sequential_1/dense_3/Gelu/mul/x:output:09transformer_layer_2/sequential_1/dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аy
4transformer_layer_2/sequential_1/dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?с
5transformer_layer_2/sequential_1/dense_3/Gelu/truedivRealDiv9transformer_layer_2/sequential_1/dense_3/BiasAdd:output:0=transformer_layer_2/sequential_1/dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€А™
1transformer_layer_2/sequential_1/dense_3/Gelu/ErfErf9transformer_layer_2/sequential_1/dense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аx
3transformer_layer_2/sequential_1/dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?ж
1transformer_layer_2/sequential_1/dense_3/Gelu/addAddV2<transformer_layer_2/sequential_1/dense_3/Gelu/add/x:output:05transformer_layer_2/sequential_1/dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€Ая
3transformer_layer_2/sequential_1/dense_3/Gelu/mul_1Mul5transformer_layer_2/sequential_1/dense_3/Gelu/mul:z:05transformer_layer_2/sequential_1/dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€АЌ
Atransformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOpReadVariableOpJtransformer_layer_2_sequential_1_dense_4_tensordot_readvariableop_resource*
_output_shapes
:	А@*
dtype0Б
7transformer_layer_2/sequential_1/dense_4/Tensordot/axesConst*
_output_shapes
:*
dtype0*
valueB:И
7transformer_layer_2/sequential_1/dense_4/Tensordot/freeConst*
_output_shapes
:*
dtype0*
valueB"       Я
8transformer_layer_2/sequential_1/dense_4/Tensordot/ShapeShape7transformer_layer_2/sequential_1/dense_3/Gelu/mul_1:z:0*
T0*
_output_shapes
:В
@transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2/axisConst*
_output_shapes
: *
dtype0*
value	B : я
;transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2GatherV2Atransformer_layer_2/sequential_1/dense_4/Tensordot/Shape:output:0@transformer_layer_2/sequential_1/dense_4/Tensordot/free:output:0Itransformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:Д
Btransformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2_1/axisConst*
_output_shapes
: *
dtype0*
value	B : г
=transformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2_1GatherV2Atransformer_layer_2/sequential_1/dense_4/Tensordot/Shape:output:0@transformer_layer_2/sequential_1/dense_4/Tensordot/axes:output:0Ktransformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2_1/axis:output:0*
Taxis0*
Tindices0*
Tparams0*
_output_shapes
:В
8transformer_layer_2/sequential_1/dense_4/Tensordot/ConstConst*
_output_shapes
:*
dtype0*
valueB: й
7transformer_layer_2/sequential_1/dense_4/Tensordot/ProdProdDtransformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2:output:0Atransformer_layer_2/sequential_1/dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: Д
:transformer_layer_2/sequential_1/dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: п
9transformer_layer_2/sequential_1/dense_4/Tensordot/Prod_1ProdFtransformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2_1:output:0Ctransformer_layer_2/sequential_1/dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: А
>transformer_layer_2/sequential_1/dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : ј
9transformer_layer_2/sequential_1/dense_4/Tensordot/concatConcatV2@transformer_layer_2/sequential_1/dense_4/Tensordot/free:output:0@transformer_layer_2/sequential_1/dense_4/Tensordot/axes:output:0Gtransformer_layer_2/sequential_1/dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:ф
8transformer_layer_2/sequential_1/dense_4/Tensordot/stackPack@transformer_layer_2/sequential_1/dense_4/Tensordot/Prod:output:0Btransformer_layer_2/sequential_1/dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:э
<transformer_layer_2/sequential_1/dense_4/Tensordot/transpose	Transpose7transformer_layer_2/sequential_1/dense_3/Gelu/mul_1:z:0Btransformer_layer_2/sequential_1/dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€АЕ
:transformer_layer_2/sequential_1/dense_4/Tensordot/ReshapeReshape@transformer_layer_2/sequential_1/dense_4/Tensordot/transpose:y:0Atransformer_layer_2/sequential_1/dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Е
9transformer_layer_2/sequential_1/dense_4/Tensordot/MatMulMatMulCtransformer_layer_2/sequential_1/dense_4/Tensordot/Reshape:output:0Itransformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@Д
:transformer_layer_2/sequential_1/dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@В
@transformer_layer_2/sequential_1/dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : Ћ
;transformer_layer_2/sequential_1/dense_4/Tensordot/concat_1ConcatV2Dtransformer_layer_2/sequential_1/dense_4/Tensordot/GatherV2:output:0Ctransformer_layer_2/sequential_1/dense_4/Tensordot/Const_2:output:0Itransformer_layer_2/sequential_1/dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:ю
2transformer_layer_2/sequential_1/dense_4/TensordotReshapeCtransformer_layer_2/sequential_1/dense_4/Tensordot/MatMul:product:0Dtransformer_layer_2/sequential_1/dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@ƒ
?transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOpReadVariableOpHtransformer_layer_2_sequential_1_dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0ч
0transformer_layer_2/sequential_1/dense_4/BiasAddBiasAdd;transformer_layer_2/sequential_1/dense_4/Tensordot:output:0Gtransformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@∞
transformer_layer_2/add_1AddV2transformer_layer_2/add:z:09transformer_layer_2/sequential_1/dense_4/BiasAdd:output:0*
T0*+
_output_shapes
:€€€€€€€€€@`
flatten_1/ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€   И
flatten_1/ReshapeReshapetransformer_layer_2/add_1:z:0flatten_1/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€А
Е
dense_5/MatMul/ReadVariableOpReadVariableOp&dense_5_matmul_readvariableop_resource*
_output_shapes
:	А
@*
dtype0Н
dense_5/MatMulMatMulflatten_1/Reshape:output:0%dense_5/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@В
dense_5/BiasAdd/ReadVariableOpReadVariableOp'dense_5_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0О
dense_5/BiasAddBiasAdddense_5/MatMul:product:0&dense_5/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@W
dense_5/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?А
dense_5/Gelu/mulMuldense_5/Gelu/mul/x:output:0dense_5/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€@X
dense_5/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?Й
dense_5/Gelu/truedivRealDivdense_5/BiasAdd:output:0dense_5/Gelu/Cast/x:output:0*
T0*'
_output_shapes
:€€€€€€€€€@c
dense_5/Gelu/ErfErfdense_5/Gelu/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€@W
dense_5/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?~
dense_5/Gelu/addAddV2dense_5/Gelu/add/x:output:0dense_5/Gelu/Erf:y:0*
T0*'
_output_shapes
:€€€€€€€€€@w
dense_5/Gelu/mul_1Muldense_5/Gelu/mul:z:0dense_5/Gelu/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€@Д
dense_6/MatMul/ReadVariableOpReadVariableOp&dense_6_matmul_readvariableop_resource*
_output_shapes

:@
*
dtype0Й
dense_6/MatMulMatMuldense_5/Gelu/mul_1:z:0%dense_6/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€
В
dense_6/BiasAdd/ReadVariableOpReadVariableOp'dense_6_biasadd_readvariableop_resource*
_output_shapes
:
*
dtype0О
dense_6/BiasAddBiasAdddense_6/MatMul:product:0&dense_6/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€
f
dense_6/SoftmaxSoftmaxdense_6/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€
h
IdentityIdentitydense_6/Softmax:softmax:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
Є
NoOpNoOp^dense_5/BiasAdd/ReadVariableOp^dense_5/MatMul/ReadVariableOp^dense_6/BiasAdd/ReadVariableOp^dense_6/MatMul/ReadVariableOpD^encoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpC^encoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpE^encoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpD^encoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpF^encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpE^encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpG^encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpF^encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpF^encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpE^encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpG^encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpF^encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpT^encoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpS^encoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp4^frame_position_embedding/embedding/embedding_lookup0^time_distributed_1/dense/BiasAdd/ReadVariableOp/^time_distributed_1/dense/MatMul/ReadVariableOpM^transformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOpW^transformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp@^transformer_layer_1/multi_head_attention/key/add/ReadVariableOpJ^transformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOpB^transformer_layer_1/multi_head_attention/query/add/ReadVariableOpL^transformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOpB^transformer_layer_1/multi_head_attention/value/add/ReadVariableOpL^transformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOp>^transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOp@^transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOp>^transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOp@^transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOpO^transformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOpY^transformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpB^transformer_layer_2/multi_head_attention_1/key/add/ReadVariableOpL^transformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOpD^transformer_layer_2/multi_head_attention_1/query/add/ReadVariableOpN^transformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOpD^transformer_layer_2/multi_head_attention_1/value/add/ReadVariableOpN^transformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOp@^transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOpB^transformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOp@^transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOpB^transformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*М
_input_shapes{
y:€€€€€€€€€(: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2@
dense_5/BiasAdd/ReadVariableOpdense_5/BiasAdd/ReadVariableOp2>
dense_5/MatMul/ReadVariableOpdense_5/MatMul/ReadVariableOp2@
dense_6/BiasAdd/ReadVariableOpdense_6/BiasAdd/ReadVariableOp2>
dense_6/MatMul/ReadVariableOpdense_6/MatMul/ReadVariableOp2К
Cencoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpCencoder3d/conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOp2И
Bencoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpBencoder3d/conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOp2М
Dencoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpDencoder3d/conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOp2К
Cencoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpCencoder3d/conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOp2О
Eencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpEencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOp2М
Dencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpDencoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOp2Р
Fencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpFencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOp2О
Eencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpEencoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOp2О
Eencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpEencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOp2М
Dencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpDencoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOp2Р
Fencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpFencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOp2О
Eencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpEencoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOp2™
Sencoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpSencoder3d/spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOp2®
Rencoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpRencoder3d/spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp2j
3frame_position_embedding/embedding/embedding_lookup3frame_position_embedding/embedding/embedding_lookup2b
/time_distributed_1/dense/BiasAdd/ReadVariableOp/time_distributed_1/dense/BiasAdd/ReadVariableOp2`
.time_distributed_1/dense/MatMul/ReadVariableOp.time_distributed_1/dense/MatMul/ReadVariableOp2Ь
Ltransformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOpLtransformer_layer_1/multi_head_attention/attention_output/add/ReadVariableOp2∞
Vtransformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOpVtransformer_layer_1/multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp2В
?transformer_layer_1/multi_head_attention/key/add/ReadVariableOp?transformer_layer_1/multi_head_attention/key/add/ReadVariableOp2Ц
Itransformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOpItransformer_layer_1/multi_head_attention/key/einsum/Einsum/ReadVariableOp2Ж
Atransformer_layer_1/multi_head_attention/query/add/ReadVariableOpAtransformer_layer_1/multi_head_attention/query/add/ReadVariableOp2Ъ
Ktransformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOpKtransformer_layer_1/multi_head_attention/query/einsum/Einsum/ReadVariableOp2Ж
Atransformer_layer_1/multi_head_attention/value/add/ReadVariableOpAtransformer_layer_1/multi_head_attention/value/add/ReadVariableOp2Ъ
Ktransformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOpKtransformer_layer_1/multi_head_attention/value/einsum/Einsum/ReadVariableOp2~
=transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOp=transformer_layer_1/sequential/dense_1/BiasAdd/ReadVariableOp2В
?transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOp?transformer_layer_1/sequential/dense_1/Tensordot/ReadVariableOp2~
=transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOp=transformer_layer_1/sequential/dense_2/BiasAdd/ReadVariableOp2В
?transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOp?transformer_layer_1/sequential/dense_2/Tensordot/ReadVariableOp2†
Ntransformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOpNtransformer_layer_2/multi_head_attention_1/attention_output/add/ReadVariableOp2і
Xtransformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpXtransformer_layer_2/multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp2Ж
Atransformer_layer_2/multi_head_attention_1/key/add/ReadVariableOpAtransformer_layer_2/multi_head_attention_1/key/add/ReadVariableOp2Ъ
Ktransformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOpKtransformer_layer_2/multi_head_attention_1/key/einsum/Einsum/ReadVariableOp2К
Ctransformer_layer_2/multi_head_attention_1/query/add/ReadVariableOpCtransformer_layer_2/multi_head_attention_1/query/add/ReadVariableOp2Ю
Mtransformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOpMtransformer_layer_2/multi_head_attention_1/query/einsum/Einsum/ReadVariableOp2К
Ctransformer_layer_2/multi_head_attention_1/value/add/ReadVariableOpCtransformer_layer_2/multi_head_attention_1/value/add/ReadVariableOp2Ю
Mtransformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOpMtransformer_layer_2/multi_head_attention_1/value/einsum/Einsum/ReadVariableOp2В
?transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOp?transformer_layer_2/sequential_1/dense_3/BiasAdd/ReadVariableOp2Ж
Atransformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOpAtransformer_layer_2/sequential_1/dense_3/Tensordot/ReadVariableOp2В
?transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOp?transformer_layer_2/sequential_1/dense_4/BiasAdd/ReadVariableOp2Ж
Atransformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOpAtransformer_layer_2/sequential_1/dense_4/Tensordot/ReadVariableOp:[ W
3
_output_shapes!
:€€€€€€€€€(
 
_user_specified_nameinputs
О
†
2__inference_time_distributed_1_layer_call_fn_26665

inputs
unknown:	А@
	unknown_0:@
identityИҐStatefulPartitionedCallт
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :€€€€€€€€€€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *V
fQRO
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_23650|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :€€€€€€€€€€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:€€€€€€€€€€€€€€€€€€А: : 22
StatefulPartitionedCallStatefulPartitionedCall:] Y
5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
Ѓ
ќ
3__inference_transformer_layer_1_layer_call_fn_26786

inputs
unknown:@@
	unknown_0:@
	unknown_1:@@
	unknown_2:@
	unknown_3:@@
	unknown_4:@
	unknown_5:@@
	unknown_6:@
	unknown_7:	@А
	unknown_8:	А
	unknown_9:	А@

unknown_10:@
identityИҐStatefulPartitionedCallн
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_24325s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:€€€€€€€€€@: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
БE
ў
G__inference_sequential_1_layer_call_and_return_conditional_losses_27689

inputs<
)dense_3_tensordot_readvariableop_resource:	@А6
'dense_3_biasadd_readvariableop_resource:	А<
)dense_4_tensordot_readvariableop_resource:	А@5
'dense_4_biasadd_readvariableop_resource:@
identityИҐdense_3/BiasAdd/ReadVariableOpҐ dense_3/Tensordot/ReadVariableOpҐdense_4/BiasAdd/ReadVariableOpҐ dense_4/Tensordot/ReadVariableOpЛ
 dense_3/Tensordot/ReadVariableOpReadVariableOp)dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : џ
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
value	B : я
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
valueB: Ж
dense_3/Tensordot/ProdProd#dense_3/Tensordot/GatherV2:output:0 dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: М
dense_3/Tensordot/Prod_1Prod%dense_3/Tensordot/GatherV2_1:output:0"dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Љ
dense_3/Tensordot/concatConcatV2dense_3/Tensordot/free:output:0dense_3/Tensordot/axes:output:0&dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:С
dense_3/Tensordot/stackPackdense_3/Tensordot/Prod:output:0!dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Й
dense_3/Tensordot/transpose	Transposeinputs!dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Ґ
dense_3/Tensordot/ReshapeReshapedense_3/Tensordot/transpose:y:0 dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€£
dense_3/Tensordot/MatMulMatMul"dense_3/Tensordot/Reshape:output:0(dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€Аd
dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Аa
dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : «
dense_3/Tensordot/concat_1ConcatV2#dense_3/Tensordot/GatherV2:output:0"dense_3/Tensordot/Const_2:output:0(dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ь
dense_3/TensordotReshape"dense_3/Tensordot/MatMul:product:0#dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АГ
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Х
dense_3/BiasAddBiasAdddense_3/Tensordot:output:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€АW
dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Е
dense_3/Gelu/mulMuldense_3/Gelu/mul/x:output:0dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€АX
dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?О
dense_3/Gelu/truedivRealDivdense_3/BiasAdd:output:0dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аh
dense_3/Gelu/ErfErfdense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€АW
dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Г
dense_3/Gelu/addAddV2dense_3/Gelu/add/x:output:0dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€А|
dense_3/Gelu/mul_1Muldense_3/Gelu/mul:z:0dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€АЛ
 dense_4/Tensordot/ReadVariableOpReadVariableOp)dense_4_tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : џ
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
value	B : я
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
valueB: Ж
dense_4/Tensordot/ProdProd#dense_4/Tensordot/GatherV2:output:0 dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: М
dense_4/Tensordot/Prod_1Prod%dense_4/Tensordot/GatherV2_1:output:0"dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Љ
dense_4/Tensordot/concatConcatV2dense_4/Tensordot/free:output:0dense_4/Tensordot/axes:output:0&dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:С
dense_4/Tensordot/stackPackdense_4/Tensordot/Prod:output:0!dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Ъ
dense_4/Tensordot/transpose	Transposedense_3/Gelu/mul_1:z:0!dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€АҐ
dense_4/Tensordot/ReshapeReshapedense_4/Tensordot/transpose:y:0 dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Ґ
dense_4/Tensordot/MatMulMatMul"dense_4/Tensordot/Reshape:output:0(dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@c
dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@a
dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : «
dense_4/Tensordot/concat_1ConcatV2#dense_4/Tensordot/GatherV2:output:0"dense_4/Tensordot/Const_2:output:0(dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ы
dense_4/TensordotReshape"dense_4/Tensordot/MatMul:product:0#dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@В
dense_4/BiasAdd/ReadVariableOpReadVariableOp'dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Ф
dense_4/BiasAddBiasAdddense_4/Tensordot:output:0&dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@k
IdentityIdentitydense_4/BiasAdd:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@ќ
NoOpNoOp^dense_3/BiasAdd/ReadVariableOp!^dense_3/Tensordot/ReadVariableOp^dense_4/BiasAdd/ReadVariableOp!^dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2D
 dense_3/Tensordot/ReadVariableOp dense_3/Tensordot/ReadVariableOp2@
dense_4/BiasAdd/ReadVariableOpdense_4/BiasAdd/ReadVariableOp2D
 dense_4/Tensordot/ReadVariableOp dense_4/Tensordot/ReadVariableOp:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
їЛ
Є
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_27160

inputsX
Bmulti_head_attention_1_query_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_query_add_readvariableop_resource:@V
@multi_head_attention_1_key_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_1_key_add_readvariableop_resource:@X
Bmulti_head_attention_1_value_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_value_add_readvariableop_resource:@c
Mmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource:@@Q
Cmulti_head_attention_1_attention_output_add_readvariableop_resource:@I
6sequential_1_dense_3_tensordot_readvariableop_resource:	@АC
4sequential_1_dense_3_biasadd_readvariableop_resource:	АI
6sequential_1_dense_4_tensordot_readvariableop_resource:	А@B
4sequential_1_dense_4_biasadd_readvariableop_resource:@
identityИҐ:multi_head_attention_1/attention_output/add/ReadVariableOpҐDmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpҐ-multi_head_attention_1/key/add/ReadVariableOpҐ7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpҐ/multi_head_attention_1/query/add/ReadVariableOpҐ9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpҐ/multi_head_attention_1/value/add/ReadVariableOpҐ9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpҐ+sequential_1/dense_3/BiasAdd/ReadVariableOpҐ-sequential_1/dense_3/Tensordot/ReadVariableOpҐ+sequential_1/dense_4/BiasAdd/ReadVariableOpҐ-sequential_1/dense_4/Tensordot/ReadVariableOpј
9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0я
*multi_head_attention_1/query/einsum/EinsumEinsuminputsAmulti_head_attention_1/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde®
/multi_head_attention_1/query/add/ReadVariableOpReadVariableOp8multi_head_attention_1_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0—
 multi_head_attention_1/query/addAddV23multi_head_attention_1/query/einsum/Einsum:output:07multi_head_attention_1/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@Љ
7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_1_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0џ
(multi_head_attention_1/key/einsum/EinsumEinsuminputs?multi_head_attention_1/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde§
-multi_head_attention_1/key/add/ReadVariableOpReadVariableOp6multi_head_attention_1_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ћ
multi_head_attention_1/key/addAddV21multi_head_attention_1/key/einsum/Einsum:output:05multi_head_attention_1/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@ј
9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0я
*multi_head_attention_1/value/einsum/EinsumEinsuminputsAmulti_head_attention_1/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde®
/multi_head_attention_1/value/add/ReadVariableOpReadVariableOp8multi_head_attention_1_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0—
 multi_head_attention_1/value/addAddV23multi_head_attention_1/value/einsum/Einsum:output:07multi_head_attention_1/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@a
multi_head_attention_1/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >®
multi_head_attention_1/MulMul$multi_head_attention_1/query/add:z:0%multi_head_attention_1/Mul/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€@‘
$multi_head_attention_1/einsum/EinsumEinsum"multi_head_attention_1/key/add:z:0multi_head_attention_1/Mul:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€*
equationaecd,abcd->acbeЪ
&multi_head_attention_1/softmax/SoftmaxSoftmax-multi_head_attention_1/einsum/Einsum:output:0*
T0*/
_output_shapes
:€€€€€€€€€Я
'multi_head_attention_1/dropout/IdentityIdentity0multi_head_attention_1/softmax/Softmax:softmax:0*
T0*/
_output_shapes
:€€€€€€€€€к
&multi_head_attention_1/einsum_1/EinsumEinsum0multi_head_attention_1/dropout/Identity:output:0$multi_head_attention_1/value/add:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationacbe,aecd->abcd÷
Dmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpMmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ъ
5multi_head_attention_1/attention_output/einsum/EinsumEinsum/multi_head_attention_1/einsum_1/Einsum:output:0Lmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:€€€€€€€€€@*
equationabcd,cde->abeЇ
:multi_head_attention_1/attention_output/add/ReadVariableOpReadVariableOpCmulti_head_attention_1_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0о
+multi_head_attention_1/attention_output/addAddV2>multi_head_attention_1/attention_output/einsum/Einsum:output:0Bmulti_head_attention_1/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@{
addAddV2inputs/multi_head_attention_1/attention_output/add:z:0*
T0*+
_output_shapes
:€€€€€€€€€@•
-sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : П
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
value	B : У
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
valueB: ≠
#sequential_1/dense_3/Tensordot/ProdProd0sequential_1/dense_3/Tensordot/GatherV2:output:0-sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≥
%sequential_1/dense_3/Tensordot/Prod_1Prod2sequential_1/dense_3/Tensordot/GatherV2_1:output:0/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : р
%sequential_1/dense_3/Tensordot/concatConcatV2,sequential_1/dense_3/Tensordot/free:output:0,sequential_1/dense_3/Tensordot/axes:output:03sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:Є
$sequential_1/dense_3/Tensordot/stackPack,sequential_1/dense_3/Tensordot/Prod:output:0.sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:§
(sequential_1/dense_3/Tensordot/transpose	Transposeadd:z:0.sequential_1/dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@…
&sequential_1/dense_3/Tensordot/ReshapeReshape,sequential_1/dense_3/Tensordot/transpose:y:0-sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€ 
%sequential_1/dense_3/Tensordot/MatMulMatMul/sequential_1/dense_3/Tensordot/Reshape:output:05sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€Аq
&sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Аn
,sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ы
'sequential_1/dense_3/Tensordot/concat_1ConcatV20sequential_1/dense_3/Tensordot/GatherV2:output:0/sequential_1/dense_3/Tensordot/Const_2:output:05sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:√
sequential_1/dense_3/TensordotReshape/sequential_1/dense_3/Tensordot/MatMul:product:00sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АЭ
+sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Љ
sequential_1/dense_3/BiasAddBiasAdd'sequential_1/dense_3/Tensordot:output:03sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€Аd
sequential_1/dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?ђ
sequential_1/dense_3/Gelu/mulMul(sequential_1/dense_3/Gelu/mul/x:output:0%sequential_1/dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аe
 sequential_1/dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?µ
!sequential_1/dense_3/Gelu/truedivRealDiv%sequential_1/dense_3/BiasAdd:output:0)sequential_1/dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€АВ
sequential_1/dense_3/Gelu/ErfErf%sequential_1/dense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аd
sequential_1/dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?™
sequential_1/dense_3/Gelu/addAddV2(sequential_1/dense_3/Gelu/add/x:output:0!sequential_1/dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€А£
sequential_1/dense_3/Gelu/mul_1Mul!sequential_1/dense_3/Gelu/mul:z:0!sequential_1/dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€А•
-sequential_1/dense_4/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_4_tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : П
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
value	B : У
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
valueB: ≠
#sequential_1/dense_4/Tensordot/ProdProd0sequential_1/dense_4/Tensordot/GatherV2:output:0-sequential_1/dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≥
%sequential_1/dense_4/Tensordot/Prod_1Prod2sequential_1/dense_4/Tensordot/GatherV2_1:output:0/sequential_1/dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : р
%sequential_1/dense_4/Tensordot/concatConcatV2,sequential_1/dense_4/Tensordot/free:output:0,sequential_1/dense_4/Tensordot/axes:output:03sequential_1/dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:Є
$sequential_1/dense_4/Tensordot/stackPack,sequential_1/dense_4/Tensordot/Prod:output:0.sequential_1/dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Ѕ
(sequential_1/dense_4/Tensordot/transpose	Transpose#sequential_1/dense_3/Gelu/mul_1:z:0.sequential_1/dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€А…
&sequential_1/dense_4/Tensordot/ReshapeReshape,sequential_1/dense_4/Tensordot/transpose:y:0-sequential_1/dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€…
%sequential_1/dense_4/Tensordot/MatMulMatMul/sequential_1/dense_4/Tensordot/Reshape:output:05sequential_1/dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@p
&sequential_1/dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@n
,sequential_1/dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ы
'sequential_1/dense_4/Tensordot/concat_1ConcatV20sequential_1/dense_4/Tensordot/GatherV2:output:0/sequential_1/dense_4/Tensordot/Const_2:output:05sequential_1/dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:¬
sequential_1/dense_4/TensordotReshape/sequential_1/dense_4/Tensordot/MatMul:product:00sequential_1/dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Ь
+sequential_1/dense_4/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0ї
sequential_1/dense_4/BiasAddBiasAdd'sequential_1/dense_4/Tensordot:output:03sequential_1/dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@t
add_1AddV2add:z:0%sequential_1/dense_4/BiasAdd:output:0*
T0*+
_output_shapes
:€€€€€€€€€@\
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@ћ
NoOpNoOp;^multi_head_attention_1/attention_output/add/ReadVariableOpE^multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp.^multi_head_attention_1/key/add/ReadVariableOp8^multi_head_attention_1/key/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/query/add/ReadVariableOp:^multi_head_attention_1/query/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/value/add/ReadVariableOp:^multi_head_attention_1/value/einsum/Einsum/ReadVariableOp,^sequential_1/dense_3/BiasAdd/ReadVariableOp.^sequential_1/dense_3/Tensordot/ReadVariableOp,^sequential_1/dense_4/BiasAdd/ReadVariableOp.^sequential_1/dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:€€€€€€€€€@: : : : : : : : : : : : 2x
:multi_head_attention_1/attention_output/add/ReadVariableOp:multi_head_attention_1/attention_output/add/ReadVariableOp2М
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
:€€€€€€€€€@
 
_user_specified_nameinputs
ъ
g
K__inference_time_distributed_layer_call_and_return_conditional_losses_26656

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
valueB:—
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
valueB"€€€€      А   m
ReshapeReshapeinputsReshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€А^
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€   w
flatten/ReshapeReshapeReshape:output:0flatten/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€А\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
€€€€€€€€€T
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value
B :АХ
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:И
	Reshape_1Reshapeflatten/Reshape:output:0Reshape_1/shape:output:0*
T0*5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€Аh
IdentityIdentityReshape_1:output:0*
T0*5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'€€€€€€€€€€€€€€€€€€А:e a
=
_output_shapes+
):'€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
§
„
#__inference_signature_wrapper_25701
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
	unknown_9:@А

unknown_10:	А*

unknown_11:АА

unknown_12:	А

unknown_13:	А@

unknown_14:@

unknown_15:@ 

unknown_16:@@

unknown_17:@ 

unknown_18:@@

unknown_19:@ 

unknown_20:@@

unknown_21:@ 

unknown_22:@@

unknown_23:@

unknown_24:	@А

unknown_25:	А

unknown_26:	А@

unknown_27:@ 

unknown_28:@@

unknown_29:@ 

unknown_30:@@

unknown_31:@ 

unknown_32:@@

unknown_33:@ 

unknown_34:@@

unknown_35:@

unknown_36:	@А

unknown_37:	А

unknown_38:	А@

unknown_39:@

unknown_40:	А
@

unknown_41:@

unknown_42:@


unknown_43:

identityИҐStatefulPartitionedCallК
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
:€€€€€€€€€
*O
_read_only_resource_inputs1
/-	
 !"#$%&'()*+,-*0
config_proto 

CPU

GPU2*0J 8В *)
f$R"
 __inference__wrapped_model_23514o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*М
_input_shapes{
y:€€€€€€€€€(: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
3
_output_shapes!
:€€€€€€€€€(
!
_user_specified_name	input_1
∆
^
B__inference_flatten_layer_call_and_return_conditional_losses_27354

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:€€€€€€€€€АY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
”
b
F__inference_pooling3d_2_layer_call_and_return_conditional_losses_27333

inputs
identityљ
	MaxPool3D	MaxPool3Dinputs*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€*
ksize	
*
paddingSAME*
strides	
К
IdentityIdentityMaxPool3D:output:0*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€: {
W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
 
_user_specified_nameinputs
ЗE
х
@__inference_model_layer_call_and_return_conditional_losses_25598
input_1-
encoder3d_25494:
encoder3d_25496:-
encoder3d_25498: 
encoder3d_25500: -
encoder3d_25502:  
encoder3d_25504: -
encoder3d_25506: @
encoder3d_25508:@-
encoder3d_25510:@@
encoder3d_25512:@.
encoder3d_25514:@А
encoder3d_25516:	А/
encoder3d_25518:АА
encoder3d_25520:	А+
time_distributed_1_25526:	А@&
time_distributed_1_25528:@0
frame_position_embedding_25533:@/
transformer_layer_1_25536:@@+
transformer_layer_1_25538:@/
transformer_layer_1_25540:@@+
transformer_layer_1_25542:@/
transformer_layer_1_25544:@@+
transformer_layer_1_25546:@/
transformer_layer_1_25548:@@'
transformer_layer_1_25550:@,
transformer_layer_1_25552:	@А(
transformer_layer_1_25554:	А,
transformer_layer_1_25556:	А@'
transformer_layer_1_25558:@/
transformer_layer_2_25561:@@+
transformer_layer_2_25563:@/
transformer_layer_2_25565:@@+
transformer_layer_2_25567:@/
transformer_layer_2_25569:@@+
transformer_layer_2_25571:@/
transformer_layer_2_25573:@@'
transformer_layer_2_25575:@,
transformer_layer_2_25577:	@А(
transformer_layer_2_25579:	А,
transformer_layer_2_25581:	А@'
transformer_layer_2_25583:@ 
dense_5_25587:	А
@
dense_5_25589:@
dense_6_25592:@

dense_6_25594:

identityИҐdense_5/StatefulPartitionedCallҐdense_6/StatefulPartitionedCallҐ!encoder3d/StatefulPartitionedCallҐ0frame_position_embedding/StatefulPartitionedCallҐ*time_distributed_1/StatefulPartitionedCallҐ+transformer_layer_1/StatefulPartitionedCallҐ+transformer_layer_2/StatefulPartitionedCallж
!encoder3d/StatefulPartitionedCallStatefulPartitionedCallinput_1encoder3d_25494encoder3d_25496encoder3d_25498encoder3d_25500encoder3d_25502encoder3d_25504encoder3d_25506encoder3d_25508encoder3d_25510encoder3d_25512encoder3d_25514encoder3d_25516encoder3d_25518encoder3d_25520*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :€€€€€€€€€А*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_encoder3d_layer_call_and_return_conditional_losses_24167у
 time_distributed/PartitionedCallPartitionedCall*encoder3d/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *T
fORM
K__inference_time_distributed_layer_call_and_return_conditional_losses_23604w
time_distributed/Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"€€€€      А   ≥
time_distributed/ReshapeReshape*encoder3d/StatefulPartitionedCall:output:0'time_distributed/Reshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€Ањ
*time_distributed_1/StatefulPartitionedCallStatefulPartitionedCall)time_distributed/PartitionedCall:output:0time_distributed_1_25526time_distributed_1_25528*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *V
fQRO
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_23689q
 time_distributed_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"€€€€   Ѓ
time_distributed_1/ReshapeReshape)time_distributed/PartitionedCall:output:0)time_distributed_1/Reshape/shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€Ањ
0frame_position_embedding/StatefulPartitionedCallStatefulPartitionedCall3time_distributed_1/StatefulPartitionedCall:output:0frame_position_embedding_25533*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *\
fWRU
S__inference_frame_position_embedding_layer_call_and_return_conditional_losses_24225х
+transformer_layer_1/StatefulPartitionedCallStatefulPartitionedCall9frame_position_embedding/StatefulPartitionedCall:output:0transformer_layer_1_25536transformer_layer_1_25538transformer_layer_1_25540transformer_layer_1_25542transformer_layer_1_25544transformer_layer_1_25546transformer_layer_1_25548transformer_layer_1_25550transformer_layer_1_25552transformer_layer_1_25554transformer_layer_1_25556transformer_layer_1_25558*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_24923р
+transformer_layer_2/StatefulPartitionedCallStatefulPartitionedCall4transformer_layer_1/StatefulPartitionedCall:output:0transformer_layer_2_25561transformer_layer_2_25563transformer_layer_2_25565transformer_layer_2_25567transformer_layer_2_25569transformer_layer_2_25571transformer_layer_2_25573transformer_layer_2_25575transformer_layer_2_25577transformer_layer_2_25579transformer_layer_2_25581transformer_layer_2_25583*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_24769л
flatten_1/PartitionedCallPartitionedCall4transformer_layer_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А
* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_flatten_1_layer_call_and_return_conditional_losses_24479И
dense_5/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_5_25587dense_5_25589*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_24499О
dense_6/StatefulPartitionedCallStatefulPartitionedCall(dense_5/StatefulPartitionedCall:output:0dense_6_25592dense_6_25594*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_6_layer_call_and_return_conditional_losses_24516w
IdentityIdentity(dense_6/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
к
NoOpNoOp ^dense_5/StatefulPartitionedCall ^dense_6/StatefulPartitionedCall"^encoder3d/StatefulPartitionedCall1^frame_position_embedding/StatefulPartitionedCall+^time_distributed_1/StatefulPartitionedCall,^transformer_layer_1/StatefulPartitionedCall,^transformer_layer_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*М
_input_shapes{
y:€€€€€€€€€(: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2B
dense_6/StatefulPartitionedCalldense_6/StatefulPartitionedCall2F
!encoder3d/StatefulPartitionedCall!encoder3d/StatefulPartitionedCall2d
0frame_position_embedding/StatefulPartitionedCall0frame_position_embedding/StatefulPartitionedCall2X
*time_distributed_1/StatefulPartitionedCall*time_distributed_1/StatefulPartitionedCall2Z
+transformer_layer_1/StatefulPartitionedCall+transformer_layer_1/StatefulPartitionedCall2Z
+transformer_layer_2/StatefulPartitionedCall+transformer_layer_2/StatefulPartitionedCall:\ X
3
_output_shapes!
:€€€€€€€€€(
!
_user_specified_name	input_1
«
ў
,__inference_sequential_1_layer_call_fn_23995
dense_3_input
unknown:	@А
	unknown_0:	А
	unknown_1:	А@
	unknown_2:@
identityИҐStatefulPartitionedCallД
StatefulPartitionedCallStatefulPartitionedCalldense_3_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *P
fKRI
G__inference_sequential_1_layer_call_and_return_conditional_losses_23984s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Z V
+
_output_shapes
:€€€€€€€€€@
'
_user_specified_namedense_3_input
Ь
Ч
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_26732

inputs7
$dense_matmul_readvariableop_resource:	А@3
%dense_biasadd_readvariableop_resource:@
identityИҐdense/BiasAdd/ReadVariableOpҐdense/MatMul/ReadVariableOp;
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
valueB:—
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
valueB"€€€€   e
ReshapeReshapeinputsReshape/shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€АБ
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource*
_output_shapes
:	А@*
dtype0
dense/MatMulMatMulReshape:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@~
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0И
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@U
dense/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?z
dense/Gelu/mulMuldense/Gelu/mul/x:output:0dense/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€@V
dense/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?Г
dense/Gelu/truedivRealDivdense/BiasAdd:output:0dense/Gelu/Cast/x:output:0*
T0*'
_output_shapes
:€€€€€€€€€@_
dense/Gelu/ErfErfdense/Gelu/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€@U
dense/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?x
dense/Gelu/addAddV2dense/Gelu/add/x:output:0dense/Gelu/Erf:y:0*
T0*'
_output_shapes
:€€€€€€€€€@q
dense/Gelu/mul_1Muldense/Gelu/mul:z:0dense/Gelu/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€@\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
€€€€€€€€€S
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value	B :@Х
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:Г
	Reshape_1Reshapedense/Gelu/mul_1:z:0Reshape_1/shape:output:0*
T0*4
_output_shapes"
 :€€€€€€€€€€€€€€€€€€@n
IdentityIdentityReshape_1:output:0^NoOp*
T0*4
_output_shapes"
 :€€€€€€€€€€€€€€€€€€@Г
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:€€€€€€€€€€€€€€€€€€А: : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp:] Y
5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
™л
 y
!__inference__traced_restore_28758
file_prefix2
assignvariableop_dense_5_kernel:	А
@-
assignvariableop_1_dense_5_bias:@3
!assignvariableop_2_dense_6_kernel:@
-
assignvariableop_3_dense_6_bias:
t
Vassignvariableop_4_encoder3d_spatial_attention_spatial_attention_attention_conv_kernel:b
Tassignvariableop_5_encoder3d_spatial_attention_spatial_attention_attention_conv_bias:d
Fassignvariableop_6_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_kernel: R
Dassignvariableop_7_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_bias: e
Gassignvariableop_8_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_kernel:  S
Eassignvariableop_9_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_bias: g
Iassignvariableop_10_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_kernel: @U
Gassignvariableop_11_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_bias:@h
Jassignvariableop_12_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_kernel:@@V
Hassignvariableop_13_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_bias:@h
Iassignvariableop_14_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_kernel:@АV
Gassignvariableop_15_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_bias:	Аj
Jassignvariableop_16_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_kernel:ААW
Hassignvariableop_17_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_bias:	А@
-assignvariableop_18_time_distributed_1_kernel:	А@9
+assignvariableop_19_time_distributed_1_bias:@S
Aassignvariableop_20_frame_position_embedding_embedding_embeddings:@_
Iassignvariableop_21_transformer_layer_1_multi_head_attention_query_kernel:@@Y
Gassignvariableop_22_transformer_layer_1_multi_head_attention_query_bias:@]
Gassignvariableop_23_transformer_layer_1_multi_head_attention_key_kernel:@@W
Eassignvariableop_24_transformer_layer_1_multi_head_attention_key_bias:@_
Iassignvariableop_25_transformer_layer_1_multi_head_attention_value_kernel:@@Y
Gassignvariableop_26_transformer_layer_1_multi_head_attention_value_bias:@j
Tassignvariableop_27_transformer_layer_1_multi_head_attention_attention_output_kernel:@@`
Rassignvariableop_28_transformer_layer_1_multi_head_attention_attention_output_bias:@5
"assignvariableop_29_dense_1_kernel:	@А/
 assignvariableop_30_dense_1_bias:	А5
"assignvariableop_31_dense_2_kernel:	А@.
 assignvariableop_32_dense_2_bias:@a
Kassignvariableop_33_transformer_layer_2_multi_head_attention_1_query_kernel:@@[
Iassignvariableop_34_transformer_layer_2_multi_head_attention_1_query_bias:@_
Iassignvariableop_35_transformer_layer_2_multi_head_attention_1_key_kernel:@@Y
Gassignvariableop_36_transformer_layer_2_multi_head_attention_1_key_bias:@a
Kassignvariableop_37_transformer_layer_2_multi_head_attention_1_value_kernel:@@[
Iassignvariableop_38_transformer_layer_2_multi_head_attention_1_value_bias:@l
Vassignvariableop_39_transformer_layer_2_multi_head_attention_1_attention_output_kernel:@@b
Tassignvariableop_40_transformer_layer_2_multi_head_attention_1_attention_output_bias:@5
"assignvariableop_41_dense_3_kernel:	@А/
 assignvariableop_42_dense_3_bias:	А5
"assignvariableop_43_dense_4_kernel:	А@.
 assignvariableop_44_dense_4_bias:@'
assignvariableop_45_adam_iter:	 )
assignvariableop_46_adam_beta_1: )
assignvariableop_47_adam_beta_2: (
assignvariableop_48_adam_decay: 0
&assignvariableop_49_adam_learning_rate: %
assignvariableop_50_total_1: %
assignvariableop_51_count_1: #
assignvariableop_52_total: #
assignvariableop_53_count: <
)assignvariableop_54_adam_dense_5_kernel_m:	А
@5
'assignvariableop_55_adam_dense_5_bias_m:@;
)assignvariableop_56_adam_dense_6_kernel_m:@
5
'assignvariableop_57_adam_dense_6_bias_m:
|
^assignvariableop_58_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_kernel_m:j
\assignvariableop_59_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_bias_m:l
Nassignvariableop_60_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_kernel_m: Z
Lassignvariableop_61_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_bias_m: m
Oassignvariableop_62_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_kernel_m:  [
Massignvariableop_63_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_bias_m: n
Passignvariableop_64_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_kernel_m: @\
Nassignvariableop_65_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_bias_m:@o
Qassignvariableop_66_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_kernel_m:@@]
Oassignvariableop_67_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_bias_m:@o
Passignvariableop_68_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_kernel_m:@А]
Nassignvariableop_69_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_bias_m:	Аq
Qassignvariableop_70_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_kernel_m:АА^
Oassignvariableop_71_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_bias_m:	АG
4assignvariableop_72_adam_time_distributed_1_kernel_m:	А@@
2assignvariableop_73_adam_time_distributed_1_bias_m:@Z
Hassignvariableop_74_adam_frame_position_embedding_embedding_embeddings_m:@f
Passignvariableop_75_adam_transformer_layer_1_multi_head_attention_query_kernel_m:@@`
Nassignvariableop_76_adam_transformer_layer_1_multi_head_attention_query_bias_m:@d
Nassignvariableop_77_adam_transformer_layer_1_multi_head_attention_key_kernel_m:@@^
Lassignvariableop_78_adam_transformer_layer_1_multi_head_attention_key_bias_m:@f
Passignvariableop_79_adam_transformer_layer_1_multi_head_attention_value_kernel_m:@@`
Nassignvariableop_80_adam_transformer_layer_1_multi_head_attention_value_bias_m:@q
[assignvariableop_81_adam_transformer_layer_1_multi_head_attention_attention_output_kernel_m:@@g
Yassignvariableop_82_adam_transformer_layer_1_multi_head_attention_attention_output_bias_m:@<
)assignvariableop_83_adam_dense_1_kernel_m:	@А6
'assignvariableop_84_adam_dense_1_bias_m:	А<
)assignvariableop_85_adam_dense_2_kernel_m:	А@5
'assignvariableop_86_adam_dense_2_bias_m:@h
Rassignvariableop_87_adam_transformer_layer_2_multi_head_attention_1_query_kernel_m:@@b
Passignvariableop_88_adam_transformer_layer_2_multi_head_attention_1_query_bias_m:@f
Passignvariableop_89_adam_transformer_layer_2_multi_head_attention_1_key_kernel_m:@@`
Nassignvariableop_90_adam_transformer_layer_2_multi_head_attention_1_key_bias_m:@h
Rassignvariableop_91_adam_transformer_layer_2_multi_head_attention_1_value_kernel_m:@@b
Passignvariableop_92_adam_transformer_layer_2_multi_head_attention_1_value_bias_m:@s
]assignvariableop_93_adam_transformer_layer_2_multi_head_attention_1_attention_output_kernel_m:@@i
[assignvariableop_94_adam_transformer_layer_2_multi_head_attention_1_attention_output_bias_m:@<
)assignvariableop_95_adam_dense_3_kernel_m:	@А6
'assignvariableop_96_adam_dense_3_bias_m:	А<
)assignvariableop_97_adam_dense_4_kernel_m:	А@5
'assignvariableop_98_adam_dense_4_bias_m:@<
)assignvariableop_99_adam_dense_5_kernel_v:	А
@6
(assignvariableop_100_adam_dense_5_bias_v:@<
*assignvariableop_101_adam_dense_6_kernel_v:@
6
(assignvariableop_102_adam_dense_6_bias_v:
}
_assignvariableop_103_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_kernel_v:k
]assignvariableop_104_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_bias_v:m
Oassignvariableop_105_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_kernel_v: [
Massignvariableop_106_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_bias_v: n
Passignvariableop_107_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_kernel_v:  \
Nassignvariableop_108_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_bias_v: o
Qassignvariableop_109_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_kernel_v: @]
Oassignvariableop_110_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_bias_v:@p
Rassignvariableop_111_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_kernel_v:@@^
Passignvariableop_112_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_bias_v:@p
Qassignvariableop_113_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_kernel_v:@А^
Oassignvariableop_114_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_bias_v:	Аr
Rassignvariableop_115_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_kernel_v:АА_
Passignvariableop_116_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_bias_v:	АH
5assignvariableop_117_adam_time_distributed_1_kernel_v:	А@A
3assignvariableop_118_adam_time_distributed_1_bias_v:@[
Iassignvariableop_119_adam_frame_position_embedding_embedding_embeddings_v:@g
Qassignvariableop_120_adam_transformer_layer_1_multi_head_attention_query_kernel_v:@@a
Oassignvariableop_121_adam_transformer_layer_1_multi_head_attention_query_bias_v:@e
Oassignvariableop_122_adam_transformer_layer_1_multi_head_attention_key_kernel_v:@@_
Massignvariableop_123_adam_transformer_layer_1_multi_head_attention_key_bias_v:@g
Qassignvariableop_124_adam_transformer_layer_1_multi_head_attention_value_kernel_v:@@a
Oassignvariableop_125_adam_transformer_layer_1_multi_head_attention_value_bias_v:@r
\assignvariableop_126_adam_transformer_layer_1_multi_head_attention_attention_output_kernel_v:@@h
Zassignvariableop_127_adam_transformer_layer_1_multi_head_attention_attention_output_bias_v:@=
*assignvariableop_128_adam_dense_1_kernel_v:	@А7
(assignvariableop_129_adam_dense_1_bias_v:	А=
*assignvariableop_130_adam_dense_2_kernel_v:	А@6
(assignvariableop_131_adam_dense_2_bias_v:@i
Sassignvariableop_132_adam_transformer_layer_2_multi_head_attention_1_query_kernel_v:@@c
Qassignvariableop_133_adam_transformer_layer_2_multi_head_attention_1_query_bias_v:@g
Qassignvariableop_134_adam_transformer_layer_2_multi_head_attention_1_key_kernel_v:@@a
Oassignvariableop_135_adam_transformer_layer_2_multi_head_attention_1_key_bias_v:@i
Sassignvariableop_136_adam_transformer_layer_2_multi_head_attention_1_value_kernel_v:@@c
Qassignvariableop_137_adam_transformer_layer_2_multi_head_attention_1_value_bias_v:@t
^assignvariableop_138_adam_transformer_layer_2_multi_head_attention_1_attention_output_kernel_v:@@j
\assignvariableop_139_adam_transformer_layer_2_multi_head_attention_1_attention_output_bias_v:@=
*assignvariableop_140_adam_dense_3_kernel_v:	@А7
(assignvariableop_141_adam_dense_3_bias_v:	А=
*assignvariableop_142_adam_dense_4_kernel_v:	А@6
(assignvariableop_143_adam_dense_4_bias_v:@
identity_145ИҐAssignVariableOpҐAssignVariableOp_1ҐAssignVariableOp_10ҐAssignVariableOp_100ҐAssignVariableOp_101ҐAssignVariableOp_102ҐAssignVariableOp_103ҐAssignVariableOp_104ҐAssignVariableOp_105ҐAssignVariableOp_106ҐAssignVariableOp_107ҐAssignVariableOp_108ҐAssignVariableOp_109ҐAssignVariableOp_11ҐAssignVariableOp_110ҐAssignVariableOp_111ҐAssignVariableOp_112ҐAssignVariableOp_113ҐAssignVariableOp_114ҐAssignVariableOp_115ҐAssignVariableOp_116ҐAssignVariableOp_117ҐAssignVariableOp_118ҐAssignVariableOp_119ҐAssignVariableOp_12ҐAssignVariableOp_120ҐAssignVariableOp_121ҐAssignVariableOp_122ҐAssignVariableOp_123ҐAssignVariableOp_124ҐAssignVariableOp_125ҐAssignVariableOp_126ҐAssignVariableOp_127ҐAssignVariableOp_128ҐAssignVariableOp_129ҐAssignVariableOp_13ҐAssignVariableOp_130ҐAssignVariableOp_131ҐAssignVariableOp_132ҐAssignVariableOp_133ҐAssignVariableOp_134ҐAssignVariableOp_135ҐAssignVariableOp_136ҐAssignVariableOp_137ҐAssignVariableOp_138ҐAssignVariableOp_139ҐAssignVariableOp_14ҐAssignVariableOp_140ҐAssignVariableOp_141ҐAssignVariableOp_142ҐAssignVariableOp_143ҐAssignVariableOp_15ҐAssignVariableOp_16ҐAssignVariableOp_17ҐAssignVariableOp_18ҐAssignVariableOp_19ҐAssignVariableOp_2ҐAssignVariableOp_20ҐAssignVariableOp_21ҐAssignVariableOp_22ҐAssignVariableOp_23ҐAssignVariableOp_24ҐAssignVariableOp_25ҐAssignVariableOp_26ҐAssignVariableOp_27ҐAssignVariableOp_28ҐAssignVariableOp_29ҐAssignVariableOp_3ҐAssignVariableOp_30ҐAssignVariableOp_31ҐAssignVariableOp_32ҐAssignVariableOp_33ҐAssignVariableOp_34ҐAssignVariableOp_35ҐAssignVariableOp_36ҐAssignVariableOp_37ҐAssignVariableOp_38ҐAssignVariableOp_39ҐAssignVariableOp_4ҐAssignVariableOp_40ҐAssignVariableOp_41ҐAssignVariableOp_42ҐAssignVariableOp_43ҐAssignVariableOp_44ҐAssignVariableOp_45ҐAssignVariableOp_46ҐAssignVariableOp_47ҐAssignVariableOp_48ҐAssignVariableOp_49ҐAssignVariableOp_5ҐAssignVariableOp_50ҐAssignVariableOp_51ҐAssignVariableOp_52ҐAssignVariableOp_53ҐAssignVariableOp_54ҐAssignVariableOp_55ҐAssignVariableOp_56ҐAssignVariableOp_57ҐAssignVariableOp_58ҐAssignVariableOp_59ҐAssignVariableOp_6ҐAssignVariableOp_60ҐAssignVariableOp_61ҐAssignVariableOp_62ҐAssignVariableOp_63ҐAssignVariableOp_64ҐAssignVariableOp_65ҐAssignVariableOp_66ҐAssignVariableOp_67ҐAssignVariableOp_68ҐAssignVariableOp_69ҐAssignVariableOp_7ҐAssignVariableOp_70ҐAssignVariableOp_71ҐAssignVariableOp_72ҐAssignVariableOp_73ҐAssignVariableOp_74ҐAssignVariableOp_75ҐAssignVariableOp_76ҐAssignVariableOp_77ҐAssignVariableOp_78ҐAssignVariableOp_79ҐAssignVariableOp_8ҐAssignVariableOp_80ҐAssignVariableOp_81ҐAssignVariableOp_82ҐAssignVariableOp_83ҐAssignVariableOp_84ҐAssignVariableOp_85ҐAssignVariableOp_86ҐAssignVariableOp_87ҐAssignVariableOp_88ҐAssignVariableOp_89ҐAssignVariableOp_9ҐAssignVariableOp_90ҐAssignVariableOp_91ҐAssignVariableOp_92ҐAssignVariableOp_93ҐAssignVariableOp_94ҐAssignVariableOp_95ҐAssignVariableOp_96ҐAssignVariableOp_97ҐAssignVariableOp_98ҐAssignVariableOp_99ЌD
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes	
:С*
dtype0*тC
valueиCBеCСB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB'variables/10/.ATTRIBUTES/VARIABLE_VALUEB'variables/11/.ATTRIBUTES/VARIABLE_VALUEB'variables/12/.ATTRIBUTES/VARIABLE_VALUEB'variables/13/.ATTRIBUTES/VARIABLE_VALUEB'variables/14/.ATTRIBUTES/VARIABLE_VALUEB'variables/15/.ATTRIBUTES/VARIABLE_VALUEB'variables/16/.ATTRIBUTES/VARIABLE_VALUEB'variables/17/.ATTRIBUTES/VARIABLE_VALUEB'variables/18/.ATTRIBUTES/VARIABLE_VALUEB'variables/19/.ATTRIBUTES/VARIABLE_VALUEB'variables/20/.ATTRIBUTES/VARIABLE_VALUEB'variables/21/.ATTRIBUTES/VARIABLE_VALUEB'variables/22/.ATTRIBUTES/VARIABLE_VALUEB'variables/23/.ATTRIBUTES/VARIABLE_VALUEB'variables/24/.ATTRIBUTES/VARIABLE_VALUEB'variables/25/.ATTRIBUTES/VARIABLE_VALUEB'variables/26/.ATTRIBUTES/VARIABLE_VALUEB'variables/27/.ATTRIBUTES/VARIABLE_VALUEB'variables/28/.ATTRIBUTES/VARIABLE_VALUEB'variables/29/.ATTRIBUTES/VARIABLE_VALUEB'variables/30/.ATTRIBUTES/VARIABLE_VALUEB'variables/31/.ATTRIBUTES/VARIABLE_VALUEB'variables/32/.ATTRIBUTES/VARIABLE_VALUEB'variables/33/.ATTRIBUTES/VARIABLE_VALUEB'variables/34/.ATTRIBUTES/VARIABLE_VALUEB'variables/35/.ATTRIBUTES/VARIABLE_VALUEB'variables/36/.ATTRIBUTES/VARIABLE_VALUEB'variables/37/.ATTRIBUTES/VARIABLE_VALUEB'variables/38/.ATTRIBUTES/VARIABLE_VALUEB'variables/39/.ATTRIBUTES/VARIABLE_VALUEB'variables/40/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/7/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/8/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/9/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/10/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/11/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/12/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/13/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/14/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/15/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/16/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/17/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/18/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/19/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/20/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/21/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/22/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/23/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/24/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/25/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/26/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/27/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/28/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/29/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/30/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/31/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/32/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/33/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/34/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/35/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/36/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/37/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/38/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/39/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/40/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/7/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/8/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/9/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/10/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/11/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/12/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/13/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/14/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/15/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/16/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/17/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/18/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/19/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/20/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/21/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/22/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/23/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/24/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/25/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/26/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/27/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/28/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/29/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/30/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/31/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/32/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/33/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/34/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/35/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/36/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/37/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/38/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/39/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/40/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHЧ
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes	
:С*
dtype0*Є
valueЃBЂСB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B ъ
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*Џ
_output_shapes«
ƒ:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*Ґ
dtypesЧ
Ф2С	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOpAssignVariableOpassignvariableop_dense_5_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:О
AssignVariableOp_1AssignVariableOpassignvariableop_1_dense_5_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:Р
AssignVariableOp_2AssignVariableOp!assignvariableop_2_dense_6_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:О
AssignVariableOp_3AssignVariableOpassignvariableop_3_dense_6_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:≈
AssignVariableOp_4AssignVariableOpVassignvariableop_4_encoder3d_spatial_attention_spatial_attention_attention_conv_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:√
AssignVariableOp_5AssignVariableOpTassignvariableop_5_encoder3d_spatial_attention_spatial_attention_attention_conv_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:µ
AssignVariableOp_6AssignVariableOpFassignvariableop_6_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:≥
AssignVariableOp_7AssignVariableOpDassignvariableop_7_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:ґ
AssignVariableOp_8AssignVariableOpGassignvariableop_8_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:і
AssignVariableOp_9AssignVariableOpEassignvariableop_9_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:Ї
AssignVariableOp_10AssignVariableOpIassignvariableop_10_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:Є
AssignVariableOp_11AssignVariableOpGassignvariableop_11_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_biasIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:ї
AssignVariableOp_12AssignVariableOpJassignvariableop_12_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_kernelIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:є
AssignVariableOp_13AssignVariableOpHassignvariableop_13_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_biasIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:Ї
AssignVariableOp_14AssignVariableOpIassignvariableop_14_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_kernelIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:Є
AssignVariableOp_15AssignVariableOpGassignvariableop_15_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_biasIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:ї
AssignVariableOp_16AssignVariableOpJassignvariableop_16_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_kernelIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:є
AssignVariableOp_17AssignVariableOpHassignvariableop_17_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_biasIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:Ю
AssignVariableOp_18AssignVariableOp-assignvariableop_18_time_distributed_1_kernelIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:Ь
AssignVariableOp_19AssignVariableOp+assignvariableop_19_time_distributed_1_biasIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:≤
AssignVariableOp_20AssignVariableOpAassignvariableop_20_frame_position_embedding_embedding_embeddingsIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:Ї
AssignVariableOp_21AssignVariableOpIassignvariableop_21_transformer_layer_1_multi_head_attention_query_kernelIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:Є
AssignVariableOp_22AssignVariableOpGassignvariableop_22_transformer_layer_1_multi_head_attention_query_biasIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:Є
AssignVariableOp_23AssignVariableOpGassignvariableop_23_transformer_layer_1_multi_head_attention_key_kernelIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:ґ
AssignVariableOp_24AssignVariableOpEassignvariableop_24_transformer_layer_1_multi_head_attention_key_biasIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:Ї
AssignVariableOp_25AssignVariableOpIassignvariableop_25_transformer_layer_1_multi_head_attention_value_kernelIdentity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:Є
AssignVariableOp_26AssignVariableOpGassignvariableop_26_transformer_layer_1_multi_head_attention_value_biasIdentity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:≈
AssignVariableOp_27AssignVariableOpTassignvariableop_27_transformer_layer_1_multi_head_attention_attention_output_kernelIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:√
AssignVariableOp_28AssignVariableOpRassignvariableop_28_transformer_layer_1_multi_head_attention_attention_output_biasIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:У
AssignVariableOp_29AssignVariableOp"assignvariableop_29_dense_1_kernelIdentity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_30AssignVariableOp assignvariableop_30_dense_1_biasIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:У
AssignVariableOp_31AssignVariableOp"assignvariableop_31_dense_2_kernelIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_32AssignVariableOp assignvariableop_32_dense_2_biasIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:Љ
AssignVariableOp_33AssignVariableOpKassignvariableop_33_transformer_layer_2_multi_head_attention_1_query_kernelIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:Ї
AssignVariableOp_34AssignVariableOpIassignvariableop_34_transformer_layer_2_multi_head_attention_1_query_biasIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:Ї
AssignVariableOp_35AssignVariableOpIassignvariableop_35_transformer_layer_2_multi_head_attention_1_key_kernelIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:Є
AssignVariableOp_36AssignVariableOpGassignvariableop_36_transformer_layer_2_multi_head_attention_1_key_biasIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:Љ
AssignVariableOp_37AssignVariableOpKassignvariableop_37_transformer_layer_2_multi_head_attention_1_value_kernelIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:Ї
AssignVariableOp_38AssignVariableOpIassignvariableop_38_transformer_layer_2_multi_head_attention_1_value_biasIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:«
AssignVariableOp_39AssignVariableOpVassignvariableop_39_transformer_layer_2_multi_head_attention_1_attention_output_kernelIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:≈
AssignVariableOp_40AssignVariableOpTassignvariableop_40_transformer_layer_2_multi_head_attention_1_attention_output_biasIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:У
AssignVariableOp_41AssignVariableOp"assignvariableop_41_dense_3_kernelIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_42AssignVariableOp assignvariableop_42_dense_3_biasIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:У
AssignVariableOp_43AssignVariableOp"assignvariableop_43_dense_4_kernelIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_44AssignVariableOp assignvariableop_44_dense_4_biasIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0	*
_output_shapes
:О
AssignVariableOp_45AssignVariableOpassignvariableop_45_adam_iterIdentity_45:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	_
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0*
_output_shapes
:Р
AssignVariableOp_46AssignVariableOpassignvariableop_46_adam_beta_1Identity_46:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:Р
AssignVariableOp_47AssignVariableOpassignvariableop_47_adam_beta_2Identity_47:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_48AssignVariableOpassignvariableop_48_adam_decayIdentity_48:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_49IdentityRestoreV2:tensors:49"/device:CPU:0*
T0*
_output_shapes
:Ч
AssignVariableOp_49AssignVariableOp&assignvariableop_49_adam_learning_rateIdentity_49:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_50IdentityRestoreV2:tensors:50"/device:CPU:0*
T0*
_output_shapes
:М
AssignVariableOp_50AssignVariableOpassignvariableop_50_total_1Identity_50:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_51IdentityRestoreV2:tensors:51"/device:CPU:0*
T0*
_output_shapes
:М
AssignVariableOp_51AssignVariableOpassignvariableop_51_count_1Identity_51:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_52IdentityRestoreV2:tensors:52"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_52AssignVariableOpassignvariableop_52_totalIdentity_52:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_53IdentityRestoreV2:tensors:53"/device:CPU:0*
T0*
_output_shapes
:К
AssignVariableOp_53AssignVariableOpassignvariableop_53_countIdentity_53:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_54IdentityRestoreV2:tensors:54"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_54AssignVariableOp)assignvariableop_54_adam_dense_5_kernel_mIdentity_54:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_55IdentityRestoreV2:tensors:55"/device:CPU:0*
T0*
_output_shapes
:Ш
AssignVariableOp_55AssignVariableOp'assignvariableop_55_adam_dense_5_bias_mIdentity_55:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_56IdentityRestoreV2:tensors:56"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_56AssignVariableOp)assignvariableop_56_adam_dense_6_kernel_mIdentity_56:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_57IdentityRestoreV2:tensors:57"/device:CPU:0*
T0*
_output_shapes
:Ш
AssignVariableOp_57AssignVariableOp'assignvariableop_57_adam_dense_6_bias_mIdentity_57:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_58IdentityRestoreV2:tensors:58"/device:CPU:0*
T0*
_output_shapes
:ѕ
AssignVariableOp_58AssignVariableOp^assignvariableop_58_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_kernel_mIdentity_58:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_59IdentityRestoreV2:tensors:59"/device:CPU:0*
T0*
_output_shapes
:Ќ
AssignVariableOp_59AssignVariableOp\assignvariableop_59_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_bias_mIdentity_59:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_60IdentityRestoreV2:tensors:60"/device:CPU:0*
T0*
_output_shapes
:њ
AssignVariableOp_60AssignVariableOpNassignvariableop_60_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_kernel_mIdentity_60:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_61IdentityRestoreV2:tensors:61"/device:CPU:0*
T0*
_output_shapes
:љ
AssignVariableOp_61AssignVariableOpLassignvariableop_61_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_bias_mIdentity_61:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_62IdentityRestoreV2:tensors:62"/device:CPU:0*
T0*
_output_shapes
:ј
AssignVariableOp_62AssignVariableOpOassignvariableop_62_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_kernel_mIdentity_62:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_63IdentityRestoreV2:tensors:63"/device:CPU:0*
T0*
_output_shapes
:Њ
AssignVariableOp_63AssignVariableOpMassignvariableop_63_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_bias_mIdentity_63:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_64IdentityRestoreV2:tensors:64"/device:CPU:0*
T0*
_output_shapes
:Ѕ
AssignVariableOp_64AssignVariableOpPassignvariableop_64_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_kernel_mIdentity_64:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_65IdentityRestoreV2:tensors:65"/device:CPU:0*
T0*
_output_shapes
:њ
AssignVariableOp_65AssignVariableOpNassignvariableop_65_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_bias_mIdentity_65:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_66IdentityRestoreV2:tensors:66"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_66AssignVariableOpQassignvariableop_66_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_kernel_mIdentity_66:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_67IdentityRestoreV2:tensors:67"/device:CPU:0*
T0*
_output_shapes
:ј
AssignVariableOp_67AssignVariableOpOassignvariableop_67_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_bias_mIdentity_67:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_68IdentityRestoreV2:tensors:68"/device:CPU:0*
T0*
_output_shapes
:Ѕ
AssignVariableOp_68AssignVariableOpPassignvariableop_68_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_kernel_mIdentity_68:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_69IdentityRestoreV2:tensors:69"/device:CPU:0*
T0*
_output_shapes
:њ
AssignVariableOp_69AssignVariableOpNassignvariableop_69_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_bias_mIdentity_69:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_70IdentityRestoreV2:tensors:70"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_70AssignVariableOpQassignvariableop_70_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_kernel_mIdentity_70:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_71IdentityRestoreV2:tensors:71"/device:CPU:0*
T0*
_output_shapes
:ј
AssignVariableOp_71AssignVariableOpOassignvariableop_71_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_bias_mIdentity_71:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_72IdentityRestoreV2:tensors:72"/device:CPU:0*
T0*
_output_shapes
:•
AssignVariableOp_72AssignVariableOp4assignvariableop_72_adam_time_distributed_1_kernel_mIdentity_72:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_73IdentityRestoreV2:tensors:73"/device:CPU:0*
T0*
_output_shapes
:£
AssignVariableOp_73AssignVariableOp2assignvariableop_73_adam_time_distributed_1_bias_mIdentity_73:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_74IdentityRestoreV2:tensors:74"/device:CPU:0*
T0*
_output_shapes
:є
AssignVariableOp_74AssignVariableOpHassignvariableop_74_adam_frame_position_embedding_embedding_embeddings_mIdentity_74:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_75IdentityRestoreV2:tensors:75"/device:CPU:0*
T0*
_output_shapes
:Ѕ
AssignVariableOp_75AssignVariableOpPassignvariableop_75_adam_transformer_layer_1_multi_head_attention_query_kernel_mIdentity_75:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_76IdentityRestoreV2:tensors:76"/device:CPU:0*
T0*
_output_shapes
:њ
AssignVariableOp_76AssignVariableOpNassignvariableop_76_adam_transformer_layer_1_multi_head_attention_query_bias_mIdentity_76:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_77IdentityRestoreV2:tensors:77"/device:CPU:0*
T0*
_output_shapes
:њ
AssignVariableOp_77AssignVariableOpNassignvariableop_77_adam_transformer_layer_1_multi_head_attention_key_kernel_mIdentity_77:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_78IdentityRestoreV2:tensors:78"/device:CPU:0*
T0*
_output_shapes
:љ
AssignVariableOp_78AssignVariableOpLassignvariableop_78_adam_transformer_layer_1_multi_head_attention_key_bias_mIdentity_78:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_79IdentityRestoreV2:tensors:79"/device:CPU:0*
T0*
_output_shapes
:Ѕ
AssignVariableOp_79AssignVariableOpPassignvariableop_79_adam_transformer_layer_1_multi_head_attention_value_kernel_mIdentity_79:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_80IdentityRestoreV2:tensors:80"/device:CPU:0*
T0*
_output_shapes
:њ
AssignVariableOp_80AssignVariableOpNassignvariableop_80_adam_transformer_layer_1_multi_head_attention_value_bias_mIdentity_80:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_81IdentityRestoreV2:tensors:81"/device:CPU:0*
T0*
_output_shapes
:ћ
AssignVariableOp_81AssignVariableOp[assignvariableop_81_adam_transformer_layer_1_multi_head_attention_attention_output_kernel_mIdentity_81:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_82IdentityRestoreV2:tensors:82"/device:CPU:0*
T0*
_output_shapes
: 
AssignVariableOp_82AssignVariableOpYassignvariableop_82_adam_transformer_layer_1_multi_head_attention_attention_output_bias_mIdentity_82:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_83IdentityRestoreV2:tensors:83"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_83AssignVariableOp)assignvariableop_83_adam_dense_1_kernel_mIdentity_83:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_84IdentityRestoreV2:tensors:84"/device:CPU:0*
T0*
_output_shapes
:Ш
AssignVariableOp_84AssignVariableOp'assignvariableop_84_adam_dense_1_bias_mIdentity_84:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_85IdentityRestoreV2:tensors:85"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_85AssignVariableOp)assignvariableop_85_adam_dense_2_kernel_mIdentity_85:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_86IdentityRestoreV2:tensors:86"/device:CPU:0*
T0*
_output_shapes
:Ш
AssignVariableOp_86AssignVariableOp'assignvariableop_86_adam_dense_2_bias_mIdentity_86:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_87IdentityRestoreV2:tensors:87"/device:CPU:0*
T0*
_output_shapes
:√
AssignVariableOp_87AssignVariableOpRassignvariableop_87_adam_transformer_layer_2_multi_head_attention_1_query_kernel_mIdentity_87:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_88IdentityRestoreV2:tensors:88"/device:CPU:0*
T0*
_output_shapes
:Ѕ
AssignVariableOp_88AssignVariableOpPassignvariableop_88_adam_transformer_layer_2_multi_head_attention_1_query_bias_mIdentity_88:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_89IdentityRestoreV2:tensors:89"/device:CPU:0*
T0*
_output_shapes
:Ѕ
AssignVariableOp_89AssignVariableOpPassignvariableop_89_adam_transformer_layer_2_multi_head_attention_1_key_kernel_mIdentity_89:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_90IdentityRestoreV2:tensors:90"/device:CPU:0*
T0*
_output_shapes
:њ
AssignVariableOp_90AssignVariableOpNassignvariableop_90_adam_transformer_layer_2_multi_head_attention_1_key_bias_mIdentity_90:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_91IdentityRestoreV2:tensors:91"/device:CPU:0*
T0*
_output_shapes
:√
AssignVariableOp_91AssignVariableOpRassignvariableop_91_adam_transformer_layer_2_multi_head_attention_1_value_kernel_mIdentity_91:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_92IdentityRestoreV2:tensors:92"/device:CPU:0*
T0*
_output_shapes
:Ѕ
AssignVariableOp_92AssignVariableOpPassignvariableop_92_adam_transformer_layer_2_multi_head_attention_1_value_bias_mIdentity_92:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_93IdentityRestoreV2:tensors:93"/device:CPU:0*
T0*
_output_shapes
:ќ
AssignVariableOp_93AssignVariableOp]assignvariableop_93_adam_transformer_layer_2_multi_head_attention_1_attention_output_kernel_mIdentity_93:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_94IdentityRestoreV2:tensors:94"/device:CPU:0*
T0*
_output_shapes
:ћ
AssignVariableOp_94AssignVariableOp[assignvariableop_94_adam_transformer_layer_2_multi_head_attention_1_attention_output_bias_mIdentity_94:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_95IdentityRestoreV2:tensors:95"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_95AssignVariableOp)assignvariableop_95_adam_dense_3_kernel_mIdentity_95:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_96IdentityRestoreV2:tensors:96"/device:CPU:0*
T0*
_output_shapes
:Ш
AssignVariableOp_96AssignVariableOp'assignvariableop_96_adam_dense_3_bias_mIdentity_96:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_97IdentityRestoreV2:tensors:97"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_97AssignVariableOp)assignvariableop_97_adam_dense_4_kernel_mIdentity_97:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_98IdentityRestoreV2:tensors:98"/device:CPU:0*
T0*
_output_shapes
:Ш
AssignVariableOp_98AssignVariableOp'assignvariableop_98_adam_dense_4_bias_mIdentity_98:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_99IdentityRestoreV2:tensors:99"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_99AssignVariableOp)assignvariableop_99_adam_dense_5_kernel_vIdentity_99:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_100IdentityRestoreV2:tensors:100"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_100AssignVariableOp(assignvariableop_100_adam_dense_5_bias_vIdentity_100:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_101IdentityRestoreV2:tensors:101"/device:CPU:0*
T0*
_output_shapes
:Э
AssignVariableOp_101AssignVariableOp*assignvariableop_101_adam_dense_6_kernel_vIdentity_101:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_102IdentityRestoreV2:tensors:102"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_102AssignVariableOp(assignvariableop_102_adam_dense_6_bias_vIdentity_102:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_103IdentityRestoreV2:tensors:103"/device:CPU:0*
T0*
_output_shapes
:“
AssignVariableOp_103AssignVariableOp_assignvariableop_103_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_kernel_vIdentity_103:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_104IdentityRestoreV2:tensors:104"/device:CPU:0*
T0*
_output_shapes
:–
AssignVariableOp_104AssignVariableOp]assignvariableop_104_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_bias_vIdentity_104:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_105IdentityRestoreV2:tensors:105"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_105AssignVariableOpOassignvariableop_105_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_kernel_vIdentity_105:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_106IdentityRestoreV2:tensors:106"/device:CPU:0*
T0*
_output_shapes
:ј
AssignVariableOp_106AssignVariableOpMassignvariableop_106_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_bias_vIdentity_106:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_107IdentityRestoreV2:tensors:107"/device:CPU:0*
T0*
_output_shapes
:√
AssignVariableOp_107AssignVariableOpPassignvariableop_107_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_kernel_vIdentity_107:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_108IdentityRestoreV2:tensors:108"/device:CPU:0*
T0*
_output_shapes
:Ѕ
AssignVariableOp_108AssignVariableOpNassignvariableop_108_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_bias_vIdentity_108:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_109IdentityRestoreV2:tensors:109"/device:CPU:0*
T0*
_output_shapes
:ƒ
AssignVariableOp_109AssignVariableOpQassignvariableop_109_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_kernel_vIdentity_109:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_110IdentityRestoreV2:tensors:110"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_110AssignVariableOpOassignvariableop_110_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_bias_vIdentity_110:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_111IdentityRestoreV2:tensors:111"/device:CPU:0*
T0*
_output_shapes
:≈
AssignVariableOp_111AssignVariableOpRassignvariableop_111_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_kernel_vIdentity_111:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_112IdentityRestoreV2:tensors:112"/device:CPU:0*
T0*
_output_shapes
:√
AssignVariableOp_112AssignVariableOpPassignvariableop_112_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_bias_vIdentity_112:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_113IdentityRestoreV2:tensors:113"/device:CPU:0*
T0*
_output_shapes
:ƒ
AssignVariableOp_113AssignVariableOpQassignvariableop_113_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_kernel_vIdentity_113:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_114IdentityRestoreV2:tensors:114"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_114AssignVariableOpOassignvariableop_114_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_bias_vIdentity_114:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_115IdentityRestoreV2:tensors:115"/device:CPU:0*
T0*
_output_shapes
:≈
AssignVariableOp_115AssignVariableOpRassignvariableop_115_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_kernel_vIdentity_115:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_116IdentityRestoreV2:tensors:116"/device:CPU:0*
T0*
_output_shapes
:√
AssignVariableOp_116AssignVariableOpPassignvariableop_116_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_bias_vIdentity_116:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_117IdentityRestoreV2:tensors:117"/device:CPU:0*
T0*
_output_shapes
:®
AssignVariableOp_117AssignVariableOp5assignvariableop_117_adam_time_distributed_1_kernel_vIdentity_117:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_118IdentityRestoreV2:tensors:118"/device:CPU:0*
T0*
_output_shapes
:¶
AssignVariableOp_118AssignVariableOp3assignvariableop_118_adam_time_distributed_1_bias_vIdentity_118:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_119IdentityRestoreV2:tensors:119"/device:CPU:0*
T0*
_output_shapes
:Љ
AssignVariableOp_119AssignVariableOpIassignvariableop_119_adam_frame_position_embedding_embedding_embeddings_vIdentity_119:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_120IdentityRestoreV2:tensors:120"/device:CPU:0*
T0*
_output_shapes
:ƒ
AssignVariableOp_120AssignVariableOpQassignvariableop_120_adam_transformer_layer_1_multi_head_attention_query_kernel_vIdentity_120:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_121IdentityRestoreV2:tensors:121"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_121AssignVariableOpOassignvariableop_121_adam_transformer_layer_1_multi_head_attention_query_bias_vIdentity_121:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_122IdentityRestoreV2:tensors:122"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_122AssignVariableOpOassignvariableop_122_adam_transformer_layer_1_multi_head_attention_key_kernel_vIdentity_122:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_123IdentityRestoreV2:tensors:123"/device:CPU:0*
T0*
_output_shapes
:ј
AssignVariableOp_123AssignVariableOpMassignvariableop_123_adam_transformer_layer_1_multi_head_attention_key_bias_vIdentity_123:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_124IdentityRestoreV2:tensors:124"/device:CPU:0*
T0*
_output_shapes
:ƒ
AssignVariableOp_124AssignVariableOpQassignvariableop_124_adam_transformer_layer_1_multi_head_attention_value_kernel_vIdentity_124:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_125IdentityRestoreV2:tensors:125"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_125AssignVariableOpOassignvariableop_125_adam_transformer_layer_1_multi_head_attention_value_bias_vIdentity_125:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_126IdentityRestoreV2:tensors:126"/device:CPU:0*
T0*
_output_shapes
:ѕ
AssignVariableOp_126AssignVariableOp\assignvariableop_126_adam_transformer_layer_1_multi_head_attention_attention_output_kernel_vIdentity_126:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_127IdentityRestoreV2:tensors:127"/device:CPU:0*
T0*
_output_shapes
:Ќ
AssignVariableOp_127AssignVariableOpZassignvariableop_127_adam_transformer_layer_1_multi_head_attention_attention_output_bias_vIdentity_127:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_128IdentityRestoreV2:tensors:128"/device:CPU:0*
T0*
_output_shapes
:Э
AssignVariableOp_128AssignVariableOp*assignvariableop_128_adam_dense_1_kernel_vIdentity_128:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_129IdentityRestoreV2:tensors:129"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_129AssignVariableOp(assignvariableop_129_adam_dense_1_bias_vIdentity_129:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_130IdentityRestoreV2:tensors:130"/device:CPU:0*
T0*
_output_shapes
:Э
AssignVariableOp_130AssignVariableOp*assignvariableop_130_adam_dense_2_kernel_vIdentity_130:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_131IdentityRestoreV2:tensors:131"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_131AssignVariableOp(assignvariableop_131_adam_dense_2_bias_vIdentity_131:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_132IdentityRestoreV2:tensors:132"/device:CPU:0*
T0*
_output_shapes
:∆
AssignVariableOp_132AssignVariableOpSassignvariableop_132_adam_transformer_layer_2_multi_head_attention_1_query_kernel_vIdentity_132:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_133IdentityRestoreV2:tensors:133"/device:CPU:0*
T0*
_output_shapes
:ƒ
AssignVariableOp_133AssignVariableOpQassignvariableop_133_adam_transformer_layer_2_multi_head_attention_1_query_bias_vIdentity_133:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_134IdentityRestoreV2:tensors:134"/device:CPU:0*
T0*
_output_shapes
:ƒ
AssignVariableOp_134AssignVariableOpQassignvariableop_134_adam_transformer_layer_2_multi_head_attention_1_key_kernel_vIdentity_134:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_135IdentityRestoreV2:tensors:135"/device:CPU:0*
T0*
_output_shapes
:¬
AssignVariableOp_135AssignVariableOpOassignvariableop_135_adam_transformer_layer_2_multi_head_attention_1_key_bias_vIdentity_135:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_136IdentityRestoreV2:tensors:136"/device:CPU:0*
T0*
_output_shapes
:∆
AssignVariableOp_136AssignVariableOpSassignvariableop_136_adam_transformer_layer_2_multi_head_attention_1_value_kernel_vIdentity_136:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_137IdentityRestoreV2:tensors:137"/device:CPU:0*
T0*
_output_shapes
:ƒ
AssignVariableOp_137AssignVariableOpQassignvariableop_137_adam_transformer_layer_2_multi_head_attention_1_value_bias_vIdentity_137:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_138IdentityRestoreV2:tensors:138"/device:CPU:0*
T0*
_output_shapes
:—
AssignVariableOp_138AssignVariableOp^assignvariableop_138_adam_transformer_layer_2_multi_head_attention_1_attention_output_kernel_vIdentity_138:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_139IdentityRestoreV2:tensors:139"/device:CPU:0*
T0*
_output_shapes
:ѕ
AssignVariableOp_139AssignVariableOp\assignvariableop_139_adam_transformer_layer_2_multi_head_attention_1_attention_output_bias_vIdentity_139:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_140IdentityRestoreV2:tensors:140"/device:CPU:0*
T0*
_output_shapes
:Э
AssignVariableOp_140AssignVariableOp*assignvariableop_140_adam_dense_3_kernel_vIdentity_140:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_141IdentityRestoreV2:tensors:141"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_141AssignVariableOp(assignvariableop_141_adam_dense_3_bias_vIdentity_141:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_142IdentityRestoreV2:tensors:142"/device:CPU:0*
T0*
_output_shapes
:Э
AssignVariableOp_142AssignVariableOp*assignvariableop_142_adam_dense_4_kernel_vIdentity_142:output:0"/device:CPU:0*
_output_shapes
 *
dtype0a
Identity_143IdentityRestoreV2:tensors:143"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_143AssignVariableOp(assignvariableop_143_adam_dense_4_bias_vIdentity_143:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 №
Identity_144Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_100^AssignVariableOp_101^AssignVariableOp_102^AssignVariableOp_103^AssignVariableOp_104^AssignVariableOp_105^AssignVariableOp_106^AssignVariableOp_107^AssignVariableOp_108^AssignVariableOp_109^AssignVariableOp_11^AssignVariableOp_110^AssignVariableOp_111^AssignVariableOp_112^AssignVariableOp_113^AssignVariableOp_114^AssignVariableOp_115^AssignVariableOp_116^AssignVariableOp_117^AssignVariableOp_118^AssignVariableOp_119^AssignVariableOp_12^AssignVariableOp_120^AssignVariableOp_121^AssignVariableOp_122^AssignVariableOp_123^AssignVariableOp_124^AssignVariableOp_125^AssignVariableOp_126^AssignVariableOp_127^AssignVariableOp_128^AssignVariableOp_129^AssignVariableOp_13^AssignVariableOp_130^AssignVariableOp_131^AssignVariableOp_132^AssignVariableOp_133^AssignVariableOp_134^AssignVariableOp_135^AssignVariableOp_136^AssignVariableOp_137^AssignVariableOp_138^AssignVariableOp_139^AssignVariableOp_14^AssignVariableOp_140^AssignVariableOp_141^AssignVariableOp_142^AssignVariableOp_143^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_72^AssignVariableOp_73^AssignVariableOp_74^AssignVariableOp_75^AssignVariableOp_76^AssignVariableOp_77^AssignVariableOp_78^AssignVariableOp_79^AssignVariableOp_8^AssignVariableOp_80^AssignVariableOp_81^AssignVariableOp_82^AssignVariableOp_83^AssignVariableOp_84^AssignVariableOp_85^AssignVariableOp_86^AssignVariableOp_87^AssignVariableOp_88^AssignVariableOp_89^AssignVariableOp_9^AssignVariableOp_90^AssignVariableOp_91^AssignVariableOp_92^AssignVariableOp_93^AssignVariableOp_94^AssignVariableOp_95^AssignVariableOp_96^AssignVariableOp_97^AssignVariableOp_98^AssignVariableOp_99^NoOp"/device:CPU:0*
T0*
_output_shapes
: Y
Identity_145IdentityIdentity_144:output:0^NoOp_1*
T0*
_output_shapes
: »
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_100^AssignVariableOp_101^AssignVariableOp_102^AssignVariableOp_103^AssignVariableOp_104^AssignVariableOp_105^AssignVariableOp_106^AssignVariableOp_107^AssignVariableOp_108^AssignVariableOp_109^AssignVariableOp_11^AssignVariableOp_110^AssignVariableOp_111^AssignVariableOp_112^AssignVariableOp_113^AssignVariableOp_114^AssignVariableOp_115^AssignVariableOp_116^AssignVariableOp_117^AssignVariableOp_118^AssignVariableOp_119^AssignVariableOp_12^AssignVariableOp_120^AssignVariableOp_121^AssignVariableOp_122^AssignVariableOp_123^AssignVariableOp_124^AssignVariableOp_125^AssignVariableOp_126^AssignVariableOp_127^AssignVariableOp_128^AssignVariableOp_129^AssignVariableOp_13^AssignVariableOp_130^AssignVariableOp_131^AssignVariableOp_132^AssignVariableOp_133^AssignVariableOp_134^AssignVariableOp_135^AssignVariableOp_136^AssignVariableOp_137^AssignVariableOp_138^AssignVariableOp_139^AssignVariableOp_14^AssignVariableOp_140^AssignVariableOp_141^AssignVariableOp_142^AssignVariableOp_143^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_67^AssignVariableOp_68^AssignVariableOp_69^AssignVariableOp_7^AssignVariableOp_70^AssignVariableOp_71^AssignVariableOp_72^AssignVariableOp_73^AssignVariableOp_74^AssignVariableOp_75^AssignVariableOp_76^AssignVariableOp_77^AssignVariableOp_78^AssignVariableOp_79^AssignVariableOp_8^AssignVariableOp_80^AssignVariableOp_81^AssignVariableOp_82^AssignVariableOp_83^AssignVariableOp_84^AssignVariableOp_85^AssignVariableOp_86^AssignVariableOp_87^AssignVariableOp_88^AssignVariableOp_89^AssignVariableOp_9^AssignVariableOp_90^AssignVariableOp_91^AssignVariableOp_92^AssignVariableOp_93^AssignVariableOp_94^AssignVariableOp_95^AssignVariableOp_96^AssignVariableOp_97^AssignVariableOp_98^AssignVariableOp_99*"
_acd_function_control_output(*
_output_shapes
 "%
identity_145Identity_145:output:0*Ј
_input_shapes•
Ґ: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
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
‘
Х
'__inference_dense_2_layer_call_fn_27745

inputs
unknown:	А@
	unknown_0:@
identityИҐStatefulPartitionedCallё
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_23777s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А: : 22
StatefulPartitionedCallStatefulPartitionedCall:T P
,
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
”
b
F__inference_pooling3d_1_layer_call_and_return_conditional_losses_23523

inputs
identityљ
	MaxPool3D	MaxPool3Dinputs*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€*
ksize	
*
paddingSAME*
strides	
К
IdentityIdentityMaxPool3D:output:0*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€: {
W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
 
_user_specified_nameinputs
ђ
Ѓ
E__inference_sequential_layer_call_and_return_conditional_losses_23896
dense_1_input 
dense_1_23885:	@А
dense_1_23887:	А 
dense_2_23890:	А@
dense_2_23892:@
identityИҐdense_1/StatefulPartitionedCallҐdense_2/StatefulPartitionedCallш
dense_1/StatefulPartitionedCallStatefulPartitionedCalldense_1_inputdense_1_23885dense_1_23887*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_23741Т
dense_2/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0dense_2_23890dense_2_23892*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_23777{
IdentityIdentity(dense_2/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@К
NoOpNoOp ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall:Z V
+
_output_shapes
:€€€€€€€€€@
'
_user_specified_namedense_1_input
Ь
Ч
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_26703

inputs7
$dense_matmul_readvariableop_resource:	А@3
%dense_biasadd_readvariableop_resource:@
identityИҐdense/BiasAdd/ReadVariableOpҐdense/MatMul/ReadVariableOp;
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
valueB:—
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
valueB"€€€€   e
ReshapeReshapeinputsReshape/shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€АБ
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource*
_output_shapes
:	А@*
dtype0
dense/MatMulMatMulReshape:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@~
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0И
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@U
dense/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?z
dense/Gelu/mulMuldense/Gelu/mul/x:output:0dense/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€@V
dense/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?Г
dense/Gelu/truedivRealDivdense/BiasAdd:output:0dense/Gelu/Cast/x:output:0*
T0*'
_output_shapes
:€€€€€€€€€@_
dense/Gelu/ErfErfdense/Gelu/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€@U
dense/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?x
dense/Gelu/addAddV2dense/Gelu/add/x:output:0dense/Gelu/Erf:y:0*
T0*'
_output_shapes
:€€€€€€€€€@q
dense/Gelu/mul_1Muldense/Gelu/mul:z:0dense/Gelu/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€@\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
€€€€€€€€€S
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value	B :@Х
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:Г
	Reshape_1Reshapedense/Gelu/mul_1:z:0Reshape_1/shape:output:0*
T0*4
_output_shapes"
 :€€€€€€€€€€€€€€€€€€@n
IdentityIdentityReshape_1:output:0^NoOp*
T0*4
_output_shapes"
 :€€€€€€€€€€€€€€€€€€@Г
NoOpNoOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:€€€€€€€€€€€€€€€€€€А: : 2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp:] Y
5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
ц
L
0__inference_time_distributed_layer_call_fn_26617

inputs
identity«
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *T
fORM
K__inference_time_distributed_layer_call_and_return_conditional_losses_23577n
IdentityIdentityPartitionedCall:output:0*
T0*5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'€€€€€€€€€€€€€€€€€€А:e a
=
_output_shapes+
):'€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
ђ
Ѓ
E__inference_sequential_layer_call_and_return_conditional_losses_23882
dense_1_input 
dense_1_23871:	@А
dense_1_23873:	А 
dense_2_23876:	А@
dense_2_23878:@
identityИҐdense_1/StatefulPartitionedCallҐdense_2/StatefulPartitionedCallш
dense_1/StatefulPartitionedCallStatefulPartitionedCalldense_1_inputdense_1_23871dense_1_23873*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_23741Т
dense_2/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0dense_2_23876dense_2_23878*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_23777{
IdentityIdentity(dense_2/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@К
NoOpNoOp ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall:Z V
+
_output_shapes
:€€€€€€€€€@
'
_user_specified_namedense_1_input
БE
ў
G__inference_sequential_1_layer_call_and_return_conditional_losses_27625

inputs<
)dense_3_tensordot_readvariableop_resource:	@А6
'dense_3_biasadd_readvariableop_resource:	А<
)dense_4_tensordot_readvariableop_resource:	А@5
'dense_4_biasadd_readvariableop_resource:@
identityИҐdense_3/BiasAdd/ReadVariableOpҐ dense_3/Tensordot/ReadVariableOpҐdense_4/BiasAdd/ReadVariableOpҐ dense_4/Tensordot/ReadVariableOpЛ
 dense_3/Tensordot/ReadVariableOpReadVariableOp)dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : џ
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
value	B : я
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
valueB: Ж
dense_3/Tensordot/ProdProd#dense_3/Tensordot/GatherV2:output:0 dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: М
dense_3/Tensordot/Prod_1Prod%dense_3/Tensordot/GatherV2_1:output:0"dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Љ
dense_3/Tensordot/concatConcatV2dense_3/Tensordot/free:output:0dense_3/Tensordot/axes:output:0&dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:С
dense_3/Tensordot/stackPackdense_3/Tensordot/Prod:output:0!dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Й
dense_3/Tensordot/transpose	Transposeinputs!dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Ґ
dense_3/Tensordot/ReshapeReshapedense_3/Tensordot/transpose:y:0 dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€£
dense_3/Tensordot/MatMulMatMul"dense_3/Tensordot/Reshape:output:0(dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€Аd
dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Аa
dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : «
dense_3/Tensordot/concat_1ConcatV2#dense_3/Tensordot/GatherV2:output:0"dense_3/Tensordot/Const_2:output:0(dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ь
dense_3/TensordotReshape"dense_3/Tensordot/MatMul:product:0#dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АГ
dense_3/BiasAdd/ReadVariableOpReadVariableOp'dense_3_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Х
dense_3/BiasAddBiasAdddense_3/Tensordot:output:0&dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€АW
dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Е
dense_3/Gelu/mulMuldense_3/Gelu/mul/x:output:0dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€АX
dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?О
dense_3/Gelu/truedivRealDivdense_3/BiasAdd:output:0dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аh
dense_3/Gelu/ErfErfdense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€АW
dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Г
dense_3/Gelu/addAddV2dense_3/Gelu/add/x:output:0dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€А|
dense_3/Gelu/mul_1Muldense_3/Gelu/mul:z:0dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€АЛ
 dense_4/Tensordot/ReadVariableOpReadVariableOp)dense_4_tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : џ
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
value	B : я
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
valueB: Ж
dense_4/Tensordot/ProdProd#dense_4/Tensordot/GatherV2:output:0 dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: М
dense_4/Tensordot/Prod_1Prod%dense_4/Tensordot/GatherV2_1:output:0"dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Љ
dense_4/Tensordot/concatConcatV2dense_4/Tensordot/free:output:0dense_4/Tensordot/axes:output:0&dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:С
dense_4/Tensordot/stackPackdense_4/Tensordot/Prod:output:0!dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Ъ
dense_4/Tensordot/transpose	Transposedense_3/Gelu/mul_1:z:0!dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€АҐ
dense_4/Tensordot/ReshapeReshapedense_4/Tensordot/transpose:y:0 dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Ґ
dense_4/Tensordot/MatMulMatMul"dense_4/Tensordot/Reshape:output:0(dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@c
dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@a
dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : «
dense_4/Tensordot/concat_1ConcatV2#dense_4/Tensordot/GatherV2:output:0"dense_4/Tensordot/Const_2:output:0(dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ы
dense_4/TensordotReshape"dense_4/Tensordot/MatMul:product:0#dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@В
dense_4/BiasAdd/ReadVariableOpReadVariableOp'dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Ф
dense_4/BiasAddBiasAdddense_4/Tensordot:output:0&dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@k
IdentityIdentitydense_4/BiasAdd:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@ќ
NoOpNoOp^dense_3/BiasAdd/ReadVariableOp!^dense_3/Tensordot/ReadVariableOp^dense_4/BiasAdd/ReadVariableOp!^dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 2@
dense_3/BiasAdd/ReadVariableOpdense_3/BiasAdd/ReadVariableOp2D
 dense_3/Tensordot/ReadVariableOp dense_3/Tensordot/ReadVariableOp2@
dense_4/BiasAdd/ReadVariableOpdense_4/BiasAdd/ReadVariableOp2D
 dense_4/Tensordot/ReadVariableOp dense_4/Tensordot/ReadVariableOp:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
їЛ
Є
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_24447

inputsX
Bmulti_head_attention_1_query_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_query_add_readvariableop_resource:@V
@multi_head_attention_1_key_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_1_key_add_readvariableop_resource:@X
Bmulti_head_attention_1_value_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_value_add_readvariableop_resource:@c
Mmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource:@@Q
Cmulti_head_attention_1_attention_output_add_readvariableop_resource:@I
6sequential_1_dense_3_tensordot_readvariableop_resource:	@АC
4sequential_1_dense_3_biasadd_readvariableop_resource:	АI
6sequential_1_dense_4_tensordot_readvariableop_resource:	А@B
4sequential_1_dense_4_biasadd_readvariableop_resource:@
identityИҐ:multi_head_attention_1/attention_output/add/ReadVariableOpҐDmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpҐ-multi_head_attention_1/key/add/ReadVariableOpҐ7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpҐ/multi_head_attention_1/query/add/ReadVariableOpҐ9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpҐ/multi_head_attention_1/value/add/ReadVariableOpҐ9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpҐ+sequential_1/dense_3/BiasAdd/ReadVariableOpҐ-sequential_1/dense_3/Tensordot/ReadVariableOpҐ+sequential_1/dense_4/BiasAdd/ReadVariableOpҐ-sequential_1/dense_4/Tensordot/ReadVariableOpј
9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0я
*multi_head_attention_1/query/einsum/EinsumEinsuminputsAmulti_head_attention_1/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde®
/multi_head_attention_1/query/add/ReadVariableOpReadVariableOp8multi_head_attention_1_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0—
 multi_head_attention_1/query/addAddV23multi_head_attention_1/query/einsum/Einsum:output:07multi_head_attention_1/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@Љ
7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_1_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0џ
(multi_head_attention_1/key/einsum/EinsumEinsuminputs?multi_head_attention_1/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde§
-multi_head_attention_1/key/add/ReadVariableOpReadVariableOp6multi_head_attention_1_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ћ
multi_head_attention_1/key/addAddV21multi_head_attention_1/key/einsum/Einsum:output:05multi_head_attention_1/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@ј
9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0я
*multi_head_attention_1/value/einsum/EinsumEinsuminputsAmulti_head_attention_1/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde®
/multi_head_attention_1/value/add/ReadVariableOpReadVariableOp8multi_head_attention_1_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0—
 multi_head_attention_1/value/addAddV23multi_head_attention_1/value/einsum/Einsum:output:07multi_head_attention_1/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@a
multi_head_attention_1/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >®
multi_head_attention_1/MulMul$multi_head_attention_1/query/add:z:0%multi_head_attention_1/Mul/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€@‘
$multi_head_attention_1/einsum/EinsumEinsum"multi_head_attention_1/key/add:z:0multi_head_attention_1/Mul:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€*
equationaecd,abcd->acbeЪ
&multi_head_attention_1/softmax/SoftmaxSoftmax-multi_head_attention_1/einsum/Einsum:output:0*
T0*/
_output_shapes
:€€€€€€€€€Я
'multi_head_attention_1/dropout/IdentityIdentity0multi_head_attention_1/softmax/Softmax:softmax:0*
T0*/
_output_shapes
:€€€€€€€€€к
&multi_head_attention_1/einsum_1/EinsumEinsum0multi_head_attention_1/dropout/Identity:output:0$multi_head_attention_1/value/add:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationacbe,aecd->abcd÷
Dmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpMmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ъ
5multi_head_attention_1/attention_output/einsum/EinsumEinsum/multi_head_attention_1/einsum_1/Einsum:output:0Lmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:€€€€€€€€€@*
equationabcd,cde->abeЇ
:multi_head_attention_1/attention_output/add/ReadVariableOpReadVariableOpCmulti_head_attention_1_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0о
+multi_head_attention_1/attention_output/addAddV2>multi_head_attention_1/attention_output/einsum/Einsum:output:0Bmulti_head_attention_1/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@{
addAddV2inputs/multi_head_attention_1/attention_output/add:z:0*
T0*+
_output_shapes
:€€€€€€€€€@•
-sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : П
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
value	B : У
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
valueB: ≠
#sequential_1/dense_3/Tensordot/ProdProd0sequential_1/dense_3/Tensordot/GatherV2:output:0-sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≥
%sequential_1/dense_3/Tensordot/Prod_1Prod2sequential_1/dense_3/Tensordot/GatherV2_1:output:0/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : р
%sequential_1/dense_3/Tensordot/concatConcatV2,sequential_1/dense_3/Tensordot/free:output:0,sequential_1/dense_3/Tensordot/axes:output:03sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:Є
$sequential_1/dense_3/Tensordot/stackPack,sequential_1/dense_3/Tensordot/Prod:output:0.sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:§
(sequential_1/dense_3/Tensordot/transpose	Transposeadd:z:0.sequential_1/dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@…
&sequential_1/dense_3/Tensordot/ReshapeReshape,sequential_1/dense_3/Tensordot/transpose:y:0-sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€ 
%sequential_1/dense_3/Tensordot/MatMulMatMul/sequential_1/dense_3/Tensordot/Reshape:output:05sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€Аq
&sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Аn
,sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ы
'sequential_1/dense_3/Tensordot/concat_1ConcatV20sequential_1/dense_3/Tensordot/GatherV2:output:0/sequential_1/dense_3/Tensordot/Const_2:output:05sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:√
sequential_1/dense_3/TensordotReshape/sequential_1/dense_3/Tensordot/MatMul:product:00sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АЭ
+sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Љ
sequential_1/dense_3/BiasAddBiasAdd'sequential_1/dense_3/Tensordot:output:03sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€Аd
sequential_1/dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?ђ
sequential_1/dense_3/Gelu/mulMul(sequential_1/dense_3/Gelu/mul/x:output:0%sequential_1/dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аe
 sequential_1/dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?µ
!sequential_1/dense_3/Gelu/truedivRealDiv%sequential_1/dense_3/BiasAdd:output:0)sequential_1/dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€АВ
sequential_1/dense_3/Gelu/ErfErf%sequential_1/dense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аd
sequential_1/dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?™
sequential_1/dense_3/Gelu/addAddV2(sequential_1/dense_3/Gelu/add/x:output:0!sequential_1/dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€А£
sequential_1/dense_3/Gelu/mul_1Mul!sequential_1/dense_3/Gelu/mul:z:0!sequential_1/dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€А•
-sequential_1/dense_4/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_4_tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : П
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
value	B : У
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
valueB: ≠
#sequential_1/dense_4/Tensordot/ProdProd0sequential_1/dense_4/Tensordot/GatherV2:output:0-sequential_1/dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≥
%sequential_1/dense_4/Tensordot/Prod_1Prod2sequential_1/dense_4/Tensordot/GatherV2_1:output:0/sequential_1/dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : р
%sequential_1/dense_4/Tensordot/concatConcatV2,sequential_1/dense_4/Tensordot/free:output:0,sequential_1/dense_4/Tensordot/axes:output:03sequential_1/dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:Є
$sequential_1/dense_4/Tensordot/stackPack,sequential_1/dense_4/Tensordot/Prod:output:0.sequential_1/dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Ѕ
(sequential_1/dense_4/Tensordot/transpose	Transpose#sequential_1/dense_3/Gelu/mul_1:z:0.sequential_1/dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€А…
&sequential_1/dense_4/Tensordot/ReshapeReshape,sequential_1/dense_4/Tensordot/transpose:y:0-sequential_1/dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€…
%sequential_1/dense_4/Tensordot/MatMulMatMul/sequential_1/dense_4/Tensordot/Reshape:output:05sequential_1/dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@p
&sequential_1/dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@n
,sequential_1/dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ы
'sequential_1/dense_4/Tensordot/concat_1ConcatV20sequential_1/dense_4/Tensordot/GatherV2:output:0/sequential_1/dense_4/Tensordot/Const_2:output:05sequential_1/dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:¬
sequential_1/dense_4/TensordotReshape/sequential_1/dense_4/Tensordot/MatMul:product:00sequential_1/dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Ь
+sequential_1/dense_4/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0ї
sequential_1/dense_4/BiasAddBiasAdd'sequential_1/dense_4/Tensordot:output:03sequential_1/dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@t
add_1AddV2add:z:0%sequential_1/dense_4/BiasAdd:output:0*
T0*+
_output_shapes
:€€€€€€€€€@\
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@ћ
NoOpNoOp;^multi_head_attention_1/attention_output/add/ReadVariableOpE^multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp.^multi_head_attention_1/key/add/ReadVariableOp8^multi_head_attention_1/key/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/query/add/ReadVariableOp:^multi_head_attention_1/query/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/value/add/ReadVariableOp:^multi_head_attention_1/value/einsum/Einsum/ReadVariableOp,^sequential_1/dense_3/BiasAdd/ReadVariableOp.^sequential_1/dense_3/Tensordot/ReadVariableOp,^sequential_1/dense_4/BiasAdd/ReadVariableOp.^sequential_1/dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:€€€€€€€€€@: : : : : : : : : : : : 2x
:multi_head_attention_1/attention_output/add/ReadVariableOp:multi_head_attention_1/attention_output/add/ReadVariableOp2М
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
:€€€€€€€€€@
 
_user_specified_nameinputs
Ў"
ы
B__inference_dense_1_layer_call_and_return_conditional_losses_23741

inputs4
!tensordot_readvariableop_resource:	@А.
biasadd_readvariableop_resource:	А
identityИҐBiasAdd/ReadVariableOpҐTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : ї
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
value	B : њ
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
value	B : Ь
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
:€€€€€€€€€@К
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Л
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€А\
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:АY
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : І
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Д
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€АO

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?m
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€АP
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?v
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€АX
Gelu/ErfErfGelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€АO

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?k
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€Аd

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аb
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€Аz
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
√
„
*__inference_sequential_layer_call_fn_23795
dense_1_input
unknown:	@А
	unknown_0:	А
	unknown_1:	А@
	unknown_2:@
identityИҐStatefulPartitionedCallВ
StatefulPartitionedCallStatefulPartitionedCalldense_1_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_23784s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Z V
+
_output_shapes
:€€€€€€€€€@
'
_user_specified_namedense_1_input
’
Ц
'__inference_dense_3_layer_call_fn_27784

inputs
unknown:	@А
	unknown_0:	А
identityИҐStatefulPartitionedCallя
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_23941t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€А`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€@: : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
Ѓ
∞
G__inference_sequential_1_layer_call_and_return_conditional_losses_24082
dense_3_input 
dense_3_24071:	@А
dense_3_24073:	А 
dense_4_24076:	А@
dense_4_24078:@
identityИҐdense_3/StatefulPartitionedCallҐdense_4/StatefulPartitionedCallш
dense_3/StatefulPartitionedCallStatefulPartitionedCalldense_3_inputdense_3_24071dense_3_24073*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_23941Т
dense_4/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0dense_4_24076dense_4_24078*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_23977{
IdentityIdentity(dense_4/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@К
NoOpNoOp ^dense_3/StatefulPartitionedCall ^dense_4/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall:Z V
+
_output_shapes
:€€€€€€€€€@
'
_user_specified_namedense_3_input
≤
“
,__inference_sequential_1_layer_call_fn_27561

inputs
unknown:	@А
	unknown_0:	А
	unknown_1:	А@
	unknown_2:@
identityИҐStatefulPartitionedCallэ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *P
fKRI
G__inference_sequential_1_layer_call_and_return_conditional_losses_24044s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
е
G
+__inference_pooling3d_1_layer_call_fn_27318

inputs
identityд
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *O
fJRH
F__inference_pooling3d_1_layer_call_and_return_conditional_losses_23523Р
IdentityIdentityPartitionedCall:output:0*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€: {
W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
 
_user_specified_nameinputs
ќ
ъ
B__inference_dense_2_layer_call_and_return_conditional_losses_27775

inputs4
!tensordot_readvariableop_resource:	А@-
biasadd_readvariableop_resource:@
identityИҐBiasAdd/ReadVariableOpҐTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : ї
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
value	B : њ
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
value	B : Ь
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
:€€€€€€€€€АК
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€К
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@[
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : І
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Г
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0|
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@c
IdentityIdentityBiasAdd:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
Ю

у
B__inference_dense_6_layer_call_and_return_conditional_losses_24516

inputs0
matmul_readvariableop_resource:@
-
biasadd_readvariableop_resource:

identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@
*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:
*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€
V
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€
`
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
Ѓ
–
*__inference_sequential_layer_call_fn_27394

inputs
unknown:	@А
	unknown_0:	А
	unknown_1:	А@
	unknown_2:@
identityИҐStatefulPartitionedCallы
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_23784s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
п
g
K__inference_time_distributed_layer_call_and_return_conditional_losses_23604

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
valueB:—
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
valueB"€€€€      А   m
ReshapeReshapeinputsReshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€А√
flatten/PartitionedCallPartitionedCallReshape:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_flatten_layer_call_and_return_conditional_losses_23570\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
€€€€€€€€€T
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value
B :АХ
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:Р
	Reshape_1Reshape flatten/PartitionedCall:output:0Reshape_1/shape:output:0*
T0*5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€Аh
IdentityIdentityReshape_1:output:0*
T0*5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'€€€€€€€€€€€€€€€€€€А:e a
=
_output_shapes+
):'€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
С
«
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_23689

inputs
dense_23679:	А@
dense_23681:@
identityИҐdense/StatefulPartitionedCall;
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
valueB:—
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
valueB"€€€€   e
ReshapeReshapeinputsReshape/shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€Ао
dense/StatefulPartitionedCallStatefulPartitionedCallReshape:output:0dense_23679dense_23681*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_dense_layer_call_and_return_conditional_losses_23639\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
€€€€€€€€€S
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value	B :@Х
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:Х
	Reshape_1Reshape&dense/StatefulPartitionedCall:output:0Reshape_1/shape:output:0*
T0*4
_output_shapes"
 :€€€€€€€€€€€€€€€€€€@n
IdentityIdentityReshape_1:output:0^NoOp*
T0*4
_output_shapes"
 :€€€€€€€€€€€€€€€€€€@f
NoOpNoOp^dense/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:€€€€€€€€€€€€€€€€€€А: : 2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall:] Y
5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
ќ
ъ
B__inference_dense_4_layer_call_and_return_conditional_losses_23977

inputs4
!tensordot_readvariableop_resource:	А@-
biasadd_readvariableop_resource:@
identityИҐBiasAdd/ReadVariableOpҐTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : ї
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
value	B : њ
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
value	B : Ь
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
:€€€€€€€€€АК
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€К
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@[
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@Y
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : І
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Г
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0|
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@c
IdentityIdentityBiasAdd:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@z
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*/
_input_shapes
:€€€€€€€€€А: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:T P
,
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
ƒ
Х
'__inference_dense_5_layer_call_fn_27275

inputs
unknown:	А
@
	unknown_0:@
identityИҐStatefulPartitionedCallЏ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_24499o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:€€€€€€€€€А
: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€А

 
_user_specified_nameinputs
№
√
S__inference_frame_position_embedding_layer_call_and_return_conditional_losses_24225

inputs2
 embedding_embedding_lookup_24218:@
identityИҐembedding/embedding_lookup;
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
valueB:—
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
:–
embedding/embedding_lookupResourceGather embedding_embedding_lookup_24218range:output:0*
Tindices0*3
_class)
'%loc:@embedding/embedding_lookup/24218*
_output_shapes

:@*
dtype0≤
#embedding/embedding_lookup/IdentityIdentity#embedding/embedding_lookup:output:0*
T0*3
_class)
'%loc:@embedding/embedding_lookup/24218*
_output_shapes

:@И
%embedding/embedding_lookup/Identity_1Identity,embedding/embedding_lookup/Identity:output:0*
T0*
_output_shapes

:@z
addAddV2inputs.embedding/embedding_lookup/Identity_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Z
IdentityIdentityadd:z:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@c
NoOpNoOp^embedding/embedding_lookup*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*,
_input_shapes
:€€€€€€€€€@: 28
embedding/embedding_lookupembedding/embedding_lookup:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
ЗE
х
@__inference_model_layer_call_and_return_conditional_losses_25491
input_1-
encoder3d_25387:
encoder3d_25389:-
encoder3d_25391: 
encoder3d_25393: -
encoder3d_25395:  
encoder3d_25397: -
encoder3d_25399: @
encoder3d_25401:@-
encoder3d_25403:@@
encoder3d_25405:@.
encoder3d_25407:@А
encoder3d_25409:	А/
encoder3d_25411:АА
encoder3d_25413:	А+
time_distributed_1_25419:	А@&
time_distributed_1_25421:@0
frame_position_embedding_25426:@/
transformer_layer_1_25429:@@+
transformer_layer_1_25431:@/
transformer_layer_1_25433:@@+
transformer_layer_1_25435:@/
transformer_layer_1_25437:@@+
transformer_layer_1_25439:@/
transformer_layer_1_25441:@@'
transformer_layer_1_25443:@,
transformer_layer_1_25445:	@А(
transformer_layer_1_25447:	А,
transformer_layer_1_25449:	А@'
transformer_layer_1_25451:@/
transformer_layer_2_25454:@@+
transformer_layer_2_25456:@/
transformer_layer_2_25458:@@+
transformer_layer_2_25460:@/
transformer_layer_2_25462:@@+
transformer_layer_2_25464:@/
transformer_layer_2_25466:@@'
transformer_layer_2_25468:@,
transformer_layer_2_25470:	@А(
transformer_layer_2_25472:	А,
transformer_layer_2_25474:	А@'
transformer_layer_2_25476:@ 
dense_5_25480:	А
@
dense_5_25482:@
dense_6_25485:@

dense_6_25487:

identityИҐdense_5/StatefulPartitionedCallҐdense_6/StatefulPartitionedCallҐ!encoder3d/StatefulPartitionedCallҐ0frame_position_embedding/StatefulPartitionedCallҐ*time_distributed_1/StatefulPartitionedCallҐ+transformer_layer_1/StatefulPartitionedCallҐ+transformer_layer_2/StatefulPartitionedCallж
!encoder3d/StatefulPartitionedCallStatefulPartitionedCallinput_1encoder3d_25387encoder3d_25389encoder3d_25391encoder3d_25393encoder3d_25395encoder3d_25397encoder3d_25399encoder3d_25401encoder3d_25403encoder3d_25405encoder3d_25407encoder3d_25409encoder3d_25411encoder3d_25413*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :€€€€€€€€€А*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_encoder3d_layer_call_and_return_conditional_losses_24167у
 time_distributed/PartitionedCallPartitionedCall*encoder3d/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *T
fORM
K__inference_time_distributed_layer_call_and_return_conditional_losses_23577w
time_distributed/Reshape/shapeConst*
_output_shapes
:*
dtype0*%
valueB"€€€€      А   ≥
time_distributed/ReshapeReshape*encoder3d/StatefulPartitionedCall:output:0'time_distributed/Reshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€Ањ
*time_distributed_1/StatefulPartitionedCallStatefulPartitionedCall)time_distributed/PartitionedCall:output:0time_distributed_1_25419time_distributed_1_25421*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *V
fQRO
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_23650q
 time_distributed_1/Reshape/shapeConst*
_output_shapes
:*
dtype0*
valueB"€€€€   Ѓ
time_distributed_1/ReshapeReshape)time_distributed/PartitionedCall:output:0)time_distributed_1/Reshape/shape:output:0*
T0*(
_output_shapes
:€€€€€€€€€Ањ
0frame_position_embedding/StatefulPartitionedCallStatefulPartitionedCall3time_distributed_1/StatefulPartitionedCall:output:0frame_position_embedding_25426*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *\
fWRU
S__inference_frame_position_embedding_layer_call_and_return_conditional_losses_24225х
+transformer_layer_1/StatefulPartitionedCallStatefulPartitionedCall9frame_position_embedding/StatefulPartitionedCall:output:0transformer_layer_1_25429transformer_layer_1_25431transformer_layer_1_25433transformer_layer_1_25435transformer_layer_1_25437transformer_layer_1_25439transformer_layer_1_25441transformer_layer_1_25443transformer_layer_1_25445transformer_layer_1_25447transformer_layer_1_25449transformer_layer_1_25451*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_24325р
+transformer_layer_2/StatefulPartitionedCallStatefulPartitionedCall4transformer_layer_1/StatefulPartitionedCall:output:0transformer_layer_2_25454transformer_layer_2_25456transformer_layer_2_25458transformer_layer_2_25460transformer_layer_2_25462transformer_layer_2_25464transformer_layer_2_25466transformer_layer_2_25468transformer_layer_2_25470transformer_layer_2_25472transformer_layer_2_25474transformer_layer_2_25476*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_24447л
flatten_1/PartitionedCallPartitionedCall4transformer_layer_2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А
* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_flatten_1_layer_call_and_return_conditional_losses_24479И
dense_5/StatefulPartitionedCallStatefulPartitionedCall"flatten_1/PartitionedCall:output:0dense_5_25480dense_5_25482*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_24499О
dense_6/StatefulPartitionedCallStatefulPartitionedCall(dense_5/StatefulPartitionedCall:output:0dense_6_25485dense_6_25487*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_6_layer_call_and_return_conditional_losses_24516w
IdentityIdentity(dense_6/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
к
NoOpNoOp ^dense_5/StatefulPartitionedCall ^dense_6/StatefulPartitionedCall"^encoder3d/StatefulPartitionedCall1^frame_position_embedding/StatefulPartitionedCall+^time_distributed_1/StatefulPartitionedCall,^transformer_layer_1/StatefulPartitionedCall,^transformer_layer_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*М
_input_shapes{
y:€€€€€€€€€(: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2B
dense_6/StatefulPartitionedCalldense_6/StatefulPartitionedCall2F
!encoder3d/StatefulPartitionedCall!encoder3d/StatefulPartitionedCall2d
0frame_position_embedding/StatefulPartitionedCall0frame_position_embedding/StatefulPartitionedCall2X
*time_distributed_1/StatefulPartitionedCall*time_distributed_1/StatefulPartitionedCall2Z
+transformer_layer_1/StatefulPartitionedCall+transformer_layer_1/StatefulPartitionedCall2Z
+transformer_layer_2/StatefulPartitionedCall+transformer_layer_2/StatefulPartitionedCall:\ X
3
_output_shapes!
:€€€€€€€€€(
!
_user_specified_name	input_1
ќ
ґ
)__inference_encoder3d_layer_call_fn_26548

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
	unknown_9:@А

unknown_10:	А*

unknown_11:АА

unknown_12:	А
identityИҐStatefulPartitionedCallИ
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
 :€€€€€€€€€А*0
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *M
fHRF
D__inference_encoder3d_layer_call_and_return_conditional_losses_24167|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :€€€€€€€€€А`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:€€€€€€€€€(: : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
3
_output_shapes!
:€€€€€€€€€(
 
_user_specified_nameinputs
∆
ў
%__inference_model_layer_call_fn_24616
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
	unknown_9:@А

unknown_10:	А*

unknown_11:АА

unknown_12:	А

unknown_13:	А@

unknown_14:@

unknown_15:@ 

unknown_16:@@

unknown_17:@ 

unknown_18:@@

unknown_19:@ 

unknown_20:@@

unknown_21:@ 

unknown_22:@@

unknown_23:@

unknown_24:	@А

unknown_25:	А

unknown_26:	А@

unknown_27:@ 

unknown_28:@@

unknown_29:@ 

unknown_30:@@

unknown_31:@ 

unknown_32:@@

unknown_33:@ 

unknown_34:@@

unknown_35:@

unknown_36:	@А

unknown_37:	А

unknown_38:	А@

unknown_39:@

unknown_40:	А
@

unknown_41:@

unknown_42:@


unknown_43:

identityИҐStatefulPartitionedCall™
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
:€€€€€€€€€
*O
_read_only_resource_inputs1
/-	
 !"#$%&'()*+,-*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_24523o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*М
_input_shapes{
y:€€€€€€€€€(: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
3
_output_shapes!
:€€€€€€€€€(
!
_user_specified_name	input_1
ёЗ
И
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_26911

inputsV
@multi_head_attention_query_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_query_add_readvariableop_resource:@T
>multi_head_attention_key_einsum_einsum_readvariableop_resource:@@F
4multi_head_attention_key_add_readvariableop_resource:@V
@multi_head_attention_value_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_value_add_readvariableop_resource:@a
Kmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource:@@O
Amulti_head_attention_attention_output_add_readvariableop_resource:@G
4sequential_dense_1_tensordot_readvariableop_resource:	@АA
2sequential_dense_1_biasadd_readvariableop_resource:	АG
4sequential_dense_2_tensordot_readvariableop_resource:	А@@
2sequential_dense_2_biasadd_readvariableop_resource:@
identityИҐ8multi_head_attention/attention_output/add/ReadVariableOpҐBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpҐ+multi_head_attention/key/add/ReadVariableOpҐ5multi_head_attention/key/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/query/add/ReadVariableOpҐ7multi_head_attention/query/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/value/add/ReadVariableOpҐ7multi_head_attention/value/einsum/Einsum/ReadVariableOpҐ)sequential/dense_1/BiasAdd/ReadVariableOpҐ+sequential/dense_1/Tensordot/ReadVariableOpҐ)sequential/dense_2/BiasAdd/ReadVariableOpҐ+sequential/dense_2/Tensordot/ReadVariableOpЉ
7multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0џ
(multi_head_attention/query/einsum/EinsumEinsuminputs?multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde§
-multi_head_attention/query/add/ReadVariableOpReadVariableOp6multi_head_attention_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ћ
multi_head_attention/query/addAddV21multi_head_attention/query/einsum/Einsum:output:05multi_head_attention/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@Є
5multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOp>multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0„
&multi_head_attention/key/einsum/EinsumEinsuminputs=multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde†
+multi_head_attention/key/add/ReadVariableOpReadVariableOp4multi_head_attention_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0≈
multi_head_attention/key/addAddV2/multi_head_attention/key/einsum/Einsum:output:03multi_head_attention/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@Љ
7multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0џ
(multi_head_attention/value/einsum/EinsumEinsuminputs?multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde§
-multi_head_attention/value/add/ReadVariableOpReadVariableOp6multi_head_attention_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ћ
multi_head_attention/value/addAddV21multi_head_attention/value/einsum/Einsum:output:05multi_head_attention/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@_
multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >Ґ
multi_head_attention/MulMul"multi_head_attention/query/add:z:0#multi_head_attention/Mul/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€@ќ
"multi_head_attention/einsum/EinsumEinsum multi_head_attention/key/add:z:0multi_head_attention/Mul:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€*
equationaecd,abcd->acbeЦ
$multi_head_attention/softmax/SoftmaxSoftmax+multi_head_attention/einsum/Einsum:output:0*
T0*/
_output_shapes
:€€€€€€€€€Ы
%multi_head_attention/dropout/IdentityIdentity.multi_head_attention/softmax/Softmax:softmax:0*
T0*/
_output_shapes
:€€€€€€€€€д
$multi_head_attention/einsum_1/EinsumEinsum.multi_head_attention/dropout/Identity:output:0"multi_head_attention/value/add:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationacbe,aecd->abcd“
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpKmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ф
3multi_head_attention/attention_output/einsum/EinsumEinsum-multi_head_attention/einsum_1/Einsum:output:0Jmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:€€€€€€€€€@*
equationabcd,cde->abeґ
8multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpAmulti_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0и
)multi_head_attention/attention_output/addAddV2<multi_head_attention/attention_output/einsum/Einsum:output:0@multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@y
addAddV2inputs-multi_head_attention/attention_output/add:z:0*
T0*+
_output_shapes
:€€€€€€€€€@°
+sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : З
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
value	B : Л
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
valueB: І
!sequential/dense_1/Tensordot/ProdProd.sequential/dense_1/Tensordot/GatherV2:output:0+sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≠
#sequential/dense_1/Tensordot/Prod_1Prod0sequential/dense_1/Tensordot/GatherV2_1:output:0-sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : и
#sequential/dense_1/Tensordot/concatConcatV2*sequential/dense_1/Tensordot/free:output:0*sequential/dense_1/Tensordot/axes:output:01sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:≤
"sequential/dense_1/Tensordot/stackPack*sequential/dense_1/Tensordot/Prod:output:0,sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:†
&sequential/dense_1/Tensordot/transpose	Transposeadd:z:0,sequential/dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@√
$sequential/dense_1/Tensordot/ReshapeReshape*sequential/dense_1/Tensordot/transpose:y:0+sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€ƒ
#sequential/dense_1/Tensordot/MatMulMatMul-sequential/dense_1/Tensordot/Reshape:output:03sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€Аo
$sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Аl
*sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : у
%sequential/dense_1/Tensordot/concat_1ConcatV2.sequential/dense_1/Tensordot/GatherV2:output:0-sequential/dense_1/Tensordot/Const_2:output:03sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:љ
sequential/dense_1/TensordotReshape-sequential/dense_1/Tensordot/MatMul:product:0.sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АЩ
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0ґ
sequential/dense_1/BiasAddBiasAdd%sequential/dense_1/Tensordot:output:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€Аb
sequential/dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?¶
sequential/dense_1/Gelu/mulMul&sequential/dense_1/Gelu/mul/x:output:0#sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аc
sequential/dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?ѓ
sequential/dense_1/Gelu/truedivRealDiv#sequential/dense_1/BiasAdd:output:0'sequential/dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€А~
sequential/dense_1/Gelu/ErfErf#sequential/dense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аb
sequential/dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?§
sequential/dense_1/Gelu/addAddV2&sequential/dense_1/Gelu/add/x:output:0sequential/dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€АЭ
sequential/dense_1/Gelu/mul_1Mulsequential/dense_1/Gelu/mul:z:0sequential/dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€А°
+sequential/dense_2/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_2_tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : З
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
value	B : Л
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
valueB: І
!sequential/dense_2/Tensordot/ProdProd.sequential/dense_2/Tensordot/GatherV2:output:0+sequential/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≠
#sequential/dense_2/Tensordot/Prod_1Prod0sequential/dense_2/Tensordot/GatherV2_1:output:0-sequential/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : и
#sequential/dense_2/Tensordot/concatConcatV2*sequential/dense_2/Tensordot/free:output:0*sequential/dense_2/Tensordot/axes:output:01sequential/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:≤
"sequential/dense_2/Tensordot/stackPack*sequential/dense_2/Tensordot/Prod:output:0,sequential/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:ї
&sequential/dense_2/Tensordot/transpose	Transpose!sequential/dense_1/Gelu/mul_1:z:0,sequential/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€А√
$sequential/dense_2/Tensordot/ReshapeReshape*sequential/dense_2/Tensordot/transpose:y:0+sequential/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€√
#sequential/dense_2/Tensordot/MatMulMatMul-sequential/dense_2/Tensordot/Reshape:output:03sequential/dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@n
$sequential/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@l
*sequential/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : у
%sequential/dense_2/Tensordot/concat_1ConcatV2.sequential/dense_2/Tensordot/GatherV2:output:0-sequential/dense_2/Tensordot/Const_2:output:03sequential/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Љ
sequential/dense_2/TensordotReshape-sequential/dense_2/Tensordot/MatMul:product:0.sequential/dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Ш
)sequential/dense_2/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0µ
sequential/dense_2/BiasAddBiasAdd%sequential/dense_2/Tensordot:output:01sequential/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@r
add_1AddV2add:z:0#sequential/dense_2/BiasAdd:output:0*
T0*+
_output_shapes
:€€€€€€€€€@\
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@і
NoOpNoOp9^multi_head_attention/attention_output/add/ReadVariableOpC^multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp,^multi_head_attention/key/add/ReadVariableOp6^multi_head_attention/key/einsum/Einsum/ReadVariableOp.^multi_head_attention/query/add/ReadVariableOp8^multi_head_attention/query/einsum/Einsum/ReadVariableOp.^multi_head_attention/value/add/ReadVariableOp8^multi_head_attention/value/einsum/Einsum/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp,^sequential/dense_1/Tensordot/ReadVariableOp*^sequential/dense_2/BiasAdd/ReadVariableOp,^sequential/dense_2/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:€€€€€€€€€@: : : : : : : : : : : : 2t
8multi_head_attention/attention_output/add/ReadVariableOp8multi_head_attention/attention_output/add/ReadVariableOp2И
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
:€€€€€€€€€@
 
_user_specified_nameinputs
Ў"
ы
B__inference_dense_1_layer_call_and_return_conditional_losses_27736

inputs4
!tensordot_readvariableop_resource:	@А.
biasadd_readvariableop_resource:	А
identityИҐBiasAdd/ReadVariableOpҐTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : ї
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
value	B : њ
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
value	B : Ь
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
:€€€€€€€€€@К
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Л
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€А\
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:АY
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : І
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Д
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€АO

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?m
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€АP
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?v
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€АX
Gelu/ErfErfGelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€АO

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?k
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€Аd

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аb
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€Аz
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
О
†
2__inference_time_distributed_1_layer_call_fn_26674

inputs
unknown:	А@
	unknown_0:@
identityИҐStatefulPartitionedCallт
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *4
_output_shapes"
 :€€€€€€€€€€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *V
fQRO
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_23689|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*4
_output_shapes"
 :€€€€€€€€€€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*8
_input_shapes'
%:€€€€€€€€€€€€€€€€€€А: : 22
StatefulPartitionedCallStatefulPartitionedCall:] Y
5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
¬є
бW
__inference__traced_save_28316
file_prefix-
)savev2_dense_5_kernel_read_readvariableop+
'savev2_dense_5_bias_read_readvariableop-
)savev2_dense_6_kernel_read_readvariableop+
'savev2_dense_6_bias_read_readvariableopb
^savev2_encoder3d_spatial_attention_spatial_attention_attention_conv_kernel_read_readvariableop`
\savev2_encoder3d_spatial_attention_spatial_attention_attention_conv_bias_read_readvariableopR
Nsavev2_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_kernel_read_readvariableopP
Lsavev2_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_bias_read_readvariableopS
Osavev2_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_kernel_read_readvariableopQ
Msavev2_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_bias_read_readvariableopT
Psavev2_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_kernel_read_readvariableopR
Nsavev2_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_bias_read_readvariableopU
Qsavev2_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_kernel_read_readvariableopS
Osavev2_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_bias_read_readvariableopT
Psavev2_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_kernel_read_readvariableopR
Nsavev2_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_bias_read_readvariableopU
Qsavev2_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_kernel_read_readvariableopS
Osavev2_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_bias_read_readvariableop8
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
.savev2_adam_dense_6_bias_m_read_readvariableopi
esavev2_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_kernel_m_read_readvariableopg
csavev2_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_bias_m_read_readvariableopY
Usavev2_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_kernel_m_read_readvariableopW
Ssavev2_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_bias_m_read_readvariableopZ
Vsavev2_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_kernel_m_read_readvariableopX
Tsavev2_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_bias_m_read_readvariableop[
Wsavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_kernel_m_read_readvariableopY
Usavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_bias_m_read_readvariableop\
Xsavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_kernel_m_read_readvariableopZ
Vsavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_bias_m_read_readvariableop[
Wsavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_kernel_m_read_readvariableopY
Usavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_bias_m_read_readvariableop\
Xsavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_kernel_m_read_readvariableopZ
Vsavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_bias_m_read_readvariableop?
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
.savev2_adam_dense_6_bias_v_read_readvariableopi
esavev2_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_kernel_v_read_readvariableopg
csavev2_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_bias_v_read_readvariableopY
Usavev2_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_kernel_v_read_readvariableopW
Ssavev2_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_bias_v_read_readvariableopZ
Vsavev2_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_kernel_v_read_readvariableopX
Tsavev2_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_bias_v_read_readvariableop[
Wsavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_kernel_v_read_readvariableopY
Usavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_bias_v_read_readvariableop\
Xsavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_kernel_v_read_readvariableopZ
Vsavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_bias_v_read_readvariableop[
Wsavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_kernel_v_read_readvariableopY
Usavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_bias_v_read_readvariableop\
Xsavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_kernel_v_read_readvariableopZ
Vsavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_bias_v_read_readvariableop?
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

identity_1ИҐMergeV2Checkpointsw
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
_temp/partБ
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
value	B : У
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
:  D
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes	
:С*
dtype0*тC
valueиCBеCСB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB'variables/10/.ATTRIBUTES/VARIABLE_VALUEB'variables/11/.ATTRIBUTES/VARIABLE_VALUEB'variables/12/.ATTRIBUTES/VARIABLE_VALUEB'variables/13/.ATTRIBUTES/VARIABLE_VALUEB'variables/14/.ATTRIBUTES/VARIABLE_VALUEB'variables/15/.ATTRIBUTES/VARIABLE_VALUEB'variables/16/.ATTRIBUTES/VARIABLE_VALUEB'variables/17/.ATTRIBUTES/VARIABLE_VALUEB'variables/18/.ATTRIBUTES/VARIABLE_VALUEB'variables/19/.ATTRIBUTES/VARIABLE_VALUEB'variables/20/.ATTRIBUTES/VARIABLE_VALUEB'variables/21/.ATTRIBUTES/VARIABLE_VALUEB'variables/22/.ATTRIBUTES/VARIABLE_VALUEB'variables/23/.ATTRIBUTES/VARIABLE_VALUEB'variables/24/.ATTRIBUTES/VARIABLE_VALUEB'variables/25/.ATTRIBUTES/VARIABLE_VALUEB'variables/26/.ATTRIBUTES/VARIABLE_VALUEB'variables/27/.ATTRIBUTES/VARIABLE_VALUEB'variables/28/.ATTRIBUTES/VARIABLE_VALUEB'variables/29/.ATTRIBUTES/VARIABLE_VALUEB'variables/30/.ATTRIBUTES/VARIABLE_VALUEB'variables/31/.ATTRIBUTES/VARIABLE_VALUEB'variables/32/.ATTRIBUTES/VARIABLE_VALUEB'variables/33/.ATTRIBUTES/VARIABLE_VALUEB'variables/34/.ATTRIBUTES/VARIABLE_VALUEB'variables/35/.ATTRIBUTES/VARIABLE_VALUEB'variables/36/.ATTRIBUTES/VARIABLE_VALUEB'variables/37/.ATTRIBUTES/VARIABLE_VALUEB'variables/38/.ATTRIBUTES/VARIABLE_VALUEB'variables/39/.ATTRIBUTES/VARIABLE_VALUEB'variables/40/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/6/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/7/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/8/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBBvariables/9/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/10/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/11/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/12/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/13/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/14/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/15/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/16/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/17/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/18/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/19/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/20/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/21/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/22/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/23/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/24/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/25/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/26/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/27/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/28/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/29/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/30/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/31/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/32/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/33/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/34/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/35/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/36/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/37/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/38/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/39/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBCvariables/40/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/0/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/1/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/2/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/3/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/4/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/5/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/6/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/7/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/8/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBBvariables/9/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/10/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/11/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/12/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/13/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/14/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/15/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/16/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/17/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/18/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/19/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/20/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/21/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/22/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/23/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/24/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/25/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/26/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/27/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/28/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/29/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/30/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/31/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/32/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/33/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/34/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/35/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/36/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/37/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/38/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/39/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBCvariables/40/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHФ
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes	
:С*
dtype0*Є
valueЃBЂСB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B ъT
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0)savev2_dense_5_kernel_read_readvariableop'savev2_dense_5_bias_read_readvariableop)savev2_dense_6_kernel_read_readvariableop'savev2_dense_6_bias_read_readvariableop^savev2_encoder3d_spatial_attention_spatial_attention_attention_conv_kernel_read_readvariableop\savev2_encoder3d_spatial_attention_spatial_attention_attention_conv_bias_read_readvariableopNsavev2_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_kernel_read_readvariableopLsavev2_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_bias_read_readvariableopOsavev2_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_kernel_read_readvariableopMsavev2_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_bias_read_readvariableopPsavev2_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_kernel_read_readvariableopNsavev2_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_bias_read_readvariableopQsavev2_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_kernel_read_readvariableopOsavev2_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_bias_read_readvariableopPsavev2_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_kernel_read_readvariableopNsavev2_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_bias_read_readvariableopQsavev2_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_kernel_read_readvariableopOsavev2_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_bias_read_readvariableop4savev2_time_distributed_1_kernel_read_readvariableop2savev2_time_distributed_1_bias_read_readvariableopHsavev2_frame_position_embedding_embedding_embeddings_read_readvariableopPsavev2_transformer_layer_1_multi_head_attention_query_kernel_read_readvariableopNsavev2_transformer_layer_1_multi_head_attention_query_bias_read_readvariableopNsavev2_transformer_layer_1_multi_head_attention_key_kernel_read_readvariableopLsavev2_transformer_layer_1_multi_head_attention_key_bias_read_readvariableopPsavev2_transformer_layer_1_multi_head_attention_value_kernel_read_readvariableopNsavev2_transformer_layer_1_multi_head_attention_value_bias_read_readvariableop[savev2_transformer_layer_1_multi_head_attention_attention_output_kernel_read_readvariableopYsavev2_transformer_layer_1_multi_head_attention_attention_output_bias_read_readvariableop)savev2_dense_1_kernel_read_readvariableop'savev2_dense_1_bias_read_readvariableop)savev2_dense_2_kernel_read_readvariableop'savev2_dense_2_bias_read_readvariableopRsavev2_transformer_layer_2_multi_head_attention_1_query_kernel_read_readvariableopPsavev2_transformer_layer_2_multi_head_attention_1_query_bias_read_readvariableopPsavev2_transformer_layer_2_multi_head_attention_1_key_kernel_read_readvariableopNsavev2_transformer_layer_2_multi_head_attention_1_key_bias_read_readvariableopRsavev2_transformer_layer_2_multi_head_attention_1_value_kernel_read_readvariableopPsavev2_transformer_layer_2_multi_head_attention_1_value_bias_read_readvariableop]savev2_transformer_layer_2_multi_head_attention_1_attention_output_kernel_read_readvariableop[savev2_transformer_layer_2_multi_head_attention_1_attention_output_bias_read_readvariableop)savev2_dense_3_kernel_read_readvariableop'savev2_dense_3_bias_read_readvariableop)savev2_dense_4_kernel_read_readvariableop'savev2_dense_4_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop0savev2_adam_dense_5_kernel_m_read_readvariableop.savev2_adam_dense_5_bias_m_read_readvariableop0savev2_adam_dense_6_kernel_m_read_readvariableop.savev2_adam_dense_6_bias_m_read_readvariableopesavev2_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_kernel_m_read_readvariableopcsavev2_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_bias_m_read_readvariableopUsavev2_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_kernel_m_read_readvariableopSsavev2_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_bias_m_read_readvariableopVsavev2_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_kernel_m_read_readvariableopTsavev2_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_bias_m_read_readvariableopWsavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_kernel_m_read_readvariableopUsavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_bias_m_read_readvariableopXsavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_kernel_m_read_readvariableopVsavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_bias_m_read_readvariableopWsavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_kernel_m_read_readvariableopUsavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_bias_m_read_readvariableopXsavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_kernel_m_read_readvariableopVsavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_bias_m_read_readvariableop;savev2_adam_time_distributed_1_kernel_m_read_readvariableop9savev2_adam_time_distributed_1_bias_m_read_readvariableopOsavev2_adam_frame_position_embedding_embedding_embeddings_m_read_readvariableopWsavev2_adam_transformer_layer_1_multi_head_attention_query_kernel_m_read_readvariableopUsavev2_adam_transformer_layer_1_multi_head_attention_query_bias_m_read_readvariableopUsavev2_adam_transformer_layer_1_multi_head_attention_key_kernel_m_read_readvariableopSsavev2_adam_transformer_layer_1_multi_head_attention_key_bias_m_read_readvariableopWsavev2_adam_transformer_layer_1_multi_head_attention_value_kernel_m_read_readvariableopUsavev2_adam_transformer_layer_1_multi_head_attention_value_bias_m_read_readvariableopbsavev2_adam_transformer_layer_1_multi_head_attention_attention_output_kernel_m_read_readvariableop`savev2_adam_transformer_layer_1_multi_head_attention_attention_output_bias_m_read_readvariableop0savev2_adam_dense_1_kernel_m_read_readvariableop.savev2_adam_dense_1_bias_m_read_readvariableop0savev2_adam_dense_2_kernel_m_read_readvariableop.savev2_adam_dense_2_bias_m_read_readvariableopYsavev2_adam_transformer_layer_2_multi_head_attention_1_query_kernel_m_read_readvariableopWsavev2_adam_transformer_layer_2_multi_head_attention_1_query_bias_m_read_readvariableopWsavev2_adam_transformer_layer_2_multi_head_attention_1_key_kernel_m_read_readvariableopUsavev2_adam_transformer_layer_2_multi_head_attention_1_key_bias_m_read_readvariableopYsavev2_adam_transformer_layer_2_multi_head_attention_1_value_kernel_m_read_readvariableopWsavev2_adam_transformer_layer_2_multi_head_attention_1_value_bias_m_read_readvariableopdsavev2_adam_transformer_layer_2_multi_head_attention_1_attention_output_kernel_m_read_readvariableopbsavev2_adam_transformer_layer_2_multi_head_attention_1_attention_output_bias_m_read_readvariableop0savev2_adam_dense_3_kernel_m_read_readvariableop.savev2_adam_dense_3_bias_m_read_readvariableop0savev2_adam_dense_4_kernel_m_read_readvariableop.savev2_adam_dense_4_bias_m_read_readvariableop0savev2_adam_dense_5_kernel_v_read_readvariableop.savev2_adam_dense_5_bias_v_read_readvariableop0savev2_adam_dense_6_kernel_v_read_readvariableop.savev2_adam_dense_6_bias_v_read_readvariableopesavev2_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_kernel_v_read_readvariableopcsavev2_adam_encoder3d_spatial_attention_spatial_attention_attention_conv_bias_v_read_readvariableopUsavev2_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_kernel_v_read_readvariableopSsavev2_adam_encoder3d_conv2_plus1d_conv3d_1_spatial_conv_bias_v_read_readvariableopVsavev2_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_kernel_v_read_readvariableopTsavev2_adam_encoder3d_conv2_plus1d_conv3d_1_temporal_conv_bias_v_read_readvariableopWsavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_kernel_v_read_readvariableopUsavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_spatial_conv_bias_v_read_readvariableopXsavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_kernel_v_read_readvariableopVsavev2_adam_encoder3d_conv2_plus1d_1_conv3d_2_temporal_conv_bias_v_read_readvariableopWsavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_kernel_v_read_readvariableopUsavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_spatial_conv_bias_v_read_readvariableopXsavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_kernel_v_read_readvariableopVsavev2_adam_encoder3d_conv2_plus1d_2_conv3d_3_temporal_conv_bias_v_read_readvariableop;savev2_adam_time_distributed_1_kernel_v_read_readvariableop9savev2_adam_time_distributed_1_bias_v_read_readvariableopOsavev2_adam_frame_position_embedding_embedding_embeddings_v_read_readvariableopWsavev2_adam_transformer_layer_1_multi_head_attention_query_kernel_v_read_readvariableopUsavev2_adam_transformer_layer_1_multi_head_attention_query_bias_v_read_readvariableopUsavev2_adam_transformer_layer_1_multi_head_attention_key_kernel_v_read_readvariableopSsavev2_adam_transformer_layer_1_multi_head_attention_key_bias_v_read_readvariableopWsavev2_adam_transformer_layer_1_multi_head_attention_value_kernel_v_read_readvariableopUsavev2_adam_transformer_layer_1_multi_head_attention_value_bias_v_read_readvariableopbsavev2_adam_transformer_layer_1_multi_head_attention_attention_output_kernel_v_read_readvariableop`savev2_adam_transformer_layer_1_multi_head_attention_attention_output_bias_v_read_readvariableop0savev2_adam_dense_1_kernel_v_read_readvariableop.savev2_adam_dense_1_bias_v_read_readvariableop0savev2_adam_dense_2_kernel_v_read_readvariableop.savev2_adam_dense_2_bias_v_read_readvariableopYsavev2_adam_transformer_layer_2_multi_head_attention_1_query_kernel_v_read_readvariableopWsavev2_adam_transformer_layer_2_multi_head_attention_1_query_bias_v_read_readvariableopWsavev2_adam_transformer_layer_2_multi_head_attention_1_key_kernel_v_read_readvariableopUsavev2_adam_transformer_layer_2_multi_head_attention_1_key_bias_v_read_readvariableopYsavev2_adam_transformer_layer_2_multi_head_attention_1_value_kernel_v_read_readvariableopWsavev2_adam_transformer_layer_2_multi_head_attention_1_value_bias_v_read_readvariableopdsavev2_adam_transformer_layer_2_multi_head_attention_1_attention_output_kernel_v_read_readvariableopbsavev2_adam_transformer_layer_2_multi_head_attention_1_attention_output_bias_v_read_readvariableop0savev2_adam_dense_3_kernel_v_read_readvariableop.savev2_adam_dense_3_bias_v_read_readvariableop0savev2_adam_dense_4_kernel_v_read_readvariableop.savev2_adam_dense_4_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *Ґ
dtypesЧ
Ф2С	Р
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:Л
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

identity_1Identity_1:output:0*і
_input_shapesҐ
Я: :	А
@:@:@
:
::: : :  : : @:@:@@:@:@А:А:АА:А:	А@:@:@:@@:@:@@:@:@@:@:@@:@:	@А:А:	А@:@:@@:@:@@:@:@@:@:@@:@:	@А:А:	А@:@: : : : : : : : : :	А
@:@:@
:
::: : :  : : @:@:@@:@:@А:А:АА:А:	А@:@:@:@@:@:@@:@:@@:@:@@:@:	@А:А:	А@:@:@@:@:@@:@:@@:@:@@:@:	@А:А:	А@:@:	А
@:@:@
:
::: : :  : : @:@:@@:@:@А:А:АА:А:	А@:@:@:@@:@:@@:@:@@:@:@@:@:	@А:А:	А@:@:@@:@:@@:@:@@:@:@@:@:	@А:А:	А@:@: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	А
@: 

_output_shapes
:@:$ 

_output_shapes

:@
: 

_output_shapes
:
:0,
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
:@А:!

_output_shapes	
:А:2.
,
_output_shapes
:АА:!

_output_shapes	
:А:%!

_output_shapes
:	А@: 

_output_shapes
:@:$ 

_output_shapes

:@:($
"
_output_shapes
:@@:$ 

_output_shapes

:@:($
"
_output_shapes
:@@:$ 

_output_shapes

:@:($
"
_output_shapes
:@@:$ 

_output_shapes

:@:($
"
_output_shapes
:@@: 

_output_shapes
:@:%!

_output_shapes
:	@А:!

_output_shapes	
:А:% !

_output_shapes
:	А@: !

_output_shapes
:@:("$
"
_output_shapes
:@@:$# 

_output_shapes

:@:($$
"
_output_shapes
:@@:$% 

_output_shapes

:@:(&$
"
_output_shapes
:@@:$' 

_output_shapes

:@:(($
"
_output_shapes
:@@: )

_output_shapes
:@:%*!

_output_shapes
:	@А:!+

_output_shapes	
:А:%,!

_output_shapes
:	А@: -
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
: :%7!

_output_shapes
:	А
@: 8

_output_shapes
:@:$9 

_output_shapes

:@
: :

_output_shapes
:
:0;,
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
:@А:!F

_output_shapes	
:А:2G.
,
_output_shapes
:АА:!H

_output_shapes	
:А:%I!

_output_shapes
:	А@: J

_output_shapes
:@:$K 

_output_shapes

:@:(L$
"
_output_shapes
:@@:$M 

_output_shapes

:@:(N$
"
_output_shapes
:@@:$O 

_output_shapes

:@:(P$
"
_output_shapes
:@@:$Q 

_output_shapes

:@:(R$
"
_output_shapes
:@@: S

_output_shapes
:@:%T!

_output_shapes
:	@А:!U

_output_shapes	
:А:%V!

_output_shapes
:	А@: W

_output_shapes
:@:(X$
"
_output_shapes
:@@:$Y 

_output_shapes

:@:(Z$
"
_output_shapes
:@@:$[ 

_output_shapes

:@:(\$
"
_output_shapes
:@@:$] 

_output_shapes

:@:(^$
"
_output_shapes
:@@: _

_output_shapes
:@:%`!

_output_shapes
:	@А:!a

_output_shapes	
:А:%b!

_output_shapes
:	А@: c

_output_shapes
:@:%d!

_output_shapes
:	А
@: e

_output_shapes
:@:$f 

_output_shapes

:@
: g

_output_shapes
:
:0h,
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
:@А:!s

_output_shapes	
:А:2t.
,
_output_shapes
:АА:!u

_output_shapes	
:А:%v!

_output_shapes
:	А@: w

_output_shapes
:@:$x 

_output_shapes

:@:(y$
"
_output_shapes
:@@:$z 

_output_shapes

:@:({$
"
_output_shapes
:@@:$| 

_output_shapes

:@:(}$
"
_output_shapes
:@@:$~ 

_output_shapes

:@:($
"
_output_shapes
:@@:!А

_output_shapes
:@:&Б!

_output_shapes
:	@А:"В

_output_shapes	
:А:&Г!

_output_shapes
:	А@:!Д

_output_shapes
:@:)Е$
"
_output_shapes
:@@:%Ж 

_output_shapes

:@:)З$
"
_output_shapes
:@@:%И 

_output_shapes

:@:)Й$
"
_output_shapes
:@@:%К 

_output_shapes

:@:)Л$
"
_output_shapes
:@@:!М

_output_shapes
:@:&Н!

_output_shapes
:	@А:"О

_output_shapes	
:А:&П!

_output_shapes
:	А@:!Р

_output_shapes
:@:С

_output_shapes
: 
ЩК
Є
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_27255

inputsX
Bmulti_head_attention_1_query_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_query_add_readvariableop_resource:@V
@multi_head_attention_1_key_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_1_key_add_readvariableop_resource:@X
Bmulti_head_attention_1_value_einsum_einsum_readvariableop_resource:@@J
8multi_head_attention_1_value_add_readvariableop_resource:@c
Mmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource:@@Q
Cmulti_head_attention_1_attention_output_add_readvariableop_resource:@I
6sequential_1_dense_3_tensordot_readvariableop_resource:	@АC
4sequential_1_dense_3_biasadd_readvariableop_resource:	АI
6sequential_1_dense_4_tensordot_readvariableop_resource:	А@B
4sequential_1_dense_4_biasadd_readvariableop_resource:@
identityИҐ:multi_head_attention_1/attention_output/add/ReadVariableOpҐDmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpҐ-multi_head_attention_1/key/add/ReadVariableOpҐ7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpҐ/multi_head_attention_1/query/add/ReadVariableOpҐ9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpҐ/multi_head_attention_1/value/add/ReadVariableOpҐ9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpҐ+sequential_1/dense_3/BiasAdd/ReadVariableOpҐ-sequential_1/dense_3/Tensordot/ReadVariableOpҐ+sequential_1/dense_4/BiasAdd/ReadVariableOpҐ-sequential_1/dense_4/Tensordot/ReadVariableOpј
9multi_head_attention_1/query/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0я
*multi_head_attention_1/query/einsum/EinsumEinsuminputsAmulti_head_attention_1/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde®
/multi_head_attention_1/query/add/ReadVariableOpReadVariableOp8multi_head_attention_1_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0—
 multi_head_attention_1/query/addAddV23multi_head_attention_1/query/einsum/Einsum:output:07multi_head_attention_1/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@Љ
7multi_head_attention_1/key/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_1_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0џ
(multi_head_attention_1/key/einsum/EinsumEinsuminputs?multi_head_attention_1/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde§
-multi_head_attention_1/key/add/ReadVariableOpReadVariableOp6multi_head_attention_1_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ћ
multi_head_attention_1/key/addAddV21multi_head_attention_1/key/einsum/Einsum:output:05multi_head_attention_1/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@ј
9multi_head_attention_1/value/einsum/Einsum/ReadVariableOpReadVariableOpBmulti_head_attention_1_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0я
*multi_head_attention_1/value/einsum/EinsumEinsuminputsAmulti_head_attention_1/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde®
/multi_head_attention_1/value/add/ReadVariableOpReadVariableOp8multi_head_attention_1_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0—
 multi_head_attention_1/value/addAddV23multi_head_attention_1/value/einsum/Einsum:output:07multi_head_attention_1/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@a
multi_head_attention_1/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >®
multi_head_attention_1/MulMul$multi_head_attention_1/query/add:z:0%multi_head_attention_1/Mul/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€@‘
$multi_head_attention_1/einsum/EinsumEinsum"multi_head_attention_1/key/add:z:0multi_head_attention_1/Mul:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€*
equationaecd,abcd->acbeЪ
&multi_head_attention_1/softmax/SoftmaxSoftmax-multi_head_attention_1/einsum/Einsum:output:0*
T0*/
_output_shapes
:€€€€€€€€€к
&multi_head_attention_1/einsum_1/EinsumEinsum0multi_head_attention_1/softmax/Softmax:softmax:0$multi_head_attention_1/value/add:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationacbe,aecd->abcd÷
Dmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpMmulti_head_attention_1_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ъ
5multi_head_attention_1/attention_output/einsum/EinsumEinsum/multi_head_attention_1/einsum_1/Einsum:output:0Lmulti_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:€€€€€€€€€@*
equationabcd,cde->abeЇ
:multi_head_attention_1/attention_output/add/ReadVariableOpReadVariableOpCmulti_head_attention_1_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0о
+multi_head_attention_1/attention_output/addAddV2>multi_head_attention_1/attention_output/einsum/Einsum:output:0Bmulti_head_attention_1/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@{
addAddV2inputs/multi_head_attention_1/attention_output/add:z:0*
T0*+
_output_shapes
:€€€€€€€€€@•
-sequential_1/dense_3/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_3_tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : П
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
value	B : У
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
valueB: ≠
#sequential_1/dense_3/Tensordot/ProdProd0sequential_1/dense_3/Tensordot/GatherV2:output:0-sequential_1/dense_3/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_3/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≥
%sequential_1/dense_3/Tensordot/Prod_1Prod2sequential_1/dense_3/Tensordot/GatherV2_1:output:0/sequential_1/dense_3/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_3/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : р
%sequential_1/dense_3/Tensordot/concatConcatV2,sequential_1/dense_3/Tensordot/free:output:0,sequential_1/dense_3/Tensordot/axes:output:03sequential_1/dense_3/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:Є
$sequential_1/dense_3/Tensordot/stackPack,sequential_1/dense_3/Tensordot/Prod:output:0.sequential_1/dense_3/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:§
(sequential_1/dense_3/Tensordot/transpose	Transposeadd:z:0.sequential_1/dense_3/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@…
&sequential_1/dense_3/Tensordot/ReshapeReshape,sequential_1/dense_3/Tensordot/transpose:y:0-sequential_1/dense_3/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€ 
%sequential_1/dense_3/Tensordot/MatMulMatMul/sequential_1/dense_3/Tensordot/Reshape:output:05sequential_1/dense_3/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€Аq
&sequential_1/dense_3/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Аn
,sequential_1/dense_3/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ы
'sequential_1/dense_3/Tensordot/concat_1ConcatV20sequential_1/dense_3/Tensordot/GatherV2:output:0/sequential_1/dense_3/Tensordot/Const_2:output:05sequential_1/dense_3/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:√
sequential_1/dense_3/TensordotReshape/sequential_1/dense_3/Tensordot/MatMul:product:00sequential_1/dense_3/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АЭ
+sequential_1/dense_3/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_3_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Љ
sequential_1/dense_3/BiasAddBiasAdd'sequential_1/dense_3/Tensordot:output:03sequential_1/dense_3/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€Аd
sequential_1/dense_3/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?ђ
sequential_1/dense_3/Gelu/mulMul(sequential_1/dense_3/Gelu/mul/x:output:0%sequential_1/dense_3/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аe
 sequential_1/dense_3/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?µ
!sequential_1/dense_3/Gelu/truedivRealDiv%sequential_1/dense_3/BiasAdd:output:0)sequential_1/dense_3/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€АВ
sequential_1/dense_3/Gelu/ErfErf%sequential_1/dense_3/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аd
sequential_1/dense_3/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?™
sequential_1/dense_3/Gelu/addAddV2(sequential_1/dense_3/Gelu/add/x:output:0!sequential_1/dense_3/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€А£
sequential_1/dense_3/Gelu/mul_1Mul!sequential_1/dense_3/Gelu/mul:z:0!sequential_1/dense_3/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€А•
-sequential_1/dense_4/Tensordot/ReadVariableOpReadVariableOp6sequential_1_dense_4_tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : П
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
value	B : У
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
valueB: ≠
#sequential_1/dense_4/Tensordot/ProdProd0sequential_1/dense_4/Tensordot/GatherV2:output:0-sequential_1/dense_4/Tensordot/Const:output:0*
T0*
_output_shapes
: p
&sequential_1/dense_4/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≥
%sequential_1/dense_4/Tensordot/Prod_1Prod2sequential_1/dense_4/Tensordot/GatherV2_1:output:0/sequential_1/dense_4/Tensordot/Const_1:output:0*
T0*
_output_shapes
: l
*sequential_1/dense_4/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : р
%sequential_1/dense_4/Tensordot/concatConcatV2,sequential_1/dense_4/Tensordot/free:output:0,sequential_1/dense_4/Tensordot/axes:output:03sequential_1/dense_4/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:Є
$sequential_1/dense_4/Tensordot/stackPack,sequential_1/dense_4/Tensordot/Prod:output:0.sequential_1/dense_4/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Ѕ
(sequential_1/dense_4/Tensordot/transpose	Transpose#sequential_1/dense_3/Gelu/mul_1:z:0.sequential_1/dense_4/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€А…
&sequential_1/dense_4/Tensordot/ReshapeReshape,sequential_1/dense_4/Tensordot/transpose:y:0-sequential_1/dense_4/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€…
%sequential_1/dense_4/Tensordot/MatMulMatMul/sequential_1/dense_4/Tensordot/Reshape:output:05sequential_1/dense_4/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@p
&sequential_1/dense_4/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@n
,sequential_1/dense_4/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : ы
'sequential_1/dense_4/Tensordot/concat_1ConcatV20sequential_1/dense_4/Tensordot/GatherV2:output:0/sequential_1/dense_4/Tensordot/Const_2:output:05sequential_1/dense_4/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:¬
sequential_1/dense_4/TensordotReshape/sequential_1/dense_4/Tensordot/MatMul:product:00sequential_1/dense_4/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Ь
+sequential_1/dense_4/BiasAdd/ReadVariableOpReadVariableOp4sequential_1_dense_4_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0ї
sequential_1/dense_4/BiasAddBiasAdd'sequential_1/dense_4/Tensordot:output:03sequential_1/dense_4/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@t
add_1AddV2add:z:0%sequential_1/dense_4/BiasAdd:output:0*
T0*+
_output_shapes
:€€€€€€€€€@\
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@ћ
NoOpNoOp;^multi_head_attention_1/attention_output/add/ReadVariableOpE^multi_head_attention_1/attention_output/einsum/Einsum/ReadVariableOp.^multi_head_attention_1/key/add/ReadVariableOp8^multi_head_attention_1/key/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/query/add/ReadVariableOp:^multi_head_attention_1/query/einsum/Einsum/ReadVariableOp0^multi_head_attention_1/value/add/ReadVariableOp:^multi_head_attention_1/value/einsum/Einsum/ReadVariableOp,^sequential_1/dense_3/BiasAdd/ReadVariableOp.^sequential_1/dense_3/Tensordot/ReadVariableOp,^sequential_1/dense_4/BiasAdd/ReadVariableOp.^sequential_1/dense_4/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:€€€€€€€€€@: : : : : : : : : : : : 2x
:multi_head_attention_1/attention_output/add/ReadVariableOp:multi_head_attention_1/attention_output/add/ReadVariableOp2М
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
:€€€€€€€€€@
 
_user_specified_nameinputs
Ѓ
ќ
3__inference_transformer_layer_2_layer_call_fn_27035

inputs
unknown:@@
	unknown_0:@
	unknown_1:@@
	unknown_2:@
	unknown_3:@@
	unknown_4:@
	unknown_5:@@
	unknown_6:@
	unknown_7:	@А
	unknown_8:	А
	unknown_9:	А@

unknown_10:@
identityИҐStatefulPartitionedCallн
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_24447s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:€€€€€€€€€@: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
∆
ў
%__inference_model_layer_call_fn_25384
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
	unknown_9:@А

unknown_10:	А*

unknown_11:АА

unknown_12:	А

unknown_13:	А@

unknown_14:@

unknown_15:@ 

unknown_16:@@

unknown_17:@ 

unknown_18:@@

unknown_19:@ 

unknown_20:@@

unknown_21:@ 

unknown_22:@@

unknown_23:@

unknown_24:	@А

unknown_25:	А

unknown_26:	А@

unknown_27:@ 

unknown_28:@@

unknown_29:@ 

unknown_30:@@

unknown_31:@ 

unknown_32:@@

unknown_33:@ 

unknown_34:@@

unknown_35:@

unknown_36:	@А

unknown_37:	А

unknown_38:	А@

unknown_39:@

unknown_40:	А
@

unknown_41:@

unknown_42:@


unknown_43:

identityИҐStatefulPartitionedCall™
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
:€€€€€€€€€
*O
_read_only_resource_inputs1
/-	
 !"#$%&'()*+,-*0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_model_layer_call_and_return_conditional_losses_25196o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*М
_input_shapes{
y:€€€€€€€€€(: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
3
_output_shapes!
:€€€€€€€€€(
!
_user_specified_name	input_1
ґ
ф
B__inference_dense_5_layer_call_and_return_conditional_losses_24499

inputs1
matmul_readvariableop_resource:	А
@-
biasadd_readvariableop_resource:@
identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	А
@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@O

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?h
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€@P
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?q
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*'
_output_shapes
:€€€€€€€€€@S
Gelu/ErfErfGelu/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€@O

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?f
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*'
_output_shapes
:€€€€€€€€€@_

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€@]
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€@w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:€€€€€€€€€А
: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€А

 
_user_specified_nameinputs
Ю

у
B__inference_dense_6_layer_call_and_return_conditional_losses_27313

inputs0
matmul_readvariableop_resource:@
-
biasadd_readvariableop_resource:

identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@
*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:
*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€
V
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€
`
IdentityIdentitySoftmax:softmax:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
Ч
І
E__inference_sequential_layer_call_and_return_conditional_losses_23784

inputs 
dense_1_23742:	@А
dense_1_23744:	А 
dense_2_23778:	А@
dense_2_23780:@
identityИҐdense_1/StatefulPartitionedCallҐdense_2/StatefulPartitionedCallс
dense_1/StatefulPartitionedCallStatefulPartitionedCallinputsdense_1_23742dense_1_23744*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_23741Т
dense_2/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0dense_2_23778dense_2_23780*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_23777{
IdentityIdentity(dense_2/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@К
NoOpNoOp ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
”
b
F__inference_pooling3d_2_layer_call_and_return_conditional_losses_23535

inputs
identityљ
	MaxPool3D	MaxPool3Dinputs*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€*
ksize	
*
paddingSAME*
strides	
К
IdentityIdentityMaxPool3D:output:0*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€: {
W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
 
_user_specified_nameinputs
Ѕ
Ф
'__inference_dense_6_layer_call_fn_27302

inputs
unknown:@

	unknown_0:

identityИҐStatefulPartitionedCallЏ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€
*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_6_layer_call_and_return_conditional_losses_24516o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€
`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€@: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
е
G
+__inference_pooling3d_2_layer_call_fn_27328

inputs
identityд
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *O
fJRH
F__inference_pooling3d_2_layer_call_and_return_conditional_losses_23535Р
IdentityIdentityPartitionedCall:output:0*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€: {
W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
 
_user_specified_nameinputs
Ў"
ы
B__inference_dense_3_layer_call_and_return_conditional_losses_23941

inputs4
!tensordot_readvariableop_resource:	@А.
biasadd_readvariableop_resource:	А
identityИҐBiasAdd/ReadVariableOpҐTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : ї
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
value	B : њ
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
value	B : Ь
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
:€€€€€€€€€@К
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Л
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€А\
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:АY
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : І
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Д
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€АO

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?m
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€АP
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?v
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€АX
Gelu/ErfErfGelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€АO

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?k
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€Аd

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аb
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€Аz
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
јЖ
И
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_24923

inputsV
@multi_head_attention_query_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_query_add_readvariableop_resource:@T
>multi_head_attention_key_einsum_einsum_readvariableop_resource:@@F
4multi_head_attention_key_add_readvariableop_resource:@V
@multi_head_attention_value_einsum_einsum_readvariableop_resource:@@H
6multi_head_attention_value_add_readvariableop_resource:@a
Kmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource:@@O
Amulti_head_attention_attention_output_add_readvariableop_resource:@G
4sequential_dense_1_tensordot_readvariableop_resource:	@АA
2sequential_dense_1_biasadd_readvariableop_resource:	АG
4sequential_dense_2_tensordot_readvariableop_resource:	А@@
2sequential_dense_2_biasadd_readvariableop_resource:@
identityИҐ8multi_head_attention/attention_output/add/ReadVariableOpҐBmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpҐ+multi_head_attention/key/add/ReadVariableOpҐ5multi_head_attention/key/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/query/add/ReadVariableOpҐ7multi_head_attention/query/einsum/Einsum/ReadVariableOpҐ-multi_head_attention/value/add/ReadVariableOpҐ7multi_head_attention/value/einsum/Einsum/ReadVariableOpҐ)sequential/dense_1/BiasAdd/ReadVariableOpҐ+sequential/dense_1/Tensordot/ReadVariableOpҐ)sequential/dense_2/BiasAdd/ReadVariableOpҐ+sequential/dense_2/Tensordot/ReadVariableOpЉ
7multi_head_attention/query/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_query_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0џ
(multi_head_attention/query/einsum/EinsumEinsuminputs?multi_head_attention/query/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde§
-multi_head_attention/query/add/ReadVariableOpReadVariableOp6multi_head_attention_query_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ћ
multi_head_attention/query/addAddV21multi_head_attention/query/einsum/Einsum:output:05multi_head_attention/query/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@Є
5multi_head_attention/key/einsum/Einsum/ReadVariableOpReadVariableOp>multi_head_attention_key_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0„
&multi_head_attention/key/einsum/EinsumEinsuminputs=multi_head_attention/key/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde†
+multi_head_attention/key/add/ReadVariableOpReadVariableOp4multi_head_attention_key_add_readvariableop_resource*
_output_shapes

:@*
dtype0≈
multi_head_attention/key/addAddV2/multi_head_attention/key/einsum/Einsum:output:03multi_head_attention/key/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@Љ
7multi_head_attention/value/einsum/Einsum/ReadVariableOpReadVariableOp@multi_head_attention_value_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0џ
(multi_head_attention/value/einsum/EinsumEinsuminputs?multi_head_attention/value/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationabc,cde->abde§
-multi_head_attention/value/add/ReadVariableOpReadVariableOp6multi_head_attention_value_add_readvariableop_resource*
_output_shapes

:@*
dtype0Ћ
multi_head_attention/value/addAddV21multi_head_attention/value/einsum/Einsum:output:05multi_head_attention/value/add/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@_
multi_head_attention/Mul/yConst*
_output_shapes
: *
dtype0*
valueB
 *   >Ґ
multi_head_attention/MulMul"multi_head_attention/query/add:z:0#multi_head_attention/Mul/y:output:0*
T0*/
_output_shapes
:€€€€€€€€€@ќ
"multi_head_attention/einsum/EinsumEinsum multi_head_attention/key/add:z:0multi_head_attention/Mul:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€*
equationaecd,abcd->acbeЦ
$multi_head_attention/softmax/SoftmaxSoftmax+multi_head_attention/einsum/Einsum:output:0*
T0*/
_output_shapes
:€€€€€€€€€д
$multi_head_attention/einsum_1/EinsumEinsum.multi_head_attention/softmax/Softmax:softmax:0"multi_head_attention/value/add:z:0*
N*
T0*/
_output_shapes
:€€€€€€€€€@*
equationacbe,aecd->abcd“
Bmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOpReadVariableOpKmulti_head_attention_attention_output_einsum_einsum_readvariableop_resource*"
_output_shapes
:@@*
dtype0Ф
3multi_head_attention/attention_output/einsum/EinsumEinsum-multi_head_attention/einsum_1/Einsum:output:0Jmulti_head_attention/attention_output/einsum/Einsum/ReadVariableOp:value:0*
N*
T0*+
_output_shapes
:€€€€€€€€€@*
equationabcd,cde->abeґ
8multi_head_attention/attention_output/add/ReadVariableOpReadVariableOpAmulti_head_attention_attention_output_add_readvariableop_resource*
_output_shapes
:@*
dtype0и
)multi_head_attention/attention_output/addAddV2<multi_head_attention/attention_output/einsum/Einsum:output:0@multi_head_attention/attention_output/add/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@y
addAddV2inputs-multi_head_attention/attention_output/add:z:0*
T0*+
_output_shapes
:€€€€€€€€€@°
+sequential/dense_1/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : З
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
value	B : Л
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
valueB: І
!sequential/dense_1/Tensordot/ProdProd.sequential/dense_1/Tensordot/GatherV2:output:0+sequential/dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≠
#sequential/dense_1/Tensordot/Prod_1Prod0sequential/dense_1/Tensordot/GatherV2_1:output:0-sequential/dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : и
#sequential/dense_1/Tensordot/concatConcatV2*sequential/dense_1/Tensordot/free:output:0*sequential/dense_1/Tensordot/axes:output:01sequential/dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:≤
"sequential/dense_1/Tensordot/stackPack*sequential/dense_1/Tensordot/Prod:output:0,sequential/dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:†
&sequential/dense_1/Tensordot/transpose	Transposeadd:z:0,sequential/dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@√
$sequential/dense_1/Tensordot/ReshapeReshape*sequential/dense_1/Tensordot/transpose:y:0+sequential/dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€ƒ
#sequential/dense_1/Tensordot/MatMulMatMul-sequential/dense_1/Tensordot/Reshape:output:03sequential/dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€Аo
$sequential/dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Аl
*sequential/dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : у
%sequential/dense_1/Tensordot/concat_1ConcatV2.sequential/dense_1/Tensordot/GatherV2:output:0-sequential/dense_1/Tensordot/Const_2:output:03sequential/dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:љ
sequential/dense_1/TensordotReshape-sequential/dense_1/Tensordot/MatMul:product:0.sequential/dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АЩ
)sequential/dense_1/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0ґ
sequential/dense_1/BiasAddBiasAdd%sequential/dense_1/Tensordot:output:01sequential/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€Аb
sequential/dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?¶
sequential/dense_1/Gelu/mulMul&sequential/dense_1/Gelu/mul/x:output:0#sequential/dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аc
sequential/dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?ѓ
sequential/dense_1/Gelu/truedivRealDiv#sequential/dense_1/BiasAdd:output:0'sequential/dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€А~
sequential/dense_1/Gelu/ErfErf#sequential/dense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аb
sequential/dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?§
sequential/dense_1/Gelu/addAddV2&sequential/dense_1/Gelu/add/x:output:0sequential/dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€АЭ
sequential/dense_1/Gelu/mul_1Mulsequential/dense_1/Gelu/mul:z:0sequential/dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€А°
+sequential/dense_2/Tensordot/ReadVariableOpReadVariableOp4sequential_dense_2_tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : З
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
value	B : Л
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
valueB: І
!sequential/dense_2/Tensordot/ProdProd.sequential/dense_2/Tensordot/GatherV2:output:0+sequential/dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: n
$sequential/dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: ≠
#sequential/dense_2/Tensordot/Prod_1Prod0sequential/dense_2/Tensordot/GatherV2_1:output:0-sequential/dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: j
(sequential/dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : и
#sequential/dense_2/Tensordot/concatConcatV2*sequential/dense_2/Tensordot/free:output:0*sequential/dense_2/Tensordot/axes:output:01sequential/dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:≤
"sequential/dense_2/Tensordot/stackPack*sequential/dense_2/Tensordot/Prod:output:0,sequential/dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:ї
&sequential/dense_2/Tensordot/transpose	Transpose!sequential/dense_1/Gelu/mul_1:z:0,sequential/dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€А√
$sequential/dense_2/Tensordot/ReshapeReshape*sequential/dense_2/Tensordot/transpose:y:0+sequential/dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€√
#sequential/dense_2/Tensordot/MatMulMatMul-sequential/dense_2/Tensordot/Reshape:output:03sequential/dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@n
$sequential/dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@l
*sequential/dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : у
%sequential/dense_2/Tensordot/concat_1ConcatV2.sequential/dense_2/Tensordot/GatherV2:output:0-sequential/dense_2/Tensordot/Const_2:output:03sequential/dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Љ
sequential/dense_2/TensordotReshape-sequential/dense_2/Tensordot/MatMul:product:0.sequential/dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Ш
)sequential/dense_2/BiasAdd/ReadVariableOpReadVariableOp2sequential_dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0µ
sequential/dense_2/BiasAddBiasAdd%sequential/dense_2/Tensordot:output:01sequential/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@r
add_1AddV2add:z:0#sequential/dense_2/BiasAdd:output:0*
T0*+
_output_shapes
:€€€€€€€€€@\
IdentityIdentity	add_1:z:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@і
NoOpNoOp9^multi_head_attention/attention_output/add/ReadVariableOpC^multi_head_attention/attention_output/einsum/Einsum/ReadVariableOp,^multi_head_attention/key/add/ReadVariableOp6^multi_head_attention/key/einsum/Einsum/ReadVariableOp.^multi_head_attention/query/add/ReadVariableOp8^multi_head_attention/query/einsum/Einsum/ReadVariableOp.^multi_head_attention/value/add/ReadVariableOp8^multi_head_attention/value/einsum/Einsum/ReadVariableOp*^sequential/dense_1/BiasAdd/ReadVariableOp,^sequential/dense_1/Tensordot/ReadVariableOp*^sequential/dense_2/BiasAdd/ReadVariableOp,^sequential/dense_2/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:€€€€€€€€€@: : : : : : : : : : : : 2t
8multi_head_attention/attention_output/add/ReadVariableOp8multi_head_attention/attention_output/add/ReadVariableOp2И
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
:€€€€€€€€€@
 
_user_specified_nameinputs
Њ
`
D__inference_flatten_1_layer_call_and_return_conditional_losses_27266

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€   ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:€€€€€€€€€А
Y
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:€€€€€€€€€А
"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:€€€€€€€€€@:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
”
b
F__inference_pooling3d_1_layer_call_and_return_conditional_losses_27323

inputs
identityљ
	MaxPool3D	MaxPool3Dinputs*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€*
ksize	
*
paddingSAME*
strides	
К
IdentityIdentityMaxPool3D:output:0*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€: {
W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
 
_user_specified_nameinputs
Ў"
ы
B__inference_dense_3_layer_call_and_return_conditional_losses_27822

inputs4
!tensordot_readvariableop_resource:	@А.
biasadd_readvariableop_resource:	А
identityИҐBiasAdd/ReadVariableOpҐTensordot/ReadVariableOp{
Tensordot/ReadVariableOpReadVariableOp!tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : ї
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
value	B : њ
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
value	B : Ь
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
:€€€€€€€€€@К
Tensordot/ReshapeReshapeTensordot/transpose:y:0Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Л
Tensordot/MatMulMatMulTensordot/Reshape:output:0 Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€А\
Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:АY
Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : І
Tensordot/concat_1ConcatV2Tensordot/GatherV2:output:0Tensordot/Const_2:output:0 Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Д
	TensordotReshapeTensordot/MatMul:product:0Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0}
BiasAddBiasAddTensordot:output:0BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€АO

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?m
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€АP
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?v
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€АX
Gelu/ErfErfGelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€АO

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?k
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€Аd

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€Аb
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€Аz
NoOpNoOp^BiasAdd/ReadVariableOp^Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp24
Tensordot/ReadVariableOpTensordot/ReadVariableOp:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
Щ
©
G__inference_sequential_1_layer_call_and_return_conditional_losses_24044

inputs 
dense_3_24033:	@А
dense_3_24035:	А 
dense_4_24038:	А@
dense_4_24040:@
identityИҐdense_3/StatefulPartitionedCallҐdense_4/StatefulPartitionedCallс
dense_3/StatefulPartitionedCallStatefulPartitionedCallinputsdense_3_24033dense_3_24035*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_3_layer_call_and_return_conditional_losses_23941Т
dense_4/StatefulPartitionedCallStatefulPartitionedCall(dense_3/StatefulPartitionedCall:output:0dense_4_24038dense_4_24040*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_4_layer_call_and_return_conditional_losses_23977{
IdentityIdentity(dense_4/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@К
NoOpNoOp ^dense_3/StatefulPartitionedCall ^dense_4/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 2B
dense_3/StatefulPartitionedCalldense_3/StatefulPartitionedCall2B
dense_4/StatefulPartitionedCalldense_4/StatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
ъ
g
K__inference_time_distributed_layer_call_and_return_conditional_losses_26639

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
valueB:—
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
valueB"€€€€      А   m
ReshapeReshapeinputsReshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€А^
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€   w
flatten/ReshapeReshapeReshape:output:0flatten/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€А\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
€€€€€€€€€T
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value
B :АХ
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:И
	Reshape_1Reshapeflatten/Reshape:output:0Reshape_1/shape:output:0*
T0*5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€Аh
IdentityIdentityReshape_1:output:0*
T0*5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'€€€€€€€€€€€€€€€€€€А:e a
=
_output_shapes+
):'€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
”
b
F__inference_pooling3d_3_layer_call_and_return_conditional_losses_23547

inputs
identityљ
	MaxPool3D	MaxPool3Dinputs*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€*
ksize	
*
paddingSAME*
strides	
К
IdentityIdentityMaxPool3D:output:0*
T0*W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*V
_input_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€: {
W
_output_shapesE
C:A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
 
_user_specified_nameinputs
€D
„
E__inference_sequential_layer_call_and_return_conditional_losses_27535

inputs<
)dense_1_tensordot_readvariableop_resource:	@А6
'dense_1_biasadd_readvariableop_resource:	А<
)dense_2_tensordot_readvariableop_resource:	А@5
'dense_2_biasadd_readvariableop_resource:@
identityИҐdense_1/BiasAdd/ReadVariableOpҐ dense_1/Tensordot/ReadVariableOpҐdense_2/BiasAdd/ReadVariableOpҐ dense_2/Tensordot/ReadVariableOpЛ
 dense_1/Tensordot/ReadVariableOpReadVariableOp)dense_1_tensordot_readvariableop_resource*
_output_shapes
:	@А*
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
value	B : џ
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
value	B : я
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
valueB: Ж
dense_1/Tensordot/ProdProd#dense_1/Tensordot/GatherV2:output:0 dense_1/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_1/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: М
dense_1/Tensordot/Prod_1Prod%dense_1/Tensordot/GatherV2_1:output:0"dense_1/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_1/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Љ
dense_1/Tensordot/concatConcatV2dense_1/Tensordot/free:output:0dense_1/Tensordot/axes:output:0&dense_1/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:С
dense_1/Tensordot/stackPackdense_1/Tensordot/Prod:output:0!dense_1/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Й
dense_1/Tensordot/transpose	Transposeinputs!dense_1/Tensordot/concat:output:0*
T0*+
_output_shapes
:€€€€€€€€€@Ґ
dense_1/Tensordot/ReshapeReshapedense_1/Tensordot/transpose:y:0 dense_1/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€£
dense_1/Tensordot/MatMulMatMul"dense_1/Tensordot/Reshape:output:0(dense_1/Tensordot/ReadVariableOp:value:0*
T0*(
_output_shapes
:€€€€€€€€€Аd
dense_1/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:Аa
dense_1/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : «
dense_1/Tensordot/concat_1ConcatV2#dense_1/Tensordot/GatherV2:output:0"dense_1/Tensordot/Const_2:output:0(dense_1/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ь
dense_1/TensordotReshape"dense_1/Tensordot/MatMul:product:0#dense_1/Tensordot/concat_1:output:0*
T0*,
_output_shapes
:€€€€€€€€€АГ
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0Х
dense_1/BiasAddBiasAdddense_1/Tensordot:output:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*,
_output_shapes
:€€€€€€€€€АW
dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Е
dense_1/Gelu/mulMuldense_1/Gelu/mul/x:output:0dense_1/BiasAdd:output:0*
T0*,
_output_shapes
:€€€€€€€€€АX
dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?О
dense_1/Gelu/truedivRealDivdense_1/BiasAdd:output:0dense_1/Gelu/Cast/x:output:0*
T0*,
_output_shapes
:€€€€€€€€€Аh
dense_1/Gelu/ErfErfdense_1/Gelu/truediv:z:0*
T0*,
_output_shapes
:€€€€€€€€€АW
dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Г
dense_1/Gelu/addAddV2dense_1/Gelu/add/x:output:0dense_1/Gelu/Erf:y:0*
T0*,
_output_shapes
:€€€€€€€€€А|
dense_1/Gelu/mul_1Muldense_1/Gelu/mul:z:0dense_1/Gelu/add:z:0*
T0*,
_output_shapes
:€€€€€€€€€АЛ
 dense_2/Tensordot/ReadVariableOpReadVariableOp)dense_2_tensordot_readvariableop_resource*
_output_shapes
:	А@*
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
value	B : џ
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
value	B : я
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
valueB: Ж
dense_2/Tensordot/ProdProd#dense_2/Tensordot/GatherV2:output:0 dense_2/Tensordot/Const:output:0*
T0*
_output_shapes
: c
dense_2/Tensordot/Const_1Const*
_output_shapes
:*
dtype0*
valueB: М
dense_2/Tensordot/Prod_1Prod%dense_2/Tensordot/GatherV2_1:output:0"dense_2/Tensordot/Const_1:output:0*
T0*
_output_shapes
: _
dense_2/Tensordot/concat/axisConst*
_output_shapes
: *
dtype0*
value	B : Љ
dense_2/Tensordot/concatConcatV2dense_2/Tensordot/free:output:0dense_2/Tensordot/axes:output:0&dense_2/Tensordot/concat/axis:output:0*
N*
T0*
_output_shapes
:С
dense_2/Tensordot/stackPackdense_2/Tensordot/Prod:output:0!dense_2/Tensordot/Prod_1:output:0*
N*
T0*
_output_shapes
:Ъ
dense_2/Tensordot/transpose	Transposedense_1/Gelu/mul_1:z:0!dense_2/Tensordot/concat:output:0*
T0*,
_output_shapes
:€€€€€€€€€АҐ
dense_2/Tensordot/ReshapeReshapedense_2/Tensordot/transpose:y:0 dense_2/Tensordot/stack:output:0*
T0*0
_output_shapes
:€€€€€€€€€€€€€€€€€€Ґ
dense_2/Tensordot/MatMulMatMul"dense_2/Tensordot/Reshape:output:0(dense_2/Tensordot/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@c
dense_2/Tensordot/Const_2Const*
_output_shapes
:*
dtype0*
valueB:@a
dense_2/Tensordot/concat_1/axisConst*
_output_shapes
: *
dtype0*
value	B : «
dense_2/Tensordot/concat_1ConcatV2#dense_2/Tensordot/GatherV2:output:0"dense_2/Tensordot/Const_2:output:0(dense_2/Tensordot/concat_1/axis:output:0*
N*
T0*
_output_shapes
:Ы
dense_2/TensordotReshape"dense_2/Tensordot/MatMul:product:0#dense_2/Tensordot/concat_1:output:0*
T0*+
_output_shapes
:€€€€€€€€€@В
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Ф
dense_2/BiasAddBiasAdddense_2/Tensordot:output:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*+
_output_shapes
:€€€€€€€€€@k
IdentityIdentitydense_2/BiasAdd:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@ќ
NoOpNoOp^dense_1/BiasAdd/ReadVariableOp!^dense_1/Tensordot/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp!^dense_2/Tensordot/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2D
 dense_1/Tensordot/ReadVariableOp dense_1/Tensordot/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2D
 dense_2/Tensordot/ReadVariableOp dense_2/Tensordot/ReadVariableOp:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
Ћ
М
8__inference_frame_position_embedding_layer_call_fn_26739

inputs
unknown:@
identityИҐStatefulPartitionedCallв
StatefulPartitionedCallStatefulPartitionedCallinputsunknown*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*#
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *\
fWRU
S__inference_frame_position_embedding_layer_call_and_return_conditional_losses_24225s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*,
_input_shapes
:€€€€€€€€€@: 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
п
g
K__inference_time_distributed_layer_call_and_return_conditional_losses_23577

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
valueB:—
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
valueB"€€€€      А   m
ReshapeReshapeinputsReshape/shape:output:0*
T0*0
_output_shapes
:€€€€€€€€€А√
flatten/PartitionedCallPartitionedCallReshape:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_flatten_layer_call_and_return_conditional_losses_23570\
Reshape_1/shape/0Const*
_output_shapes
: *
dtype0*
valueB :
€€€€€€€€€T
Reshape_1/shape/2Const*
_output_shapes
: *
dtype0*
value
B :АХ
Reshape_1/shapePackReshape_1/shape/0:output:0strided_slice:output:0Reshape_1/shape/2:output:0*
N*
T0*
_output_shapes
:Р
	Reshape_1Reshape flatten/PartitionedCall:output:0Reshape_1/shape:output:0*
T0*5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€Аh
IdentityIdentityReshape_1:output:0*
T0*5
_output_shapes#
!:€€€€€€€€€€€€€€€€€€А"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*<
_input_shapes+
):'€€€€€€€€€€€€€€€€€€А:e a
=
_output_shapes+
):'€€€€€€€€€€€€€€€€€€А
 
_user_specified_nameinputs
і
т
@__inference_dense_layer_call_and_return_conditional_losses_23639

inputs1
matmul_readvariableop_resource:	А@-
biasadd_readvariableop_resource:@
identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	А@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@O

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?h
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€@P
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?q
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*'
_output_shapes
:€€€€€€€€€@S
Gelu/ErfErfGelu/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€@O

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?f
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*'
_output_shapes
:€€€€€€€€€@_

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€@]
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€@w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:€€€€€€€€€А: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
і
т
@__inference_dense_layer_call_and_return_conditional_losses_27381

inputs1
matmul_readvariableop_resource:	А@-
biasadd_readvariableop_resource:@
identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	А@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€@O

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?h
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€@P
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?q
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*'
_output_shapes
:€€€€€€€€€@S
Gelu/ErfErfGelu/truediv:z:0*
T0*'
_output_shapes
:€€€€€€€€€@O

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?f
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*'
_output_shapes
:€€€€€€€€€@_

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*'
_output_shapes
:€€€€€€€€€@]
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*'
_output_shapes
:€€€€€€€€€@w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:€€€€€€€€€А: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
Ч
І
E__inference_sequential_layer_call_and_return_conditional_losses_23844

inputs 
dense_1_23833:	@А
dense_1_23835:	А 
dense_2_23838:	А@
dense_2_23840:@
identityИҐdense_1/StatefulPartitionedCallҐdense_2/StatefulPartitionedCallс
dense_1/StatefulPartitionedCallStatefulPartitionedCallinputsdense_1_23833dense_1_23835*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_23741Т
dense_2/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0dense_2_23838dense_2_23840*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_2_layer_call_and_return_conditional_losses_23777{
IdentityIdentity(dense_2/StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@К
NoOpNoOp ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
Ѓ
ќ
3__inference_transformer_layer_1_layer_call_fn_26815

inputs
unknown:@@
	unknown_0:@
	unknown_1:@@
	unknown_2:@
	unknown_3:@@
	unknown_4:@
	unknown_5:@@
	unknown_6:@
	unknown_7:	@А
	unknown_8:	А
	unknown_9:	А@

unknown_10:@
identityИҐStatefulPartitionedCallн
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *W
fRRP
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_24923s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*B
_input_shapes1
/:€€€€€€€€€@: : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
ќx
ъ
D__inference_encoder3d_layer_call_and_return_conditional_losses_26612

inputso
Qspatial_attention_spatial_attention_attention_conv_conv3d_readvariableop_resource:`
Rspatial_attention_spatial_attention_attention_conv_biasadd_readvariableop_resource:_
Aconv2_plus1d_conv3d_1_spatial_conv_conv3d_readvariableop_resource: P
Bconv2_plus1d_conv3d_1_spatial_conv_biasadd_readvariableop_resource: `
Bconv2_plus1d_conv3d_1_temporal_conv_conv3d_readvariableop_resource:  Q
Cconv2_plus1d_conv3d_1_temporal_conv_biasadd_readvariableop_resource: a
Cconv2_plus1d_1_conv3d_2_spatial_conv_conv3d_readvariableop_resource: @R
Dconv2_plus1d_1_conv3d_2_spatial_conv_biasadd_readvariableop_resource:@b
Dconv2_plus1d_1_conv3d_2_temporal_conv_conv3d_readvariableop_resource:@@S
Econv2_plus1d_1_conv3d_2_temporal_conv_biasadd_readvariableop_resource:@b
Cconv2_plus1d_2_conv3d_3_spatial_conv_conv3d_readvariableop_resource:@АS
Dconv2_plus1d_2_conv3d_3_spatial_conv_biasadd_readvariableop_resource:	Аd
Dconv2_plus1d_2_conv3d_3_temporal_conv_conv3d_readvariableop_resource:ААT
Econv2_plus1d_2_conv3d_3_temporal_conv_biasadd_readvariableop_resource:	А
identityИҐ9conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpҐ8conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpҐ:conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpҐ9conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpҐ;conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpҐ:conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpҐ<conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpҐ;conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpҐ;conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpҐ:conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpҐ<conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpҐ;conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpҐIspatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpҐHspatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpж
Hspatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpReadVariableOpQspatial_attention_spatial_attention_attention_conv_conv3d_readvariableop_resource**
_output_shapes
:*
dtype0Д
9spatial_attention/spatial_attention_attention_conv/Conv3DConv3DinputsPspatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(*
paddingSAME*
strides	
Ў
Ispatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpReadVariableOpRspatial_attention_spatial_attention_attention_conv_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0Ъ
:spatial_attention/spatial_attention_attention_conv/BiasAddBiasAddBspatial_attention/spatial_attention_attention_conv/Conv3D:output:0Qspatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(В
=spatial_attention/spatial_attention_attention_conv/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Н
;spatial_attention/spatial_attention_attention_conv/Gelu/mulMulFspatial_attention/spatial_attention_attention_conv/Gelu/mul/x:output:0Cspatial_attention/spatial_attention_attention_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(Г
>spatial_attention/spatial_attention_attention_conv/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *уµ?Ц
?spatial_attention/spatial_attention_attention_conv/Gelu/truedivRealDivCspatial_attention/spatial_attention_attention_conv/BiasAdd:output:0Gspatial_attention/spatial_attention_attention_conv/Gelu/Cast/x:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(≈
;spatial_attention/spatial_attention_attention_conv/Gelu/ErfErfCspatial_attention/spatial_attention_attention_conv/Gelu/truediv:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(В
=spatial_attention/spatial_attention_attention_conv/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  А?Л
;spatial_attention/spatial_attention_attention_conv/Gelu/addAddV2Fspatial_attention/spatial_attention_attention_conv/Gelu/add/x:output:0?spatial_attention/spatial_attention_attention_conv/Gelu/Erf:y:0*
T0*3
_output_shapes!
:€€€€€€€€€(Д
=spatial_attention/spatial_attention_attention_conv/Gelu/mul_1Mul?spatial_attention/spatial_attention_attention_conv/Gelu/mul:z:0?spatial_attention/spatial_attention_attention_conv/Gelu/add:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(ј
0spatial_attention/spatial_attention_multiply/mulMulinputsAspatial_attention/spatial_attention_attention_conv/Gelu/mul_1:z:0*
T0*3
_output_shapes!
:€€€€€€€€€(∆
8conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOpReadVariableOpAconv2_plus1d_conv3d_1_spatial_conv_conv3d_readvariableop_resource**
_output_shapes
: *
dtype0Т
)conv2_plus1d/conv3D_1_spatial_conv/Conv3DConv3D4spatial_attention/spatial_attention_multiply/mul:z:0@conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
paddingSAME*
strides	
Є
9conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpBconv2_plus1d_conv3d_1_spatial_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0к
*conv2_plus1d/conv3D_1_spatial_conv/BiasAddBiasAdd2conv2_plus1d/conv3D_1_spatial_conv/Conv3D:output:0Aconv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( Ґ
'conv2_plus1d/conv3D_1_spatial_conv/ReluRelu3conv2_plus1d/conv3D_1_spatial_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€( »
9conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOpReadVariableOpBconv2_plus1d_conv3d_1_temporal_conv_conv3d_readvariableop_resource**
_output_shapes
:  *
dtype0Х
*conv2_plus1d/conv3D_1_temporal_conv/Conv3DConv3D5conv2_plus1d/conv3D_1_spatial_conv/Relu:activations:0Aconv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
paddingSAME*
strides	
Ї
:conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpCconv2_plus1d_conv3d_1_temporal_conv_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0н
+conv2_plus1d/conv3D_1_temporal_conv/BiasAddBiasAdd3conv2_plus1d/conv3D_1_temporal_conv/Conv3D:output:0Bconv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€( §
(conv2_plus1d/conv3D_1_temporal_conv/ReluRelu4conv2_plus1d/conv3D_1_temporal_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€( ’
pooling3d_1/MaxPool3D	MaxPool3D6conv2_plus1d/conv3D_1_temporal_conv/Relu:activations:0*
T0*3
_output_shapes!
:€€€€€€€€€( *
ksize	
*
paddingSAME*
strides	
 
:conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_1_conv3d_2_spatial_conv_conv3d_readvariableop_resource**
_output_shapes
: @*
dtype0А
+conv2_plus1d_1/conv3D_2_spatial_conv/Conv3DConv3Dpooling3d_1/MaxPool3D:output:0Bconv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
paddingSAME*
strides	
Љ
;conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_1_conv3d_2_spatial_conv_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0р
,conv2_plus1d_1/conv3D_2_spatial_conv/BiasAddBiasAdd4conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D:output:0Cconv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@¶
)conv2_plus1d_1/conv3D_2_spatial_conv/ReluRelu5conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(@ћ
;conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOpReadVariableOpDconv2_plus1d_1_conv3d_2_temporal_conv_conv3d_readvariableop_resource**
_output_shapes
:@@*
dtype0Ы
,conv2_plus1d_1/conv3D_2_temporal_conv/Conv3DConv3D7conv2_plus1d_1/conv3D_2_spatial_conv/Relu:activations:0Cconv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
paddingSAME*
strides	
Њ
<conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpEconv2_plus1d_1_conv3d_2_temporal_conv_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0у
-conv2_plus1d_1/conv3D_2_temporal_conv/BiasAddBiasAdd5conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D:output:0Dconv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*3
_output_shapes!
:€€€€€€€€€(@®
*conv2_plus1d_1/conv3D_2_temporal_conv/ReluRelu6conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd:output:0*
T0*3
_output_shapes!
:€€€€€€€€€(@„
pooling3d_2/MaxPool3D	MaxPool3D8conv2_plus1d_1/conv3D_2_temporal_conv/Relu:activations:0*
T0*3
_output_shapes!
:€€€€€€€€€(@*
ksize	
*
paddingSAME*
strides	
Ћ
:conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOpReadVariableOpCconv2_plus1d_2_conv3d_3_spatial_conv_conv3d_readvariableop_resource*+
_output_shapes
:@А*
dtype0Б
+conv2_plus1d_2/conv3D_3_spatial_conv/Conv3DConv3Dpooling3d_2/MaxPool3D:output:0Bconv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(А*
paddingSAME*
strides	
љ
;conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOpReadVariableOpDconv2_plus1d_2_conv3d_3_spatial_conv_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0с
,conv2_plus1d_2/conv3D_3_spatial_conv/BiasAddBiasAdd4conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D:output:0Cconv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(АІ
)conv2_plus1d_2/conv3D_3_spatial_conv/ReluRelu5conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd:output:0*
T0*4
_output_shapes"
 :€€€€€€€€€(Аќ
;conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpReadVariableOpDconv2_plus1d_2_conv3d_3_temporal_conv_conv3d_readvariableop_resource*,
_output_shapes
:АА*
dtype0Ь
,conv2_plus1d_2/conv3D_3_temporal_conv/Conv3DConv3D7conv2_plus1d_2/conv3D_3_spatial_conv/Relu:activations:0Cconv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(А*
paddingSAME*
strides	
њ
<conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOpReadVariableOpEconv2_plus1d_2_conv3d_3_temporal_conv_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype0ф
-conv2_plus1d_2/conv3D_3_temporal_conv/BiasAddBiasAdd5conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D:output:0Dconv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOp:value:0*
T0*4
_output_shapes"
 :€€€€€€€€€(А©
*conv2_plus1d_2/conv3D_3_temporal_conv/ReluRelu6conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd:output:0*
T0*4
_output_shapes"
 :€€€€€€€€€(АЎ
pooling3d_3/MaxPool3D	MaxPool3D8conv2_plus1d_2/conv3D_3_temporal_conv/Relu:activations:0*
T0*4
_output_shapes"
 :€€€€€€€€€А*
ksize	
*
paddingSAME*
strides	
z
IdentityIdentitypooling3d_3/MaxPool3D:output:0^NoOp*
T0*4
_output_shapes"
 :€€€€€€€€€Аљ
NoOpNoOp:^conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOp9^conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOp;^conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOp:^conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOp<^conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOp;^conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOp=^conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOp<^conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOp<^conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOp;^conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOp=^conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOp<^conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOpJ^spatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpI^spatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*N
_input_shapes=
;:€€€€€€€€€(: : : : : : : : : : : : : : 2v
9conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOp9conv2_plus1d/conv3D_1_spatial_conv/BiasAdd/ReadVariableOp2t
8conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOp8conv2_plus1d/conv3D_1_spatial_conv/Conv3D/ReadVariableOp2x
:conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOp:conv2_plus1d/conv3D_1_temporal_conv/BiasAdd/ReadVariableOp2v
9conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOp9conv2_plus1d/conv3D_1_temporal_conv/Conv3D/ReadVariableOp2z
;conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOp;conv2_plus1d_1/conv3D_2_spatial_conv/BiasAdd/ReadVariableOp2x
:conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOp:conv2_plus1d_1/conv3D_2_spatial_conv/Conv3D/ReadVariableOp2|
<conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOp<conv2_plus1d_1/conv3D_2_temporal_conv/BiasAdd/ReadVariableOp2z
;conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOp;conv2_plus1d_1/conv3D_2_temporal_conv/Conv3D/ReadVariableOp2z
;conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOp;conv2_plus1d_2/conv3D_3_spatial_conv/BiasAdd/ReadVariableOp2x
:conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOp:conv2_plus1d_2/conv3D_3_spatial_conv/Conv3D/ReadVariableOp2|
<conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOp<conv2_plus1d_2/conv3D_3_temporal_conv/BiasAdd/ReadVariableOp2z
;conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOp;conv2_plus1d_2/conv3D_3_temporal_conv/Conv3D/ReadVariableOp2Ц
Ispatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOpIspatial_attention/spatial_attention_attention_conv/BiasAdd/ReadVariableOp2Ф
Hspatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOpHspatial_attention/spatial_attention_attention_conv/Conv3D/ReadVariableOp:[ W
3
_output_shapes!
:€€€€€€€€€(
 
_user_specified_nameinputs
’
Ц
'__inference_dense_1_layer_call_fn_27698

inputs
unknown:	@А
	unknown_0:	А
identityИҐStatefulPartitionedCallя
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *,
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *K
fFRD
B__inference_dense_1_layer_call_and_return_conditional_losses_23741t
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*,
_output_shapes
:€€€€€€€€€А`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:€€€€€€€€€@: : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
√
„
*__inference_sequential_layer_call_fn_23868
dense_1_input
unknown:	@А
	unknown_0:	А
	unknown_1:	А@
	unknown_2:@
identityИҐStatefulPartitionedCallВ
StatefulPartitionedCallStatefulPartitionedCalldense_1_inputunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:€€€€€€€€€@*&
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *N
fIRG
E__inference_sequential_layer_call_and_return_conditional_losses_23844s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:€€€€€€€€€@`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:€€€€€€€€€@: : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Z V
+
_output_shapes
:€€€€€€€€€@
'
_user_specified_namedense_1_input"µ	L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*ґ
serving_defaultҐ
G
input_1<
serving_default_input_1:0€€€€€€€€€(;
dense_60
StatefulPartitionedCall:0€€€€€€€€€
tensorflow/serving/predict:є∆
Ы
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
signatures"
_tf_keras_network
"
_tf_keras_input_layer
С
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
spatial_attention

conv3d
conv3d2
conv3d3
	pooling3d

pooling3d2
 
pooling3d3"
_tf_keras_layer
∞
!	variables
"trainable_variables
#regularization_losses
$	keras_api
%__call__
*&&call_and_return_all_conditional_losses
	'layer"
_tf_keras_layer
∞
(	variables
)trainable_variables
*regularization_losses
+	keras_api
,__call__
*-&call_and_return_all_conditional_losses
	.layer"
_tf_keras_layer
Њ
/	variables
0trainable_variables
1regularization_losses
2	keras_api
3__call__
*4&call_and_return_all_conditional_losses
5position_embeddings"
_tf_keras_layer
ƒ
6	variables
7trainable_variables
8regularization_losses
9	keras_api
:__call__
*;&call_and_return_all_conditional_losses
<	attention
=
dense_proj"
_tf_keras_layer
ƒ
>	variables
?trainable_variables
@regularization_losses
A	keras_api
B__call__
*C&call_and_return_all_conditional_losses
D	attention
E
dense_proj"
_tf_keras_layer
•
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
J__call__
*K&call_and_return_all_conditional_losses"
_tf_keras_layer
ї
L	variables
Mtrainable_variables
Nregularization_losses
O	keras_api
P__call__
*Q&call_and_return_all_conditional_losses

Rkernel
Sbias"
_tf_keras_layer
ї
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses

Zkernel
[bias"
_tf_keras_layer
Г
\0
]1
^2
_3
`4
a5
b6
c7
d8
e9
f10
g11
h12
i13
j14
k15
l16
m17
n18
o19
p20
q21
r22
s23
t24
u25
v26
w27
x28
y29
z30
{31
|32
}33
~34
35
А36
Б37
В38
Г39
Д40
R41
S42
Z43
[44"
trackable_list_wrapper
Г
\0
]1
^2
_3
`4
a5
b6
c7
d8
e9
f10
g11
h12
i13
j14
k15
l16
m17
n18
o19
p20
q21
r22
s23
t24
u25
v26
w27
x28
y29
z30
{31
|32
}33
~34
35
А36
Б37
В38
Г39
Д40
R41
S42
Z43
[44"
trackable_list_wrapper
 "
trackable_list_wrapper
ѕ
Еnon_trainable_variables
Жlayers
Зmetrics
 Иlayer_regularization_losses
Йlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
—
Кtrace_0
Лtrace_1
Мtrace_2
Нtrace_32ё
%__inference_model_layer_call_fn_24616
%__inference_model_layer_call_fn_25796
%__inference_model_layer_call_fn_25891
%__inference_model_layer_call_fn_25384њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zКtrace_0zЛtrace_1zМtrace_2zНtrace_3
љ
Оtrace_0
Пtrace_1
Рtrace_2
Сtrace_32 
@__inference_model_layer_call_and_return_conditional_losses_26204
@__inference_model_layer_call_and_return_conditional_losses_26515
@__inference_model_layer_call_and_return_conditional_losses_25491
@__inference_model_layer_call_and_return_conditional_losses_25598њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zОtrace_0zПtrace_1zРtrace_2zСtrace_3
ЋB»
 __inference__wrapped_model_23514input_1"Ш
С≤Н
FullArgSpec
argsЪ 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ж
	Тiter
Уbeta_1
Фbeta_2

Хdecay
Цlearning_rateRm”Sm‘Zm’[m÷\m„]mЎ^mў_mЏ`mџam№bmЁcmёdmяemаfmбgmвhmгimдjmеkmжlmзmmиnmйomкpmлqmмrmнsmоtmпumрvmсwmтxmуymфzmх{mц|mч}mш~mщmъ	Аmы	Бmь	Вmэ	Гmю	Дm€RvАSvБZvВ[vГ\vД]vЕ^vЖ_vЗ`vИavЙbvКcvЛdvМevНfvОgvПhvРivСjvТkvУlvФmvХnvЦovЧpvШqvЩrvЪsvЫtvЬuvЭvvЮwvЯxv†yv°zvҐ{v£|v§}v•~v¶vІ	Аv®	Бv©	Вv™	ГvЂ	Дvђ"
	optimizer
-
Чserving_default"
signature_map
Ж
\0
]1
^2
_3
`4
a5
b6
c7
d8
e9
f10
g11
h12
i13"
trackable_list_wrapper
Ж
\0
]1
^2
_3
`4
a5
b6
c7
d8
e9
f10
g11
h12
i13"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
Шnon_trainable_variables
Щlayers
Ъmetrics
 Ыlayer_regularization_losses
Ьlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
п
Эtrace_02–
)__inference_encoder3d_layer_call_fn_26548Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЭtrace_0
К
Юtrace_02л
D__inference_encoder3d_layer_call_and_return_conditional_losses_26612Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЮtrace_0
ґ
Я	variables
†trainable_variables
°regularization_losses
Ґ	keras_api
£__call__
+§&call_and_return_all_conditional_losses
	•conv"
_tf_keras_layer
“
¶	variables
Іtrainable_variables
®regularization_losses
©	keras_api
™__call__
+Ђ&call_and_return_all_conditional_losses
ђspatial_conv
≠temporal_conv"
_tf_keras_layer
“
Ѓ	variables
ѓtrainable_variables
∞regularization_losses
±	keras_api
≤__call__
+≥&call_and_return_all_conditional_losses
іspatial_conv
µtemporal_conv"
_tf_keras_layer
“
ґ	variables
Јtrainable_variables
Єregularization_losses
є	keras_api
Ї__call__
+ї&call_and_return_all_conditional_losses
Љspatial_conv
љtemporal_conv"
_tf_keras_layer
Ђ
Њ	variables
њtrainable_variables
јregularization_losses
Ѕ	keras_api
¬__call__
+√&call_and_return_all_conditional_losses"
_tf_keras_layer
Ђ
ƒ	variables
≈trainable_variables
∆regularization_losses
«	keras_api
»__call__
+…&call_and_return_all_conditional_losses"
_tf_keras_layer
Ђ
 	variables
Ћtrainable_variables
ћregularization_losses
Ќ	keras_api
ќ__call__
+ѕ&call_and_return_all_conditional_losses"
_tf_keras_layer
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
–non_trainable_variables
—layers
“metrics
 ”layer_regularization_losses
‘layer_metrics
!	variables
"trainable_variables
#regularization_losses
%__call__
*&&call_and_return_all_conditional_losses
&&"call_and_return_conditional_losses"
_generic_user_object
б
’trace_0
÷trace_12¶
0__inference_time_distributed_layer_call_fn_26617
0__inference_time_distributed_layer_call_fn_26622њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z’trace_0z÷trace_1
Ч
„trace_0
Ўtrace_12№
K__inference_time_distributed_layer_call_and_return_conditional_losses_26639
K__inference_time_distributed_layer_call_and_return_conditional_losses_26656њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z„trace_0zЎtrace_1
Ђ
ў	variables
Џtrainable_variables
џregularization_losses
№	keras_api
Ё__call__
+ё&call_and_return_all_conditional_losses"
_tf_keras_layer
.
j0
k1"
trackable_list_wrapper
.
j0
k1"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
яnon_trainable_variables
аlayers
бmetrics
 вlayer_regularization_losses
гlayer_metrics
(	variables
)trainable_variables
*regularization_losses
,__call__
*-&call_and_return_all_conditional_losses
&-"call_and_return_conditional_losses"
_generic_user_object
е
дtrace_0
еtrace_12™
2__inference_time_distributed_1_layer_call_fn_26665
2__inference_time_distributed_1_layer_call_fn_26674њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zдtrace_0zеtrace_1
Ы
жtrace_0
зtrace_12а
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_26703
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_26732њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zжtrace_0zзtrace_1
Ѕ
и	variables
йtrainable_variables
кregularization_losses
л	keras_api
м__call__
+н&call_and_return_all_conditional_losses

jkernel
kbias"
_tf_keras_layer
'
l0"
trackable_list_wrapper
'
l0"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
оnon_trainable_variables
пlayers
рmetrics
 сlayer_regularization_losses
тlayer_metrics
/	variables
0trainable_variables
1regularization_losses
3__call__
*4&call_and_return_all_conditional_losses
&4"call_and_return_conditional_losses"
_generic_user_object
ю
уtrace_02я
8__inference_frame_position_embedding_layer_call_fn_26739Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zуtrace_0
Щ
фtrace_02ъ
S__inference_frame_position_embedding_layer_call_and_return_conditional_losses_26757Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zфtrace_0
ї
х	variables
цtrainable_variables
чregularization_losses
ш	keras_api
щ__call__
+ъ&call_and_return_all_conditional_losses
l
embeddings"
_tf_keras_layer
v
m0
n1
o2
p3
q4
r5
s6
t7
u8
v9
w10
x11"
trackable_list_wrapper
v
m0
n1
o2
p3
q4
r5
s6
t7
u8
v9
w10
x11"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
ыnon_trainable_variables
ьlayers
эmetrics
 юlayer_regularization_losses
€layer_metrics
6	variables
7trainable_variables
8regularization_losses
:__call__
*;&call_and_return_all_conditional_losses
&;"call_and_return_conditional_losses"
_generic_user_object
ф
Аtrace_0
Бtrace_12є
3__inference_transformer_layer_1_layer_call_fn_26786
3__inference_transformer_layer_1_layer_call_fn_26815ћ
√≤њ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ

jtraining%
kwonlydefaults™

trainingp 
annotations™ *
 zАtrace_0zБtrace_1
™
Вtrace_0
Гtrace_12п
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_26911
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_27006ћ
√≤њ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ

jtraining%
kwonlydefaults™

trainingp 
annotations™ *
 zВtrace_0zГtrace_1
Ъ
Д	variables
Еtrainable_variables
Жregularization_losses
З	keras_api
И__call__
+Й&call_and_return_all_conditional_losses
К_query_dense
Л
_key_dense
М_value_dense
Н_softmax
О_dropout_layer
П_output_dense"
_tf_keras_layer
В
Рlayer_with_weights-0
Рlayer-0
Сlayer_with_weights-1
Сlayer-1
Т	variables
Уtrainable_variables
Фregularization_losses
Х	keras_api
Ц__call__
+Ч&call_and_return_all_conditional_losses"
_tf_keras_sequential
{
y0
z1
{2
|3
}4
~5
6
А7
Б8
В9
Г10
Д11"
trackable_list_wrapper
{
y0
z1
{2
|3
}4
~5
6
А7
Б8
В9
Г10
Д11"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
Шnon_trainable_variables
Щlayers
Ъmetrics
 Ыlayer_regularization_losses
Ьlayer_metrics
>	variables
?trainable_variables
@regularization_losses
B__call__
*C&call_and_return_all_conditional_losses
&C"call_and_return_conditional_losses"
_generic_user_object
ф
Эtrace_0
Юtrace_12є
3__inference_transformer_layer_2_layer_call_fn_27035
3__inference_transformer_layer_2_layer_call_fn_27064ћ
√≤њ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ

jtraining%
kwonlydefaults™

trainingp 
annotations™ *
 zЭtrace_0zЮtrace_1
™
Яtrace_0
†trace_12п
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_27160
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_27255ћ
√≤њ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ

jtraining%
kwonlydefaults™

trainingp 
annotations™ *
 zЯtrace_0z†trace_1
Ъ
°	variables
Ґtrainable_variables
£regularization_losses
§	keras_api
•__call__
+¶&call_and_return_all_conditional_losses
І_query_dense
®
_key_dense
©_value_dense
™_softmax
Ђ_dropout_layer
ђ_output_dense"
_tf_keras_layer
В
≠layer_with_weights-0
≠layer-0
Ѓlayer_with_weights-1
Ѓlayer-1
ѓ	variables
∞trainable_variables
±regularization_losses
≤	keras_api
≥__call__
+і&call_and_return_all_conditional_losses"
_tf_keras_sequential
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
≤
µnon_trainable_variables
ґlayers
Јmetrics
 Єlayer_regularization_losses
єlayer_metrics
F	variables
Gtrainable_variables
Hregularization_losses
J__call__
*K&call_and_return_all_conditional_losses
&K"call_and_return_conditional_losses"
_generic_user_object
п
Їtrace_02–
)__inference_flatten_1_layer_call_fn_27260Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЇtrace_0
К
їtrace_02л
D__inference_flatten_1_layer_call_and_return_conditional_losses_27266Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zїtrace_0
.
R0
S1"
trackable_list_wrapper
.
R0
S1"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
Љnon_trainable_variables
љlayers
Њmetrics
 њlayer_regularization_losses
јlayer_metrics
L	variables
Mtrainable_variables
Nregularization_losses
P__call__
*Q&call_and_return_all_conditional_losses
&Q"call_and_return_conditional_losses"
_generic_user_object
н
Ѕtrace_02ќ
'__inference_dense_5_layer_call_fn_27275Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЅtrace_0
И
¬trace_02й
B__inference_dense_5_layer_call_and_return_conditional_losses_27293Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z¬trace_0
!:	А
@2dense_5/kernel
:@2dense_5/bias
.
Z0
[1"
trackable_list_wrapper
.
Z0
[1"
trackable_list_wrapper
 "
trackable_list_wrapper
≤
√non_trainable_variables
ƒlayers
≈metrics
 ∆layer_regularization_losses
«layer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses"
_generic_user_object
н
»trace_02ќ
'__inference_dense_6_layer_call_fn_27302Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z»trace_0
И
…trace_02й
B__inference_dense_6_layer_call_and_return_conditional_losses_27313Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z…trace_0
 :@
2dense_6/kernel
:
2dense_6/bias
a:_2Cencoder3d/spatial_attention/spatial_attention_attention_conv/kernel
O:M2Aencoder3d/spatial_attention/spatial_attention_attention_conv/bias
Q:O 23encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel
?:= 21encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias
R:P  24encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel
@:> 22encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias
S:Q @25encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel
A:?@23encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias
T:R@@26encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel
B:@@24encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias
T:R@А25encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel
B:@А23encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias
V:TАА26encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel
C:AА24encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias
,:*	А@2time_distributed_1/kernel
%:#@2time_distributed_1/bias
?:=@2-frame_position_embedding/embedding/embeddings
K:I@@25transformer_layer_1/multi_head_attention/query/kernel
E:C@23transformer_layer_1/multi_head_attention/query/bias
I:G@@23transformer_layer_1/multi_head_attention/key/kernel
C:A@21transformer_layer_1/multi_head_attention/key/bias
K:I@@25transformer_layer_1/multi_head_attention/value/kernel
E:C@23transformer_layer_1/multi_head_attention/value/bias
V:T@@2@transformer_layer_1/multi_head_attention/attention_output/kernel
L:J@2>transformer_layer_1/multi_head_attention/attention_output/bias
!:	@А2dense_1/kernel
:А2dense_1/bias
!:	А@2dense_2/kernel
:@2dense_2/bias
M:K@@27transformer_layer_2/multi_head_attention_1/query/kernel
G:E@25transformer_layer_2/multi_head_attention_1/query/bias
K:I@@25transformer_layer_2/multi_head_attention_1/key/kernel
E:C@23transformer_layer_2/multi_head_attention_1/key/bias
M:K@@27transformer_layer_2/multi_head_attention_1/value/kernel
G:E@25transformer_layer_2/multi_head_attention_1/value/bias
X:V@@2Btransformer_layer_2/multi_head_attention_1/attention_output/kernel
N:L@2@transformer_layer_2/multi_head_attention_1/attention_output/bias
!:	@А2dense_3/kernel
:А2dense_3/bias
!:	А@2dense_4/kernel
:@2dense_4/bias
 "
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
 0
Ћ1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
чBф
%__inference_model_layer_call_fn_24616input_1"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
%__inference_model_layer_call_fn_25796inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
%__inference_model_layer_call_fn_25891inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
чBф
%__inference_model_layer_call_fn_25384input_1"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
СBО
@__inference_model_layer_call_and_return_conditional_losses_26204inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
СBО
@__inference_model_layer_call_and_return_conditional_losses_26515inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ТBП
@__inference_model_layer_call_and_return_conditional_losses_25491input_1"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ТBП
@__inference_model_layer_call_and_return_conditional_losses_25598input_1"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
 B«
#__inference_signature_wrapper_25701input_1"Ф
Н≤Й
FullArgSpec
argsЪ 
varargs
 
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
Q
0
1
2
3
4
5
 6"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ЁBЏ
)__inference_encoder3d_layer_call_fn_26548inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
шBх
D__inference_encoder3d_layer_call_and_return_conditional_losses_26612inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
.
\0
]1"
trackable_list_wrapper
.
\0
]1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
ћnon_trainable_variables
Ќlayers
ќmetrics
 ѕlayer_regularization_losses
–layer_metrics
Я	variables
†trainable_variables
°regularization_losses
£__call__
+§&call_and_return_all_conditional_losses
'§"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
д
—	variables
“trainable_variables
”regularization_losses
‘	keras_api
’__call__
+÷&call_and_return_all_conditional_losses

\kernel
]bias
!„_jit_compiled_convolution_op"
_tf_keras_layer
<
^0
_1
`2
a3"
trackable_list_wrapper
<
^0
_1
`2
a3"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Ўnon_trainable_variables
ўlayers
Џmetrics
 џlayer_regularization_losses
№layer_metrics
¶	variables
Іtrainable_variables
®regularization_losses
™__call__
+Ђ&call_and_return_all_conditional_losses
'Ђ"call_and_return_conditional_losses"
_generic_user_object
£2†Э
Ф≤Р
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
£2†Э
Ф≤Р
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
д
Ё	variables
ёtrainable_variables
яregularization_losses
а	keras_api
б__call__
+в&call_and_return_all_conditional_losses

^kernel
_bias
!г_jit_compiled_convolution_op"
_tf_keras_layer
д
д	variables
еtrainable_variables
жregularization_losses
з	keras_api
и__call__
+й&call_and_return_all_conditional_losses

`kernel
abias
!к_jit_compiled_convolution_op"
_tf_keras_layer
<
b0
c1
d2
e3"
trackable_list_wrapper
<
b0
c1
d2
e3"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
лnon_trainable_variables
мlayers
нmetrics
 оlayer_regularization_losses
пlayer_metrics
Ѓ	variables
ѓtrainable_variables
∞regularization_losses
≤__call__
+≥&call_and_return_all_conditional_losses
'≥"call_and_return_conditional_losses"
_generic_user_object
£2†Э
Ф≤Р
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
£2†Э
Ф≤Р
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
д
р	variables
сtrainable_variables
тregularization_losses
у	keras_api
ф__call__
+х&call_and_return_all_conditional_losses

bkernel
cbias
!ц_jit_compiled_convolution_op"
_tf_keras_layer
д
ч	variables
шtrainable_variables
щregularization_losses
ъ	keras_api
ы__call__
+ь&call_and_return_all_conditional_losses

dkernel
ebias
!э_jit_compiled_convolution_op"
_tf_keras_layer
<
f0
g1
h2
i3"
trackable_list_wrapper
<
f0
g1
h2
i3"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
юnon_trainable_variables
€layers
Аmetrics
 Бlayer_regularization_losses
Вlayer_metrics
ґ	variables
Јtrainable_variables
Єregularization_losses
Ї__call__
+ї&call_and_return_all_conditional_losses
'ї"call_and_return_conditional_losses"
_generic_user_object
£2†Э
Ф≤Р
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
£2†Э
Ф≤Р
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
д
Г	variables
Дtrainable_variables
Еregularization_losses
Ж	keras_api
З__call__
+И&call_and_return_all_conditional_losses

fkernel
gbias
!Й_jit_compiled_convolution_op"
_tf_keras_layer
д
К	variables
Лtrainable_variables
Мregularization_losses
Н	keras_api
О__call__
+П&call_and_return_all_conditional_losses

hkernel
ibias
!Р_jit_compiled_convolution_op"
_tf_keras_layer
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Сnon_trainable_variables
Тlayers
Уmetrics
 Фlayer_regularization_losses
Хlayer_metrics
Њ	variables
њtrainable_variables
јregularization_losses
¬__call__
+√&call_and_return_all_conditional_losses
'√"call_and_return_conditional_losses"
_generic_user_object
с
Цtrace_02“
+__inference_pooling3d_1_layer_call_fn_27318Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЦtrace_0
М
Чtrace_02н
F__inference_pooling3d_1_layer_call_and_return_conditional_losses_27323Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЧtrace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Шnon_trainable_variables
Щlayers
Ъmetrics
 Ыlayer_regularization_losses
Ьlayer_metrics
ƒ	variables
≈trainable_variables
∆regularization_losses
»__call__
+…&call_and_return_all_conditional_losses
'…"call_and_return_conditional_losses"
_generic_user_object
с
Эtrace_02“
+__inference_pooling3d_2_layer_call_fn_27328Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЭtrace_0
М
Юtrace_02н
F__inference_pooling3d_2_layer_call_and_return_conditional_losses_27333Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЮtrace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Яnon_trainable_variables
†layers
°metrics
 Ґlayer_regularization_losses
£layer_metrics
 	variables
Ћtrainable_variables
ћregularization_losses
ќ__call__
+ѕ&call_and_return_all_conditional_losses
'ѕ"call_and_return_conditional_losses"
_generic_user_object
с
§trace_02“
+__inference_pooling3d_3_layer_call_fn_27338Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z§trace_0
М
•trace_02н
F__inference_pooling3d_3_layer_call_and_return_conditional_losses_27343Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z•trace_0
 "
trackable_list_wrapper
'
'0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
БBю
0__inference_time_distributed_layer_call_fn_26617inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
БBю
0__inference_time_distributed_layer_call_fn_26622inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЬBЩ
K__inference_time_distributed_layer_call_and_return_conditional_losses_26639inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЬBЩ
K__inference_time_distributed_layer_call_and_return_conditional_losses_26656inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Є
¶non_trainable_variables
Іlayers
®metrics
 ©layer_regularization_losses
™layer_metrics
ў	variables
Џtrainable_variables
џregularization_losses
Ё__call__
+ё&call_and_return_all_conditional_losses
'ё"call_and_return_conditional_losses"
_generic_user_object
н
Ђtrace_02ќ
'__inference_flatten_layer_call_fn_27348Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЂtrace_0
И
ђtrace_02й
B__inference_flatten_layer_call_and_return_conditional_losses_27354Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zђtrace_0
 "
trackable_list_wrapper
'
.0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ГBА
2__inference_time_distributed_1_layer_call_fn_26665inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ГBА
2__inference_time_distributed_1_layer_call_fn_26674inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЮBЫ
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_26703inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЮBЫ
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_26732inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
.
j0
k1"
trackable_list_wrapper
.
j0
k1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
≠non_trainable_variables
Ѓlayers
ѓmetrics
 ∞layer_regularization_losses
±layer_metrics
и	variables
йtrainable_variables
кregularization_losses
м__call__
+н&call_and_return_all_conditional_losses
'н"call_and_return_conditional_losses"
_generic_user_object
л
≤trace_02ћ
%__inference_dense_layer_call_fn_27363Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z≤trace_0
Ж
≥trace_02з
@__inference_dense_layer_call_and_return_conditional_losses_27381Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z≥trace_0
 "
trackable_list_wrapper
'
50"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
мBй
8__inference_frame_position_embedding_layer_call_fn_26739inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЗBД
S__inference_frame_position_embedding_layer_call_and_return_conditional_losses_26757inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
'
l0"
trackable_list_wrapper
'
l0"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
іnon_trainable_variables
µlayers
ґmetrics
 Јlayer_regularization_losses
Єlayer_metrics
х	variables
цtrainable_variables
чregularization_losses
щ__call__
+ъ&call_and_return_all_conditional_losses
'ъ"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
.
<0
=1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
СBО
3__inference_transformer_layer_1_layer_call_fn_26786inputs"ћ
√≤њ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ

jtraining%
kwonlydefaults™

trainingp 
annotations™ *
 
СBО
3__inference_transformer_layer_1_layer_call_fn_26815inputs"ћ
√≤њ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ

jtraining%
kwonlydefaults™

trainingp 
annotations™ *
 
ђB©
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_26911inputs"ћ
√≤њ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ

jtraining%
kwonlydefaults™

trainingp 
annotations™ *
 
ђB©
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_27006inputs"ћ
√≤њ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ

jtraining%
kwonlydefaults™

trainingp 
annotations™ *
 
X
m0
n1
o2
p3
q4
r5
s6
t7"
trackable_list_wrapper
X
m0
n1
o2
p3
q4
r5
s6
t7"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
єnon_trainable_variables
Їlayers
їmetrics
 Љlayer_regularization_losses
љlayer_metrics
Д	variables
Еtrainable_variables
Жregularization_losses
И__call__
+Й&call_and_return_all_conditional_losses
'Й"call_and_return_conditional_losses"
_generic_user_object
Ш2ХТ
Й≤Е
FullArgSpecx
argspЪm
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
defaultsЪ

 

 
p 
p 
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
Ш2ХТ
Й≤Е
FullArgSpecx
argspЪm
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
defaultsЪ

 

 
p 
p 
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ф
Њ	variables
њtrainable_variables
јregularization_losses
Ѕ	keras_api
¬__call__
+√&call_and_return_all_conditional_losses
ƒpartial_output_shape
≈full_output_shape

mkernel
nbias"
_tf_keras_layer
ф
∆	variables
«trainable_variables
»regularization_losses
…	keras_api
 __call__
+Ћ&call_and_return_all_conditional_losses
ћpartial_output_shape
Ќfull_output_shape

okernel
pbias"
_tf_keras_layer
ф
ќ	variables
ѕtrainable_variables
–regularization_losses
—	keras_api
“__call__
+”&call_and_return_all_conditional_losses
‘partial_output_shape
’full_output_shape

qkernel
rbias"
_tf_keras_layer
Ђ
÷	variables
„trainable_variables
Ўregularization_losses
ў	keras_api
Џ__call__
+џ&call_and_return_all_conditional_losses"
_tf_keras_layer
√
№	variables
Ёtrainable_variables
ёregularization_losses
я	keras_api
а__call__
+б&call_and_return_all_conditional_losses
в_random_generator"
_tf_keras_layer
ф
г	variables
дtrainable_variables
еregularization_losses
ж	keras_api
з__call__
+и&call_and_return_all_conditional_losses
йpartial_output_shape
кfull_output_shape

skernel
tbias"
_tf_keras_layer
Ѕ
л	variables
мtrainable_variables
нregularization_losses
о	keras_api
п__call__
+р&call_and_return_all_conditional_losses

ukernel
vbias"
_tf_keras_layer
Ѕ
с	variables
тtrainable_variables
уregularization_losses
ф	keras_api
х__call__
+ц&call_and_return_all_conditional_losses

wkernel
xbias"
_tf_keras_layer
<
u0
v1
w2
x3"
trackable_list_wrapper
<
u0
v1
w2
x3"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
чnon_trainable_variables
шlayers
щmetrics
 ъlayer_regularization_losses
ыlayer_metrics
Т	variables
Уtrainable_variables
Фregularization_losses
Ц__call__
+Ч&call_and_return_all_conditional_losses
'Ч"call_and_return_conditional_losses"
_generic_user_object
е
ьtrace_0
эtrace_1
юtrace_2
€trace_32т
*__inference_sequential_layer_call_fn_23795
*__inference_sequential_layer_call_fn_27394
*__inference_sequential_layer_call_fn_27407
*__inference_sequential_layer_call_fn_23868њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zьtrace_0zэtrace_1zюtrace_2z€trace_3
—
Аtrace_0
Бtrace_1
Вtrace_2
Гtrace_32ё
E__inference_sequential_layer_call_and_return_conditional_losses_27471
E__inference_sequential_layer_call_and_return_conditional_losses_27535
E__inference_sequential_layer_call_and_return_conditional_losses_23882
E__inference_sequential_layer_call_and_return_conditional_losses_23896њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zАtrace_0zБtrace_1zВtrace_2zГtrace_3
 "
trackable_list_wrapper
.
D0
E1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
СBО
3__inference_transformer_layer_2_layer_call_fn_27035inputs"ћ
√≤њ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ

jtraining%
kwonlydefaults™

trainingp 
annotations™ *
 
СBО
3__inference_transformer_layer_2_layer_call_fn_27064inputs"ћ
√≤њ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ

jtraining%
kwonlydefaults™

trainingp 
annotations™ *
 
ђB©
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_27160inputs"ћ
√≤њ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ

jtraining%
kwonlydefaults™

trainingp 
annotations™ *
 
ђB©
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_27255inputs"ћ
√≤њ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ

jtraining%
kwonlydefaults™

trainingp 
annotations™ *
 
Y
y0
z1
{2
|3
}4
~5
6
А7"
trackable_list_wrapper
Y
y0
z1
{2
|3
}4
~5
6
А7"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Дnon_trainable_variables
Еlayers
Жmetrics
 Зlayer_regularization_losses
Иlayer_metrics
°	variables
Ґtrainable_variables
£regularization_losses
•__call__
+¶&call_and_return_all_conditional_losses
'¶"call_and_return_conditional_losses"
_generic_user_object
Ш2ХТ
Й≤Е
FullArgSpecx
argspЪm
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
defaultsЪ

 

 
p 
p 
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
Ш2ХТ
Й≤Е
FullArgSpecx
argspЪm
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
defaultsЪ

 

 
p 
p 
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ф
Й	variables
Кtrainable_variables
Лregularization_losses
М	keras_api
Н__call__
+О&call_and_return_all_conditional_losses
Пpartial_output_shape
Рfull_output_shape

ykernel
zbias"
_tf_keras_layer
ф
С	variables
Тtrainable_variables
Уregularization_losses
Ф	keras_api
Х__call__
+Ц&call_and_return_all_conditional_losses
Чpartial_output_shape
Шfull_output_shape

{kernel
|bias"
_tf_keras_layer
ф
Щ	variables
Ъtrainable_variables
Ыregularization_losses
Ь	keras_api
Э__call__
+Ю&call_and_return_all_conditional_losses
Яpartial_output_shape
†full_output_shape

}kernel
~bias"
_tf_keras_layer
Ђ
°	variables
Ґtrainable_variables
£regularization_losses
§	keras_api
•__call__
+¶&call_and_return_all_conditional_losses"
_tf_keras_layer
√
І	variables
®trainable_variables
©regularization_losses
™	keras_api
Ђ__call__
+ђ&call_and_return_all_conditional_losses
≠_random_generator"
_tf_keras_layer
х
Ѓ	variables
ѓtrainable_variables
∞regularization_losses
±	keras_api
≤__call__
+≥&call_and_return_all_conditional_losses
іpartial_output_shape
µfull_output_shape

kernel
	Аbias"
_tf_keras_layer
√
ґ	variables
Јtrainable_variables
Єregularization_losses
є	keras_api
Ї__call__
+ї&call_and_return_all_conditional_losses
Бkernel
	Вbias"
_tf_keras_layer
√
Љ	variables
љtrainable_variables
Њregularization_losses
њ	keras_api
ј__call__
+Ѕ&call_and_return_all_conditional_losses
Гkernel
	Дbias"
_tf_keras_layer
@
Б0
В1
Г2
Д3"
trackable_list_wrapper
@
Б0
В1
Г2
Д3"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
¬non_trainable_variables
√layers
ƒmetrics
 ≈layer_regularization_losses
∆layer_metrics
ѓ	variables
∞trainable_variables
±regularization_losses
≥__call__
+і&call_and_return_all_conditional_losses
'і"call_and_return_conditional_losses"
_generic_user_object
н
«trace_0
»trace_1
…trace_2
 trace_32ъ
,__inference_sequential_1_layer_call_fn_23995
,__inference_sequential_1_layer_call_fn_27548
,__inference_sequential_1_layer_call_fn_27561
,__inference_sequential_1_layer_call_fn_24068њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z«trace_0z»trace_1z…trace_2z trace_3
ў
Ћtrace_0
ћtrace_1
Ќtrace_2
ќtrace_32ж
G__inference_sequential_1_layer_call_and_return_conditional_losses_27625
G__inference_sequential_1_layer_call_and_return_conditional_losses_27689
G__inference_sequential_1_layer_call_and_return_conditional_losses_24082
G__inference_sequential_1_layer_call_and_return_conditional_losses_24096њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЋtrace_0zћtrace_1zЌtrace_2zќtrace_3
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
ЁBЏ
)__inference_flatten_1_layer_call_fn_27260inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
шBх
D__inference_flatten_1_layer_call_and_return_conditional_losses_27266inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
џBЎ
'__inference_dense_5_layer_call_fn_27275inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
B__inference_dense_5_layer_call_and_return_conditional_losses_27293inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
џBЎ
'__inference_dense_6_layer_call_fn_27302inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
B__inference_dense_6_layer_call_and_return_conditional_losses_27313inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
R
ѕ	variables
–	keras_api

—total

“count"
_tf_keras_metric
c
”	variables
‘	keras_api

’total

÷count
„
_fn_kwargs"
_tf_keras_metric
 "
trackable_list_wrapper
(
•0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
\0
]1"
trackable_list_wrapper
.
\0
]1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Ўnon_trainable_variables
ўlayers
Џmetrics
 џlayer_regularization_losses
№layer_metrics
—	variables
“trainable_variables
”regularization_losses
’__call__
+÷&call_and_return_all_conditional_losses
'÷"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
і2±Ѓ
£≤Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
 "
trackable_list_wrapper
0
ђ0
≠1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
^0
_1"
trackable_list_wrapper
.
^0
_1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Ёnon_trainable_variables
ёlayers
яmetrics
 аlayer_regularization_losses
бlayer_metrics
Ё	variables
ёtrainable_variables
яregularization_losses
б__call__
+в&call_and_return_all_conditional_losses
'в"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
і2±Ѓ
£≤Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
.
`0
a1"
trackable_list_wrapper
.
`0
a1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
вnon_trainable_variables
гlayers
дmetrics
 еlayer_regularization_losses
жlayer_metrics
д	variables
еtrainable_variables
жregularization_losses
и__call__
+й&call_and_return_all_conditional_losses
'й"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
і2±Ѓ
£≤Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
 "
trackable_list_wrapper
0
і0
µ1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
b0
c1"
trackable_list_wrapper
.
b0
c1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
зnon_trainable_variables
иlayers
йmetrics
 кlayer_regularization_losses
лlayer_metrics
р	variables
сtrainable_variables
тregularization_losses
ф__call__
+х&call_and_return_all_conditional_losses
'х"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
і2±Ѓ
£≤Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
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
Є
мnon_trainable_variables
нlayers
оmetrics
 пlayer_regularization_losses
рlayer_metrics
ч	variables
шtrainable_variables
щregularization_losses
ы__call__
+ь&call_and_return_all_conditional_losses
'ь"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
і2±Ѓ
£≤Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
 "
trackable_list_wrapper
0
Љ0
љ1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
f0
g1"
trackable_list_wrapper
.
f0
g1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
сnon_trainable_variables
тlayers
уmetrics
 фlayer_regularization_losses
хlayer_metrics
Г	variables
Дtrainable_variables
Еregularization_losses
З__call__
+И&call_and_return_all_conditional_losses
'И"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
і2±Ѓ
£≤Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
.
h0
i1"
trackable_list_wrapper
.
h0
i1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
цnon_trainable_variables
чlayers
шmetrics
 щlayer_regularization_losses
ъlayer_metrics
К	variables
Лtrainable_variables
Мregularization_losses
О__call__
+П&call_and_return_all_conditional_losses
'П"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
і2±Ѓ
£≤Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 0
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
яB№
+__inference_pooling3d_1_layer_call_fn_27318inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ъBч
F__inference_pooling3d_1_layer_call_and_return_conditional_losses_27323inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
яB№
+__inference_pooling3d_2_layer_call_fn_27328inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ъBч
F__inference_pooling3d_2_layer_call_and_return_conditional_losses_27333inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
яB№
+__inference_pooling3d_3_layer_call_fn_27338inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ъBч
F__inference_pooling3d_3_layer_call_and_return_conditional_losses_27343inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
џBЎ
'__inference_flatten_layer_call_fn_27348inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
B__inference_flatten_layer_call_and_return_conditional_losses_27354inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
ўB÷
%__inference_dense_layer_call_fn_27363inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
фBс
@__inference_dense_layer_call_and_return_conditional_losses_27381inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
 "
trackable_list_wrapper
P
К0
Л1
М2
Н3
О4
П5"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
m0
n1"
trackable_list_wrapper
.
m0
n1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
ыnon_trainable_variables
ьlayers
эmetrics
 юlayer_regularization_losses
€layer_metrics
Њ	variables
њtrainable_variables
јregularization_losses
¬__call__
+√&call_and_return_all_conditional_losses
'√"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
.
o0
p1"
trackable_list_wrapper
.
o0
p1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Аnon_trainable_variables
Бlayers
Вmetrics
 Гlayer_regularization_losses
Дlayer_metrics
∆	variables
«trainable_variables
»regularization_losses
 __call__
+Ћ&call_and_return_all_conditional_losses
'Ћ"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
.
q0
r1"
trackable_list_wrapper
.
q0
r1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Еnon_trainable_variables
Жlayers
Зmetrics
 Иlayer_regularization_losses
Йlayer_metrics
ќ	variables
ѕtrainable_variables
–regularization_losses
“__call__
+”&call_and_return_all_conditional_losses
'”"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
trackable_list_wrapper
Є
Кnon_trainable_variables
Лlayers
Мmetrics
 Нlayer_regularization_losses
Оlayer_metrics
÷	variables
„trainable_variables
Ўregularization_losses
Џ__call__
+џ&call_and_return_all_conditional_losses
'џ"call_and_return_conditional_losses"
_generic_user_object
µ2≤ѓ
¶≤Ґ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
µ2≤ѓ
¶≤Ґ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Пnon_trainable_variables
Рlayers
Сmetrics
 Тlayer_regularization_losses
Уlayer_metrics
№	variables
Ёtrainable_variables
ёregularization_losses
а__call__
+б&call_and_return_all_conditional_losses
'б"call_and_return_conditional_losses"
_generic_user_object
є2ґ≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
є2ґ≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
"
_generic_user_object
.
s0
t1"
trackable_list_wrapper
.
s0
t1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Фnon_trainable_variables
Хlayers
Цmetrics
 Чlayer_regularization_losses
Шlayer_metrics
г	variables
дtrainable_variables
еregularization_losses
з__call__
+и&call_and_return_all_conditional_losses
'и"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
.
u0
v1"
trackable_list_wrapper
.
u0
v1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Щnon_trainable_variables
Ъlayers
Ыmetrics
 Ьlayer_regularization_losses
Эlayer_metrics
л	variables
мtrainable_variables
нregularization_losses
п__call__
+р&call_and_return_all_conditional_losses
'р"call_and_return_conditional_losses"
_generic_user_object
н
Юtrace_02ќ
'__inference_dense_1_layer_call_fn_27698Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЮtrace_0
И
Яtrace_02й
B__inference_dense_1_layer_call_and_return_conditional_losses_27736Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЯtrace_0
.
w0
x1"
trackable_list_wrapper
.
w0
x1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
†non_trainable_variables
°layers
Ґmetrics
 £layer_regularization_losses
§layer_metrics
с	variables
тtrainable_variables
уregularization_losses
х__call__
+ц&call_and_return_all_conditional_losses
'ц"call_and_return_conditional_losses"
_generic_user_object
н
•trace_02ќ
'__inference_dense_2_layer_call_fn_27745Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z•trace_0
И
¶trace_02й
B__inference_dense_2_layer_call_and_return_conditional_losses_27775Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z¶trace_0
 "
trackable_list_wrapper
0
Р0
С1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ВB€
*__inference_sequential_layer_call_fn_23795dense_1_input"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ыBш
*__inference_sequential_layer_call_fn_27394inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ыBш
*__inference_sequential_layer_call_fn_27407inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ВB€
*__inference_sequential_layer_call_fn_23868dense_1_input"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
E__inference_sequential_layer_call_and_return_conditional_losses_27471inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЦBУ
E__inference_sequential_layer_call_and_return_conditional_losses_27535inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЭBЪ
E__inference_sequential_layer_call_and_return_conditional_losses_23882dense_1_input"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЭBЪ
E__inference_sequential_layer_call_and_return_conditional_losses_23896dense_1_input"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
P
І0
®1
©2
™3
Ђ4
ђ5"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
.
y0
z1"
trackable_list_wrapper
.
y0
z1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
Іnon_trainable_variables
®layers
©metrics
 ™layer_regularization_losses
Ђlayer_metrics
Й	variables
Кtrainable_variables
Лregularization_losses
Н__call__
+О&call_and_return_all_conditional_losses
'О"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
.
{0
|1"
trackable_list_wrapper
.
{0
|1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
ђnon_trainable_variables
≠layers
Ѓmetrics
 ѓlayer_regularization_losses
∞layer_metrics
С	variables
Тtrainable_variables
Уregularization_losses
Х__call__
+Ц&call_and_return_all_conditional_losses
'Ц"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
.
}0
~1"
trackable_list_wrapper
.
}0
~1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
±non_trainable_variables
≤layers
≥metrics
 іlayer_regularization_losses
µlayer_metrics
Щ	variables
Ъtrainable_variables
Ыregularization_losses
Э__call__
+Ю&call_and_return_all_conditional_losses
'Ю"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
trackable_list_wrapper
Є
ґnon_trainable_variables
Јlayers
Єmetrics
 єlayer_regularization_losses
Їlayer_metrics
°	variables
Ґtrainable_variables
£regularization_losses
•__call__
+¶&call_and_return_all_conditional_losses
'¶"call_and_return_conditional_losses"
_generic_user_object
µ2≤ѓ
¶≤Ґ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
µ2≤ѓ
¶≤Ґ
FullArgSpec%
argsЪ
jself
jinputs
jmask
varargs
 
varkw
 
defaultsҐ

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
Є
їnon_trainable_variables
Љlayers
љmetrics
 Њlayer_regularization_losses
њlayer_metrics
І	variables
®trainable_variables
©regularization_losses
Ђ__call__
+ђ&call_and_return_all_conditional_losses
'ђ"call_and_return_conditional_losses"
_generic_user_object
є2ґ≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
є2ґ≥
™≤¶
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
"
_generic_user_object
/
0
А1"
trackable_list_wrapper
/
0
А1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
јnon_trainable_variables
Ѕlayers
¬metrics
 √layer_regularization_losses
ƒlayer_metrics
Ѓ	variables
ѓtrainable_variables
∞regularization_losses
≤__call__
+≥&call_and_return_all_conditional_losses
'≥"call_and_return_conditional_losses"
_generic_user_object
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
®2•Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
0
Б0
В1"
trackable_list_wrapper
0
Б0
В1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
≈non_trainable_variables
∆layers
«metrics
 »layer_regularization_losses
…layer_metrics
ґ	variables
Јtrainable_variables
Єregularization_losses
Ї__call__
+ї&call_and_return_all_conditional_losses
'ї"call_and_return_conditional_losses"
_generic_user_object
н
 trace_02ќ
'__inference_dense_3_layer_call_fn_27784Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z trace_0
И
Ћtrace_02й
B__inference_dense_3_layer_call_and_return_conditional_losses_27822Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 zЋtrace_0
0
Г0
Д1"
trackable_list_wrapper
0
Г0
Д1"
trackable_list_wrapper
 "
trackable_list_wrapper
Є
ћnon_trainable_variables
Ќlayers
ќmetrics
 ѕlayer_regularization_losses
–layer_metrics
Љ	variables
љtrainable_variables
Њregularization_losses
ј__call__
+Ѕ&call_and_return_all_conditional_losses
'Ѕ"call_and_return_conditional_losses"
_generic_user_object
н
—trace_02ќ
'__inference_dense_4_layer_call_fn_27831Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z—trace_0
И
“trace_02й
B__inference_dense_4_layer_call_and_return_conditional_losses_27861Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 z“trace_0
 "
trackable_list_wrapper
0
≠0
Ѓ1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ДBБ
,__inference_sequential_1_layer_call_fn_23995dense_3_input"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
эBъ
,__inference_sequential_1_layer_call_fn_27548inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
эBъ
,__inference_sequential_1_layer_call_fn_27561inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ДBБ
,__inference_sequential_1_layer_call_fn_24068dense_3_input"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ШBХ
G__inference_sequential_1_layer_call_and_return_conditional_losses_27625inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ШBХ
G__inference_sequential_1_layer_call_and_return_conditional_losses_27689inputs"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЯBЬ
G__inference_sequential_1_layer_call_and_return_conditional_losses_24082dense_3_input"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ЯBЬ
G__inference_sequential_1_layer_call_and_return_conditional_losses_24096dense_3_input"њ
ґ≤≤
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
0
—0
“1"
trackable_list_wrapper
.
ѕ	variables"
_generic_user_object
:  (2total
:  (2count
0
’0
÷1"
trackable_list_wrapper
.
”	variables"
_generic_user_object
:  (2total
:  (2count
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
џBЎ
'__inference_dense_1_layer_call_fn_27698inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
B__inference_dense_1_layer_call_and_return_conditional_losses_27736inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
џBЎ
'__inference_dense_2_layer_call_fn_27745inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
B__inference_dense_2_layer_call_and_return_conditional_losses_27775inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
џBЎ
'__inference_dense_3_layer_call_fn_27784inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
B__inference_dense_3_layer_call_and_return_conditional_losses_27822inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
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
џBЎ
'__inference_dense_4_layer_call_fn_27831inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
цBу
B__inference_dense_4_layer_call_and_return_conditional_losses_27861inputs"Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
&:$	А
@2Adam/dense_5/kernel/m
:@2Adam/dense_5/bias/m
%:#@
2Adam/dense_6/kernel/m
:
2Adam/dense_6/bias/m
f:d2JAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/m
T:R2HAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/m
V:T 2:Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/m
D:B 28Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/m
W:U  2;Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/m
E:C 29Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/m
X:V @2<Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/m
F:D@2:Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/m
Y:W@@2=Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/m
G:E@2;Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/m
Y:W@А2<Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/m
G:EА2:Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/m
[:YАА2=Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/m
H:FА2;Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/m
1:/	А@2 Adam/time_distributed_1/kernel/m
*:(@2Adam/time_distributed_1/bias/m
D:B@24Adam/frame_position_embedding/embedding/embeddings/m
P:N@@2<Adam/transformer_layer_1/multi_head_attention/query/kernel/m
J:H@2:Adam/transformer_layer_1/multi_head_attention/query/bias/m
N:L@@2:Adam/transformer_layer_1/multi_head_attention/key/kernel/m
H:F@28Adam/transformer_layer_1/multi_head_attention/key/bias/m
P:N@@2<Adam/transformer_layer_1/multi_head_attention/value/kernel/m
J:H@2:Adam/transformer_layer_1/multi_head_attention/value/bias/m
[:Y@@2GAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/m
Q:O@2EAdam/transformer_layer_1/multi_head_attention/attention_output/bias/m
&:$	@А2Adam/dense_1/kernel/m
 :А2Adam/dense_1/bias/m
&:$	А@2Adam/dense_2/kernel/m
:@2Adam/dense_2/bias/m
R:P@@2>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/m
L:J@2<Adam/transformer_layer_2/multi_head_attention_1/query/bias/m
P:N@@2<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/m
J:H@2:Adam/transformer_layer_2/multi_head_attention_1/key/bias/m
R:P@@2>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/m
L:J@2<Adam/transformer_layer_2/multi_head_attention_1/value/bias/m
]:[@@2IAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/m
S:Q@2GAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/m
&:$	@А2Adam/dense_3/kernel/m
 :А2Adam/dense_3/bias/m
&:$	А@2Adam/dense_4/kernel/m
:@2Adam/dense_4/bias/m
&:$	А
@2Adam/dense_5/kernel/v
:@2Adam/dense_5/bias/v
%:#@
2Adam/dense_6/kernel/v
:
2Adam/dense_6/bias/v
f:d2JAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/kernel/v
T:R2HAdam/encoder3d/spatial_attention/spatial_attention_attention_conv/bias/v
V:T 2:Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/kernel/v
D:B 28Adam/encoder3d/conv2_plus1d/conv3D_1_spatial_conv/bias/v
W:U  2;Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/kernel/v
E:C 29Adam/encoder3d/conv2_plus1d/conv3D_1_temporal_conv/bias/v
X:V @2<Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/kernel/v
F:D@2:Adam/encoder3d/conv2_plus1d_1/conv3D_2_spatial_conv/bias/v
Y:W@@2=Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/kernel/v
G:E@2;Adam/encoder3d/conv2_plus1d_1/conv3D_2_temporal_conv/bias/v
Y:W@А2<Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/kernel/v
G:EА2:Adam/encoder3d/conv2_plus1d_2/conv3D_3_spatial_conv/bias/v
[:YАА2=Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/kernel/v
H:FА2;Adam/encoder3d/conv2_plus1d_2/conv3D_3_temporal_conv/bias/v
1:/	А@2 Adam/time_distributed_1/kernel/v
*:(@2Adam/time_distributed_1/bias/v
D:B@24Adam/frame_position_embedding/embedding/embeddings/v
P:N@@2<Adam/transformer_layer_1/multi_head_attention/query/kernel/v
J:H@2:Adam/transformer_layer_1/multi_head_attention/query/bias/v
N:L@@2:Adam/transformer_layer_1/multi_head_attention/key/kernel/v
H:F@28Adam/transformer_layer_1/multi_head_attention/key/bias/v
P:N@@2<Adam/transformer_layer_1/multi_head_attention/value/kernel/v
J:H@2:Adam/transformer_layer_1/multi_head_attention/value/bias/v
[:Y@@2GAdam/transformer_layer_1/multi_head_attention/attention_output/kernel/v
Q:O@2EAdam/transformer_layer_1/multi_head_attention/attention_output/bias/v
&:$	@А2Adam/dense_1/kernel/v
 :А2Adam/dense_1/bias/v
&:$	А@2Adam/dense_2/kernel/v
:@2Adam/dense_2/bias/v
R:P@@2>Adam/transformer_layer_2/multi_head_attention_1/query/kernel/v
L:J@2<Adam/transformer_layer_2/multi_head_attention_1/query/bias/v
P:N@@2<Adam/transformer_layer_2/multi_head_attention_1/key/kernel/v
J:H@2:Adam/transformer_layer_2/multi_head_attention_1/key/bias/v
R:P@@2>Adam/transformer_layer_2/multi_head_attention_1/value/kernel/v
L:J@2<Adam/transformer_layer_2/multi_head_attention_1/value/bias/v
]:[@@2IAdam/transformer_layer_2/multi_head_attention_1/attention_output/kernel/v
S:Q@2GAdam/transformer_layer_2/multi_head_attention_1/attention_output/bias/v
&:$	@А2Adam/dense_3/kernel/v
 :А2Adam/dense_3/bias/v
&:$	А@2Adam/dense_4/kernel/v
:@2Adam/dense_4/bias/v 
 __inference__wrapped_model_23514•2\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДRSZ[<Ґ9
2Ґ/
-К*
input_1€€€€€€€€€(
™ "1™.
,
dense_6!К
dense_6€€€€€€€€€
Ђ
B__inference_dense_1_layer_call_and_return_conditional_losses_27736euv3Ґ0
)Ґ&
$К!
inputs€€€€€€€€€@
™ "*Ґ'
 К
0€€€€€€€€€А
Ъ Г
'__inference_dense_1_layer_call_fn_27698Xuv3Ґ0
)Ґ&
$К!
inputs€€€€€€€€€@
™ "К€€€€€€€€€АЂ
B__inference_dense_2_layer_call_and_return_conditional_losses_27775ewx4Ґ1
*Ґ'
%К"
inputs€€€€€€€€€А
™ ")Ґ&
К
0€€€€€€€€€@
Ъ Г
'__inference_dense_2_layer_call_fn_27745Xwx4Ґ1
*Ґ'
%К"
inputs€€€€€€€€€А
™ "К€€€€€€€€€@≠
B__inference_dense_3_layer_call_and_return_conditional_losses_27822gБВ3Ґ0
)Ґ&
$К!
inputs€€€€€€€€€@
™ "*Ґ'
 К
0€€€€€€€€€А
Ъ Е
'__inference_dense_3_layer_call_fn_27784ZБВ3Ґ0
)Ґ&
$К!
inputs€€€€€€€€€@
™ "К€€€€€€€€€А≠
B__inference_dense_4_layer_call_and_return_conditional_losses_27861gГД4Ґ1
*Ґ'
%К"
inputs€€€€€€€€€А
™ ")Ґ&
К
0€€€€€€€€€@
Ъ Е
'__inference_dense_4_layer_call_fn_27831ZГД4Ґ1
*Ґ'
%К"
inputs€€€€€€€€€А
™ "К€€€€€€€€€@£
B__inference_dense_5_layer_call_and_return_conditional_losses_27293]RS0Ґ-
&Ґ#
!К
inputs€€€€€€€€€А

™ "%Ґ"
К
0€€€€€€€€€@
Ъ {
'__inference_dense_5_layer_call_fn_27275PRS0Ґ-
&Ґ#
!К
inputs€€€€€€€€€А

™ "К€€€€€€€€€@Ґ
B__inference_dense_6_layer_call_and_return_conditional_losses_27313\Z[/Ґ,
%Ґ"
 К
inputs€€€€€€€€€@
™ "%Ґ"
К
0€€€€€€€€€

Ъ z
'__inference_dense_6_layer_call_fn_27302OZ[/Ґ,
%Ґ"
 К
inputs€€€€€€€€€@
™ "К€€€€€€€€€
°
@__inference_dense_layer_call_and_return_conditional_losses_27381]jk0Ґ-
&Ґ#
!К
inputs€€€€€€€€€А
™ "%Ґ"
К
0€€€€€€€€€@
Ъ y
%__inference_dense_layer_call_fn_27363Pjk0Ґ-
&Ґ#
!К
inputs€€€€€€€€€А
™ "К€€€€€€€€€@ 
D__inference_encoder3d_layer_call_and_return_conditional_losses_26612Б\]^_`abcdefghi;Ґ8
1Ґ.
,К)
inputs€€€€€€€€€(
™ "2Ґ/
(К%
0€€€€€€€€€А
Ъ °
)__inference_encoder3d_layer_call_fn_26548t\]^_`abcdefghi;Ґ8
1Ґ.
,К)
inputs€€€€€€€€€(
™ "%К"€€€€€€€€€А•
D__inference_flatten_1_layer_call_and_return_conditional_losses_27266]3Ґ0
)Ґ&
$К!
inputs€€€€€€€€€@
™ "&Ґ#
К
0€€€€€€€€€А

Ъ }
)__inference_flatten_1_layer_call_fn_27260P3Ґ0
)Ґ&
$К!
inputs€€€€€€€€€@
™ "К€€€€€€€€€А
®
B__inference_flatten_layer_call_and_return_conditional_losses_27354b8Ґ5
.Ґ+
)К&
inputs€€€€€€€€€А
™ "&Ґ#
К
0€€€€€€€€€А
Ъ А
'__inference_flatten_layer_call_fn_27348U8Ґ5
.Ґ+
)К&
inputs€€€€€€€€€А
™ "К€€€€€€€€€АЇ
S__inference_frame_position_embedding_layer_call_and_return_conditional_losses_26757cl3Ґ0
)Ґ&
$К!
inputs€€€€€€€€€@
™ ")Ґ&
К
0€€€€€€€€€@
Ъ Т
8__inference_frame_position_embedding_layer_call_fn_26739Vl3Ґ0
)Ґ&
$К!
inputs€€€€€€€€€@
™ "К€€€€€€€€€@ж
@__inference_model_layer_call_and_return_conditional_losses_25491°2\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДRSZ[DҐA
:Ґ7
-К*
input_1€€€€€€€€€(
p 

 
™ "%Ґ"
К
0€€€€€€€€€

Ъ ж
@__inference_model_layer_call_and_return_conditional_losses_25598°2\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДRSZ[DҐA
:Ґ7
-К*
input_1€€€€€€€€€(
p

 
™ "%Ґ"
К
0€€€€€€€€€

Ъ е
@__inference_model_layer_call_and_return_conditional_losses_26204†2\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДRSZ[CҐ@
9Ґ6
,К)
inputs€€€€€€€€€(
p 

 
™ "%Ґ"
К
0€€€€€€€€€

Ъ е
@__inference_model_layer_call_and_return_conditional_losses_26515†2\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДRSZ[CҐ@
9Ґ6
,К)
inputs€€€€€€€€€(
p

 
™ "%Ґ"
К
0€€€€€€€€€

Ъ Њ
%__inference_model_layer_call_fn_24616Ф2\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДRSZ[DҐA
:Ґ7
-К*
input_1€€€€€€€€€(
p 

 
™ "К€€€€€€€€€
Њ
%__inference_model_layer_call_fn_25384Ф2\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДRSZ[DҐA
:Ґ7
-К*
input_1€€€€€€€€€(
p

 
™ "К€€€€€€€€€
љ
%__inference_model_layer_call_fn_25796У2\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДRSZ[CҐ@
9Ґ6
,К)
inputs€€€€€€€€€(
p 

 
™ "К€€€€€€€€€
љ
%__inference_model_layer_call_fn_25891У2\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДRSZ[CҐ@
9Ґ6
,К)
inputs€€€€€€€€€(
p

 
™ "К€€€€€€€€€
Г
F__inference_pooling3d_1_layer_call_and_return_conditional_losses_27323Є_Ґ\
UҐR
PКM
inputsA€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
™ "UҐR
KКH
0A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
Ъ џ
+__inference_pooling3d_1_layer_call_fn_27318Ђ_Ґ\
UҐR
PКM
inputsA€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
™ "HКEA€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€Г
F__inference_pooling3d_2_layer_call_and_return_conditional_losses_27333Є_Ґ\
UҐR
PКM
inputsA€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
™ "UҐR
KКH
0A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
Ъ џ
+__inference_pooling3d_2_layer_call_fn_27328Ђ_Ґ\
UҐR
PКM
inputsA€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
™ "HКEA€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€Г
F__inference_pooling3d_3_layer_call_and_return_conditional_losses_27343Є_Ґ\
UҐR
PКM
inputsA€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
™ "UҐR
KКH
0A€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
Ъ џ
+__inference_pooling3d_3_layer_call_fn_27338Ђ_Ґ\
UҐR
PКM
inputsA€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
™ "HКEA€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€ƒ
G__inference_sequential_1_layer_call_and_return_conditional_losses_24082yБВГДBҐ?
8Ґ5
+К(
dense_3_input€€€€€€€€€@
p 

 
™ ")Ґ&
К
0€€€€€€€€€@
Ъ ƒ
G__inference_sequential_1_layer_call_and_return_conditional_losses_24096yБВГДBҐ?
8Ґ5
+К(
dense_3_input€€€€€€€€€@
p

 
™ ")Ґ&
К
0€€€€€€€€€@
Ъ љ
G__inference_sequential_1_layer_call_and_return_conditional_losses_27625rБВГД;Ґ8
1Ґ.
$К!
inputs€€€€€€€€€@
p 

 
™ ")Ґ&
К
0€€€€€€€€€@
Ъ љ
G__inference_sequential_1_layer_call_and_return_conditional_losses_27689rБВГД;Ґ8
1Ґ.
$К!
inputs€€€€€€€€€@
p

 
™ ")Ґ&
К
0€€€€€€€€€@
Ъ Ь
,__inference_sequential_1_layer_call_fn_23995lБВГДBҐ?
8Ґ5
+К(
dense_3_input€€€€€€€€€@
p 

 
™ "К€€€€€€€€€@Ь
,__inference_sequential_1_layer_call_fn_24068lБВГДBҐ?
8Ґ5
+К(
dense_3_input€€€€€€€€€@
p

 
™ "К€€€€€€€€€@Х
,__inference_sequential_1_layer_call_fn_27548eБВГД;Ґ8
1Ґ.
$К!
inputs€€€€€€€€€@
p 

 
™ "К€€€€€€€€€@Х
,__inference_sequential_1_layer_call_fn_27561eБВГД;Ґ8
1Ґ.
$К!
inputs€€€€€€€€€@
p

 
™ "К€€€€€€€€€@Њ
E__inference_sequential_layer_call_and_return_conditional_losses_23882uuvwxBҐ?
8Ґ5
+К(
dense_1_input€€€€€€€€€@
p 

 
™ ")Ґ&
К
0€€€€€€€€€@
Ъ Њ
E__inference_sequential_layer_call_and_return_conditional_losses_23896uuvwxBҐ?
8Ґ5
+К(
dense_1_input€€€€€€€€€@
p

 
™ ")Ґ&
К
0€€€€€€€€€@
Ъ Ј
E__inference_sequential_layer_call_and_return_conditional_losses_27471nuvwx;Ґ8
1Ґ.
$К!
inputs€€€€€€€€€@
p 

 
™ ")Ґ&
К
0€€€€€€€€€@
Ъ Ј
E__inference_sequential_layer_call_and_return_conditional_losses_27535nuvwx;Ґ8
1Ґ.
$К!
inputs€€€€€€€€€@
p

 
™ ")Ґ&
К
0€€€€€€€€€@
Ъ Ц
*__inference_sequential_layer_call_fn_23795huvwxBҐ?
8Ґ5
+К(
dense_1_input€€€€€€€€€@
p 

 
™ "К€€€€€€€€€@Ц
*__inference_sequential_layer_call_fn_23868huvwxBҐ?
8Ґ5
+К(
dense_1_input€€€€€€€€€@
p

 
™ "К€€€€€€€€€@П
*__inference_sequential_layer_call_fn_27394auvwx;Ґ8
1Ґ.
$К!
inputs€€€€€€€€€@
p 

 
™ "К€€€€€€€€€@П
*__inference_sequential_layer_call_fn_27407auvwx;Ґ8
1Ґ.
$К!
inputs€€€€€€€€€@
p

 
™ "К€€€€€€€€€@Ў
#__inference_signature_wrapper_25701∞2\]^_`abcdefghijklmnopqrstuvwxyz{|}~АБВГДRSZ[GҐD
Ґ 
=™:
8
input_1-К*
input_1€€€€€€€€€("1™.
,
dense_6!К
dense_6€€€€€€€€€
–
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_26703jkEҐB
;Ґ8
.К+
inputs€€€€€€€€€€€€€€€€€€А
p 

 
™ "2Ґ/
(К%
0€€€€€€€€€€€€€€€€€€@
Ъ –
M__inference_time_distributed_1_layer_call_and_return_conditional_losses_26732jkEҐB
;Ґ8
.К+
inputs€€€€€€€€€€€€€€€€€€А
p

 
™ "2Ґ/
(К%
0€€€€€€€€€€€€€€€€€€@
Ъ ®
2__inference_time_distributed_1_layer_call_fn_26665rjkEҐB
;Ґ8
.К+
inputs€€€€€€€€€€€€€€€€€€А
p 

 
™ "%К"€€€€€€€€€€€€€€€€€€@®
2__inference_time_distributed_1_layer_call_fn_26674rjkEҐB
;Ґ8
.К+
inputs€€€€€€€€€€€€€€€€€€А
p

 
™ "%К"€€€€€€€€€€€€€€€€€€@‘
K__inference_time_distributed_layer_call_and_return_conditional_losses_26639ДMҐJ
CҐ@
6К3
inputs'€€€€€€€€€€€€€€€€€€А
p 

 
™ "3Ґ0
)К&
0€€€€€€€€€€€€€€€€€€А
Ъ ‘
K__inference_time_distributed_layer_call_and_return_conditional_losses_26656ДMҐJ
CҐ@
6К3
inputs'€€€€€€€€€€€€€€€€€€А
p

 
™ "3Ґ0
)К&
0€€€€€€€€€€€€€€€€€€А
Ъ Ђ
0__inference_time_distributed_layer_call_fn_26617wMҐJ
CҐ@
6К3
inputs'€€€€€€€€€€€€€€€€€€А
p 

 
™ "&К#€€€€€€€€€€€€€€€€€€АЂ
0__inference_time_distributed_layer_call_fn_26622wMҐJ
CҐ@
6К3
inputs'€€€€€€€€€€€€€€€€€€А
p

 
™ "&К#€€€€€€€€€€€€€€€€€€А’
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_26911ВmnopqrstuvwxGҐD
-Ґ*
$К!
inputs€€€€€€€€€@

 
™

trainingp ")Ґ&
К
0€€€€€€€€€@
Ъ ’
N__inference_transformer_layer_1_layer_call_and_return_conditional_losses_27006ВmnopqrstuvwxGҐD
-Ґ*
$К!
inputs€€€€€€€€€@

 
™

trainingp")Ґ&
К
0€€€€€€€€€@
Ъ ђ
3__inference_transformer_layer_1_layer_call_fn_26786umnopqrstuvwxGҐD
-Ґ*
$К!
inputs€€€€€€€€€@

 
™

trainingp "К€€€€€€€€€@ђ
3__inference_transformer_layer_1_layer_call_fn_26815umnopqrstuvwxGҐD
-Ґ*
$К!
inputs€€€€€€€€€@

 
™

trainingp"К€€€€€€€€€@Џ
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_27160Зyz{|}~АБВГДGҐD
-Ґ*
$К!
inputs€€€€€€€€€@

 
™

trainingp ")Ґ&
К
0€€€€€€€€€@
Ъ Џ
N__inference_transformer_layer_2_layer_call_and_return_conditional_losses_27255Зyz{|}~АБВГДGҐD
-Ґ*
$К!
inputs€€€€€€€€€@

 
™

trainingp")Ґ&
К
0€€€€€€€€€@
Ъ ±
3__inference_transformer_layer_2_layer_call_fn_27035zyz{|}~АБВГДGҐD
-Ґ*
$К!
inputs€€€€€€€€€@

 
™

trainingp "К€€€€€€€€€@±
3__inference_transformer_layer_2_layer_call_fn_27064zyz{|}~АБВГДGҐD
-Ґ*
$К!
inputs€€€€€€€€€@

 
™

trainingp"К€€€€€€€€€@