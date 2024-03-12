
// javascript
// Operaciones básicas en MongoDB:


// Listar
db.empleados.find();

// Actualizar
db.empleados.update({nombre: "Juan"}, {$set: {salario: 60000}});

// Eliminar
db.empleados.remove({nombre: "Ana"});

// Inserción
db.empleados.insertOne({nombre: "Carlos", salario: 55000});

// Documenta estos códigos en tu proyecto HTML y súbelo a GitHub Pages. 

// parete 2

// Listar (todos los empleados con salario mayor a 40000)
db.empleados.find({salario: {$gt: 40000}});

 // Actualizar (incrementar salario en un 10% para todos los empleados)
db.empleados.updateMany({}, {$mul: {salario: 1.1}});

 // Eliminar (eliminar empleados con experiencia menor a 3 años)
db.empleados.deleteMany({experiencia: {$lt: 3}});

 // Inserción (insertar un nuevo departamento)
db.departamentos.insertOne({nombre: "Ventas", ubicacion: "Ciudad"});

















