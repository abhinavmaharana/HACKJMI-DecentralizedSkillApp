/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",'./pages/**/*.{js,ts,jsx,tsx}', './components/**/*.{js,ts,jsx,tsx}', './shared/**/*.{js,ts,jsx,tsx}'
  ],
  theme: {
    extend: {
      colors: {
        'main-blue': '#618EB0',
        buttonWhite: '#F2F2F2',
        black: '#000000',
        green: '#28B468',
        'component-black': '#262626',
        'off-white': '#F4F6FD',
        'bg-black': '#1A1A1A',
        'main-grey': '#ABB0BF',
        'faq-grey': '#A1AEB7',
        'footer-grey': 'rgba(0, 0, 0, 0.5);',
        'footer-dark-grey': 'rgba(255, 255, 255, 0.5);',
      },
      fontFamily: {
        sans: ['Monteserrat', 'Rogan', 'Raleway', 'Poppins'],
      },
      fontSize: {
        heading: '78px',
        'sub-heading': '30px',
      },
    },
  },
  plugins: [],
}
