# Company Website

A modern, responsive company website template built with HTML, CSS, and JavaScript.

## Features

- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile devices
- **Multiple Pages**: Home, About, Services, and Contact pages
- **Modern UI**: Clean and professional design with smooth animations
- **Mobile Menu**: Hamburger menu for mobile navigation
- **Contact Form**: Functional contact form (requires backend integration)
- **SEO Friendly**: Semantic HTML structure

## Pages

1. **Home (index.html)**: Landing page with hero section, features, and call-to-action
2. **About (about.html)**: Company story, mission, and values
3. **Services (services.html)**: Overview of services offered
4. **Contact (contact.html)**: Contact information and form

## Getting Started

1. Open `index.html` in a web browser to view the website
2. Customize the content by editing the HTML files
3. Modify styles in `styles.css` to match your brand
4. Update company name, contact information, and other details

## Customization

### Colors
Edit the CSS variables in `styles.css`:
```css
:root {
    --primary-color: #2563eb;
    --secondary-color: #1e40af;
    --text-dark: #1f2937;
    --text-light: #6b7280;
    --bg-light: #f9fafb;
    --white: #ffffff;
}
```

### Content
- Replace "Company Name" with your actual company name
- Update contact information in the footer and contact page
- Add your own images and content
- Modify service offerings and feature descriptions

### Contact Form
The contact form currently logs data to the console. To make it functional:
- Set up a backend server (Node.js, PHP, etc.)
- Configure form submission to send emails or store data
- Add form validation and error handling

## File Structure

```
company-website/
├── index.html          # Home page
├── about.html          # About page
├── services.html       # Services page
├── contact.html        # Contact page
├── styles.css          # Stylesheet
├── script.js           # JavaScript functionality
└── README.md           # This file
```

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## License

Free to use and modify for your projects.
