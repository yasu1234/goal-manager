<script>
import axios from 'axios'
import Cookies from 'js-cookie'

export default {
    methods: {
        async guestLogin() {
            try {
                const res = await axios.post(import.meta.env.VITE_APP_API_BASE + '/users/guest_sign_in')

                Cookies.set('accessToken', res.headers["access-token"])
                Cookies.set('client', res.headers["client"])
                Cookies.set('uid', res.headers["uid"])
                
                return res
            } catch (error) {
                console.log({ error })
            }
        },

        showSignUp() {
            this.$router.push('/signUp');
        },

        showLogin() {
            this.$router.push('/login');
        }
    }
}
</script>

<template>
    <img src="../assets/image/home_image.jpg" alt="Logo" class= "homeLogo">
    <h1>心の中に留めるだけでいいのか？<br>目標を管理・共有しよう</h1>
    <div class="homeButtons">
        <button class="commonButton" @click="showSignUp">会員登録</button>
        <button class="commonButton" @click="showLogin">ログイン</button>
        <button class="guestButton" @click="guestLogin">ゲストログイン</button>
    </div>
</template>

<style>
.homeLogo {      
    width:100%;
    height:400px;
    object-fit: cover;
    display: block;
}
.homeButtons {
    width:50%;
    display: flex;
    flex-direction: column;
    margin-left: auto;
    margin-right: auto;
}
.homeButtons button {
    margin-top: 20px;
}
.commonButton {
    background-color: #ffa500;
}
.guestButton {
    background-color: #f75549;
}
</style>