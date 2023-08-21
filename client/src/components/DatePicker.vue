<template>
    <VueDatePicker
    v-model="date"
    locale="ja"
    week-start="0"
    format="yyyy/M/d"
    auto-apply
    :month-change-on-scroll="false"
    :enable-time-picker="false"
    @update:model-value="updateDate" />
</template>

<script>
import VueDatePicker from '@vuepic/vue-datepicker';
import '@vuepic/vue-datepicker/dist/main.css'

export default {
    data() {
        return {
            date: null
        };
    },
    props: ['isStart'],
    components: {
        VueDatePicker
    },
    methods: {
        updateDate() {
            if (this.isStart) {
                this.$parent.startDate = this.date;
            } else {
                this.$parent.endDate = this.date;
            }
        }
    }
}
</script>

<style>
</style>
