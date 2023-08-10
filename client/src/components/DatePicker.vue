<template>
    <VueDatePicker
    v-model="date"
    locale="ja"
    week-start="0"
    format="yyyy/M/d"
    :month-change-on-scroll="false"
    :enable-time-picker="false"/>
</template>

<script>
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'

export default {
    data() {
        return {
            date: null,
        };
    },
    components: {
        VueDatePicker
    }
}
</script>

<style>
</style>
