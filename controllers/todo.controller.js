const { Todo }          = require('../models');
const authService       = require('../services/auth.service');
const { to, ReE, ReS }  = require('../services/util.service');

const create = async function(req, res){
    let err, todos;
    let user = req.user;

    let todo_info = req.body;

    [err, todos] = await to(Todo.create(todo_info));
    if(err) return ReE(res, err, 422);
    
    [err, todos] = await to(todos.save());
    if(err) return ReE(res, err, 422);
    
    let todo_json = todos.toWeb();
   
    return ReS(res, {todo:todo_json}, 201);
}
module.exports.create = create;

const get = async function(req, res){
    let todo_id = req.params.todo_id;
    [err, todos] = await to(Todo.findByPk(todo_id));
    if(err) return ReE(res, err, 422);

    let todo_json = todos.toWeb();
   
    return ReS(res, {todo:todo_json}, 201);
}
module.exports.get = get;

const update = async function(req, res){
    let err, todo, data
    todo = req.todo;
    console.log("todos"+todo);
    data = req.body;
   
    todo.set(data);
 
    [err, todo] = await to(todo.save());
    if(err) return ReE(res, err, 422);

    return ReS(res, {message :'Updated Todos: '+todo.id});
}
module.exports.update = update;

const remove = async function(req, res){
    let Todos, err;
    Todos = req.todo;

    [err, Todos] = await to(Todos.destroy());
    if(err) return ReE(res, 'error occured trying to delete Todos');

    return ReS(res, {message:'Deleted Todos'}, 200);
}
module.exports.remove = remove;

const getAll = async function(req, res){
    
         Todo.findAll({})
        .then(todos =>ReS(res, {todo:todos}))
        .catch(error => ReS(res, {todo:error}));
}
module.exports.getAll = getAll;
