# Package Documentation

Detailed documentation for each package in the monorepo.

## widgets

### CustomButton

A customizable button widget with loading state support.

```dart
CustomButton(
  text: 'Submit',
  onPressed: () => handleSubmit(),
  isLoading: false,
  style: ButtonStyle(...),
)
```

### InfoCard

A card widget for displaying information.

```dart
InfoCard(
  title: 'Title',
  subtitle: 'Subtitle text',
  trailing: Icon(Icons.arrow_forward),
  onTap: () => handleTap(),
)
```

### TextFieldInput

A styled text input field.

```dart
TextFieldInput(
  labelText: 'Email',
  hintText: 'Enter your email',
  controller: emailController,
  validator: Validators.email,
)
```

## state_management

### Store<T>

A state container that extends ChangeNotifier.

```dart
final counterStore = Store<int>(0);

// Update state
counterStore.update(10);

// Update with function
counterStore.setState((current) => current + 1);

// Get current state
final currentValue = counterStore.state;
```

### StoreBuilder<T>

A widget that rebuilds when the store changes.

```dart
StoreBuilder<int>(
  store: counterStore,
  builder: (context, state) {
    return Text('Count: $state');
  },
)
```

## network

### ApiClient

HTTP client for making API requests.

```dart
final apiClient = ApiClient(
  baseUrl: 'https://api.example.com',
  defaultHeaders: {'Authorization': 'Bearer token'},
);

// GET request
final response = await apiClient.get('/users');

// POST request
final response = await apiClient.post(
  '/users',
  body: {'name': 'John', 'email': 'john@example.com'},
);
```

## utils

### DateFormatter

Format dates and times.

```dart
// Format date
DateFormatter.formatDate(DateTime.now());

// Format relative time
DateFormatter.formatRelative(DateTime.now().subtract(Duration(hours: 2)));
// Returns: "2 hours ago"
```

### StringUtils

String manipulation utilities.

```dart
StringUtils.capitalize('hello'); // "Hello"
StringUtils.truncate('Long text', 5); // "Long ..."
StringUtils.isValidEmail('test@example.com'); // true
```

### Validators

Form validation functions.

```dart
TextFormField(
  validator: Validators.email,
)

TextFormField(
  validator: (value) => Validators.required(value, fieldName: 'Name'),
)
```
