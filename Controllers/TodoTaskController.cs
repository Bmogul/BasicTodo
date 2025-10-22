using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using TodoApi.Models;

namespace TodoApi.Controllers;

[ApiController]
[Route("[controller]")]
public class TodoTaskController : ControllerBase
{
    private readonly TodoContext _context;
    public TodoTaskController(TodoContext context) { _context = context; }

    private TodoTaskDTO TaskToDTO(TodoTask task)
    {
        return new TodoTaskDTO
        {
            Id = task.Id,
            Name = task.Name,
            IsActive = task.IsActive,
        };
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<TodoTaskDTO>>> GetTodoTasks()
    {
        return await _context.TodoTasks.Select(task => TaskToDTO(task)).ToListAsync();
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<TodoTaskDTO>> GetTodoTask(long id)
    {
        TodoTask? task = await _context.TodoTasks.FindAsync(id);
        if (task == null)
            return NotFound();
        return TaskToDTO(task);
    }

    [HttpPost]
    public async Task<ActionResult<TodoTaskDTO>> PostTodoTask(TodoTaskDTO task)
    {
        TodoTask todoTask = new TodoTask { Name = task.Name, IsActive = task.IsActive };
        _context.TodoTasks.Add(todoTask);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetTodoTask), new { id = todoTask.Id }, TaskToDTO(todoTask));
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> PutTodoTask(long id, TodoTaskDTO task)
    {
        if (id != task.Id)
            return BadRequest();
        TodoTask? todoTask = await _context.TodoTasks.FindAsync(id);
        if (todoTask == null)
            return NotFound();

        todoTask.Name = task.Name;
        todoTask.IsActive = task.IsActive;

        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException)
        {
            return NotFound();
        }

        return NoContent();
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteTodoTask(long id)
    {
        TodoTask? task = await _context.TodoTasks.FindAsync(id);
        if (task == null)
            return NotFound();
        _context.Remove(task);
        await _context.SaveChangesAsync();
        return NoContent();
    }
}
