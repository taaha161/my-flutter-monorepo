import 'package:flutter/material.dart';
import 'package:state_management/state_management.dart';
import 'package:widgets/widgets.dart';
import 'package:utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const TodoPage(),
    );
  }
}

class Todo {
  final String id;
  final String title;
  final bool completed;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    this.completed = false,
    required this.createdAt,
  });

  Todo copyWith({
    String? id,
    String? title,
    bool? completed,
    DateTime? createdAt,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late final Store<List<Todo>> todoStore;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    todoStore = Store(<Todo>[]);
  }

  @override
  void dispose() {
    todoStore.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _addTodo(String title) {
    if (title.trim().isEmpty) return;
    
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title.trim(),
      createdAt: DateTime.now(),
    );
    
    todoStore.update([...todoStore.state, newTodo]);
    _controller.clear();
  }

  void _toggleTodo(String id) {
    todoStore.setState((todos) {
      return todos.map((todo) {
        if (todo.id == id) {
          return todo.copyWith(completed: !todo.completed);
        }
        return todo;
      }).toList();
    });
  }

  void _deleteTodo(String id) {
    todoStore.setState((todos) {
      return todos.where((todo) => todo.id != id).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Todo App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextFieldInput(
                    controller: _controller,
                    hintText: 'Enter a new todo',
                    onChanged: (_) {},
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _addTodo(_controller.text),
                ),
              ],
            ),
          ),
          Expanded(
            child: StoreBuilder<List<Todo>>(
              store: todoStore,
              builder: (context, todos) {
                if (todos.isEmpty) {
                  return const Center(
                    child: Text('No todos yet. Add one above!'),
                  );
                }

                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return InfoCard(
                      title: todo.title,
                      subtitle: DateFormatter.formatRelative(todo.createdAt),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: todo.completed,
                            onChanged: (_) => _toggleTodo(todo.id),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _deleteTodo(todo.id),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
