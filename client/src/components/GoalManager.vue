<template>
    <v-app>
        <div>
             <SideBar />
             <v-main><router-view/></v-main>
        </div>
    </v-app>
</template>

<script>
import SideBar from '../components/SideBar.vue'

export default {
    components: {
        SideBar,
    }
}
</script>