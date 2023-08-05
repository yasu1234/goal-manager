import { createApp } from 'vue';
import './style.css';
import App from './App.vue';
import router from './router';
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import { aliases, mdi } from 'vuetify/iconsets/mdi-svg';
import mavonEditor from 'mavon-editor'
import 'mavon-editor/dist/css/index.css' 

const app = createApp(App)

const vuetify = createVuetify({
    components,
    directives,
    icons: {
        defaultSet: 'mdi',
        aliases,
        sets: {
          mdi,
        },
      },
})

app.use(vuetify)
app.use(router)
app.use(mavonEditor)
app.mount('#app')
