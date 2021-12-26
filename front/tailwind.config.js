module.exports = {
  purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  mode: 'jit',
  darkMode: false,
  theme: {
    extend: {
      colors: {
        primary: '#1DA1F2',
        dark: '#1a91da',
        light: '#a5d0f5',
        lighter: '#D4E5F4',
        tableColor: {
          bg: '#f0f2f5',
          border: '#d4dae3',
          hover: '#f6f7f9',
          text: '#444444',
        },
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [require('@tailwindcss/forms')],
}
