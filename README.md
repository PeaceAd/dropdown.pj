# Dropdown.pj

A customizable and lightweight dropdown component built with vanilla JavaScript.

## 📋 Table of Contents

- [Features](#features)
- [Demo](#demo)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [API Reference](#api-reference)
- [Customization](#customization)
- [Browser Support](#browser-support)
- [Contributing](#contributing)
- [License](#license)

## ✨ Features

- **Lightweight**: Zero dependencies, pure vanilla JavaScript
- **Customizable**: Easily themed with CSS variables
- **Accessible**: Built with ARIA attributes for screen readers
- **Responsive**: Works seamlessly on mobile and desktop
- **Event-driven**: Rich event system for custom integrations
- **Keyboard Navigation**: Full keyboard support (Arrow keys, Enter, Escape)
- **Search/Filter**: Optional search functionality within dropdown options
- **Multi-select**: Support for single and multiple selections

## 🚀 Demo

[Live Demo](https://peacead.github.io/dropdown.pj/) | [CodePen Examples](https://codepen.io/collection/example)

## 📦 Installation

### CDN

```html
<!-- CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/PeaceAd/dropdown.pj@main/dist/dropdown.min.css">

<!-- JavaScript -->
<script src="https://cdn.jsdelivr.net/gh/PeaceAd/dropdown.pj@main/dist/dropdown.min.js"></script>
```

### NPM

```bash
npm install dropdown.pj
```

### Manual Download

Download the latest release from the [releases page](https://github.com/PeaceAd/dropdown.pj/releases).

## 🏃‍♀️ Quick Start

### Basic HTML Structure

```html
<div class="dropdown-container">
  <select id="my-dropdown">
    <option value="">Select an option</option>
    <option value="option1">Option 1</option>
    <option value="option2">Option 2</option>
    <option value="option3">Option 3</option>
  </select>
</div>
```

### Initialize the Dropdown

```javascript
// Basic initialization
const dropdown = new Dropdown('#my-dropdown');

// With options
const dropdown = new Dropdown('#my-dropdown', {
  placeholder: 'Choose an option...',
  searchable: true,
  clearable: true,
  theme: 'modern'
});
```

### Programmatic Usage

```javascript
// Set value
dropdown.setValue('option2');

// Get value
const currentValue = dropdown.getValue();

// Add new option
dropdown.addOption('option4', 'Option 4');

// Remove option
dropdown.removeOption('option1');

// Destroy dropdown
dropdown.destroy();
```

## 📖 API Reference

### Constructor

```javascript
new Dropdown(selector, options)
```

#### Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `selector` | `string` | CSS selector for the target select element |
| `options` | `object` | Configuration options (optional) |

#### Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `placeholder` | `string` | `'Select...'` | Placeholder text when no option is selected |
| `searchable` | `boolean` | `false` | Enable search/filter functionality |
| `clearable` | `boolean` | `false` | Show clear button to reset selection |
| `disabled` | `boolean` | `false` | Disable the dropdown |
| `multiple` | `boolean` | `false` | Allow multiple selections |
| `maxHeight` | `string` | `'200px'` | Maximum height of dropdown menu |
| `theme` | `string` | `'default'` | Theme name ('default', 'modern', 'minimal') |
| `closeOnSelect` | `boolean` | `true` | Close dropdown after selection |
| `openDirection` | `string` | `'auto'` | Direction to open ('auto', 'up', 'down') |

### Methods

#### `setValue(value)`
Set the selected value programmatically.

```javascript
dropdown.setValue('option2');
// For multiple selection
dropdown.setValue(['option1', 'option3']);
```

#### `getValue()`
Get the currently selected value(s).

```javascript
const value = dropdown.getValue();
console.log(value); // 'option2' or ['option1', 'option3'] for multiple
```

#### `addOption(value, text, selected = false)`
Add a new option to the dropdown.

```javascript
dropdown.addOption('new-option', 'New Option', true);
```

#### `removeOption(value)`
Remove an option from the dropdown.

```javascript
dropdown.removeOption('option1');
```

#### `enable()` / `disable()`
Enable or disable the dropdown.

```javascript
dropdown.disable();
dropdown.enable();
```

#### `open()` / `close()`
Programmatically open or close the dropdown.

```javascript
dropdown.open();
dropdown.close();
```

#### `refresh()`
Refresh the dropdown (useful after DOM changes).

```javascript
dropdown.refresh();
```

#### `destroy()`
Remove the dropdown and restore original select element.

```javascript
dropdown.destroy();
```

### Events

Listen to dropdown events using the `on` method:

```javascript
dropdown.on('change', function(selectedValue) {
  console.log('Selection changed:', selectedValue);
});

dropdown.on('open', function() {
  console.log('Dropdown opened');
});

dropdown.on('close', function() {
  console.log('Dropdown closed');
});

dropdown.on('search', function(searchTerm) {
  console.log('User searched for:', searchTerm);
});
```

Available events:
- `change` - Fired when selection changes
- `open` - Fired when dropdown opens
- `close` - Fired when dropdown closes
- `search` - Fired when user types in search box
- `clear` - Fired when selection is cleared

## 🎨 Customization

### CSS Variables

Customize the appearance using CSS variables:

```css
:root {
  --dropdown-bg: #ffffff;
  --dropdown-border: #e1e5e9;
  --dropdown-border-radius: 4px;
  --dropdown-text: #333333;
  --dropdown-hover-bg: #f8f9fa;
  --dropdown-selected-bg: #007bff;
  --dropdown-selected-text: #ffffff;
  --dropdown-focus-border: #007bff;
  --dropdown-shadow: 0 2px 4px rgba(0,0,0,0.1);
}
```

### Custom Themes

Create custom themes by overriding CSS classes:

```css
.dropdown-theme-custom {
  --dropdown-bg: #2c3e50;
  --dropdown-text: #ecf0f1;
  --dropdown-border: #34495e;
  --dropdown-hover-bg: #34495e;
}
```

```javascript
const dropdown = new Dropdown('#my-dropdown', {
  theme: 'custom'
});
```

### Advanced Styling

```css
/* Custom dropdown container */
.dropdown-container {
  position: relative;
  width: 100%;
}

/* Custom option styling */
.dropdown-option {
  padding: 12px 16px;
  transition: all 0.2s ease;
}

.dropdown-option:hover {
  background-color: var(--dropdown-hover-bg);
  transform: translateX(2px);
}

/* Custom search input */
.dropdown-search {
  border: none;
  border-bottom: 1px solid var(--dropdown-border);
  padding: 8px 12px;
}
```

## 🌐 Browser Support

| Browser | Version |
|---------|---------|
| Chrome | 60+ |
| Firefox | 55+ |
| Safari | 12+ |
| Edge | 79+ |
| IE | Not supported |

## 🧪 Development

### Prerequisites

- Node.js 14+
- npm or yarn

### Setup

```bash
# Clone the repository
git clone https://github.com/PeaceAd/dropdown.pj.git
cd dropdown.pj

# Install dependencies
npm install

# Start development server
npm run dev
```

### Build

```bash
# Build for production
npm run build

# Run tests
npm test

# Run linting
npm run lint
```

### Project Structure

```
dropdown.pj/
├── src/
│   ├── dropdown.js          # Main dropdown class
│   ├── styles.css           # Core styles
│   └── themes/              # Theme files
├── dist/                    # Built files
├── examples/                # Usage examples
├── tests/                   # Test files
├── docs/                    # Documentation
└── package.json
```

### Quick Steps

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow the existing code style
- Add tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting PR

## 📊 Performance

- **Size**: ~3KB gzipped (JS + CSS)
- **Dependencies**: Zero
- **Render time**: <16ms for 1000+ options
- **Memory usage**: Minimal DOM footprint


## 🙏 Acknowledgments

- Inspired by modern dropdown components
- Built with accessibility in mind
- Community feedback and contributions

<div align="center">
  <p>Made with ❤️ by <a href="https://github.com/PeaceAd">Jenola344</a></p>
  <p>
    <a href="https://github.com/PeaceAd/dropdown.pj/stargazers">⭐ Star</a> •
    <a href="https://github.com/PeaceAd/dropdown.pj/issues">🐛 Report Bug</a> •
    <a href="https://github.com/PeaceAd/dropdown.pj/issues">✨ Request Feature</a>
  </p>
</div>
