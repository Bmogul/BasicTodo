using Microsoft.AspNetCore.Mvc;
using TodoApi.Models;
using Microsoft.EntityFrameworkCore;
namespace TodoApi.Controllers;

[ApiController]
[Route("[controller]")]
public class TodoItemsController : ControllerBase
{
    private readonly TodoContext _context;
    public TodoItemsController(TodoContext context) { _context = context; }

    private static TodoItemDTO ItemToDTO(TodoItem item)
    {
        return new TodoItemDTO
        {
            Id = item.Id,
            TaskId = item.TaskId,
            Name = item.Name,
            IsComplete = item.IsComplete,
        };
    }

    private bool IsValidId(long id) { return _context.TodoItems.Any(item => item.Id == id); }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<TodoItemDTO>>> GetTodoItems()
    {
        return await _context.TodoItems.Select(item => ItemToDTO(item)).ToListAsync();
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<TodoItemDTO>> GetTodoItem(long id)
    {
        TodoItem? item = await _context.TodoItems.FindAsync(id);
        if (item == null)
            return NotFound();

        return ItemToDTO(item);
    }

    [HttpPost]
    public async Task<ActionResult<TodoItemDTO>> PostTodoItem(TodoItemDTO item)
    {
        TodoItem todoItem = new TodoItem { IsComplete = item.IsComplete, Name = item.Name, TaskId = item.TaskId };
        _context.TodoItems.Add(todoItem);
        await _context.SaveChangesAsync();

        return CreatedAtAction(nameof(GetTodoItem),new {id = todoItem.Id}, ItemToDTO(todoItem));
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> PutTodoItem(long id, TodoItemDTO item)
    {
        if (id != item.Id)
            return BadRequest();

        TodoItem? todoItem = await _context.TodoItems.FindAsync(id);
        if (todoItem == null)
            return NotFound();

        todoItem.Name = item.Name;
        todoItem.IsComplete = item.IsComplete;
        todoItem.TaskId = item.TaskId;

        try
        {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException) when (!IsValidId(id))
        {
            return NotFound();
        }
        return NoContent();
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteTodoItem(long id)
    {
        TodoItem? item = await _context.TodoItems.FindAsync(id);
        if (item == null)
            return NotFound();
        _context.TodoItems.Remove(item);
        await _context.SaveChangesAsync();

        return NoContent();
    }
}
