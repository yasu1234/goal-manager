<script>
import axios from 'axios';
import Cookies from 'js-cookie'
import { mdiChevronLeft } from '@mdi/js'
import { mdiViewList } from '@mdi/js'
import { mdiCheckboxMarkedCirclePlusOutline } from '@mdi/js'

export default {
    data() {
        return {
            items: [
                { index: 0, title: '目標一覧', icon: mdiViewList, path: '/goalList' },
                { index: 1, title: '目標追加', icon: mdiViewList, path: '/goalAdd' },
                { index: 2, title: 'タスク追加', icon: mdiCheckboxMarkedCirclePlusOutline, path: '/taskAdd' },
            ],
            drawer: true,
            rail: false,
            mdiChevronLeft,
            mdiViewList
        }
    },
    mounted() {
    },
    computed: {},
    methods: {
    }, 
};
</script>

<template>
    <v-navigation-drawer
        v-model="drawer"
        :rail="rail"
        permanent
        @click="rail = false"
      >
        <v-list-item
          prepend-avatar="src/assets/image/home_image.jpg"
          title="Goal Manager"
          nav
        >
          <template v-slot:append>
            <v-btn
              variant="text"
              :icon= "mdiChevronLeft"
              @click.stop="rail = !rail"
            ></v-btn>
          </template>
        </v-list-item>

        <v-divider></v-divider>

        <v-list density="compact" nav>
          <v-list-item v-for="item in items"
          :key="item.index"
          :to="item.path"
          :title="item.title"
          :prepend-icon= "item.icon" value="home" />
        </v-list>
      </v-navigation-drawer>
</template>

<style>
</style>