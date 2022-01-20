module.exports = {
  mode: 'spa',
  // options...

  /*
   ** Headers of the page
   */
  head: {
    title: process.env.npm_package_name || 'coreui-free-admin-vue-nuxt-js',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      {
        hid: 'description',
        name: 'description',
        content: process.env.npm_package_description || ''
      },
      { hid: 'author', name: 'author', content: 'https://theoddwave.co.nz/' },
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }]
  },
  /*
   ** Customize the progress-bar color
   */
  loading: { color: '#fff' },
  /*
   ** Global CSS
   */
  css: [
    '@/assets/scss/style.scss'
  ],
  /*
   ** Plugins to load before mounting the App
   */
  plugins: [
    { src: '~/plugins/coreui', mode: 'client' },
    { src: '~/plugins/coreui-icons', mode: 'client' }
  ],
  /*
   ** Nuxt.js dev-modules
   */
  buildModules: [
    // Doc: https://github.com/nuxt-community/eslint-module
    '@nuxtjs/eslint-module',
    '@nuxtjs/vuetify',
  ],
  /*
   ** Nuxt.js modules
   */
  modules: [
    // Doc: https://bootstrap-vue.js.org
    'bootstrap-vue/nuxt',
    // Doc: https://axios.nuxtjs.org/usage
    '@nuxtjs/axios',
    '@nuxtjs/pwa',
    // Doc: https://github.com/nuxt-community/dotenv-module
    '@nuxtjs/dotenv',

    '@nuxtjs/proxy',

  ],
  // proxy: {
  //   '/api': {
  //     target: 'http://localhost:3001',
  //     pathRewrite: {
  //       '^/api': '/api'
  //     }
  //   },
  // },
  /*
   ** Axios module configuration
   ** See https://axios.nuxtjs.org/options
   */
  axios: {
    proxy: true,
    baseURL: 'http://localhost:3001',
    proxyHeaders: false,
    credentials: false
  },
  /*
   ** Build configuration
   */

  build: {
    /*
     ** You can extend webpack config here
     */
    vendor: ['axios']
    // extend(config, ctx) {}
  },
  proxy: [
    ['/app', { target: 'http://localhost:3001/' }]
  ]
}
