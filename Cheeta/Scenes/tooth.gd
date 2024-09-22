extends CharacterBody3D

@export var initial_orientation: Vector3

@onready var collision_polygon = $CollisionShape3D
@onready var static_mesh = $MeshInstance3D

func _ready():
	#TODO Change mesh based on import
	#static_mesh.mesh = CreateMesh()
	#collision_polygon.shape = static_mesh.mesh
	rotate_x(initial_orientation.x)
	rotate_y(initial_orientation.y)
	rotate_z(initial_orientation.z)
	

#region Mesh import
func CreateMesh():
	var vertices = PackedVector3Array()
	print(vertices)
	vertices.push_back(Vector3(0, 1, 0))
	print(vertices)
	vertices.push_back(Vector3(1, 0, 0))
	print(vertices)
	vertices.push_back(Vector3(0, 0, 1))
	print(vertices)
	vertices.push_back(Vector3(0, 2, 0))
	print(vertices)
	vertices.push_back(Vector3(2, 0, 0))
	print(vertices)
	vertices.push_back(Vector3(0, 0, 2))
	print(vertices)
	
	# Initialize the ArrayMesh.
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	
	# Create the Mesh.
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	print(arr_mesh.get_faces())
	print(arr_mesh.get_aabb())
	return (arr_mesh)
#endregion
