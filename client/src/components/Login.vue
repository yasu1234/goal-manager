<script>
import axios from 'axios';
import Cookies from 'js-cookie'
import MainHeader from '/src/components/Header.vue'

export default {
    data () {
        return {
            email: '',
            password: '',
            isPasswordValidationShow: false,

            validation: {
                passwordMatchResult: ''
            }
        }
    },
    components: {
        MainHeader
    },
    methods: {
        async login() {
            try {
                const response = await axios.post(import.meta.env.VITE_APP_API_BASE + '/auth/sign_in', {
                    email: this.email,
                    password: this.password,
                })
                Cookies.set('accessToken', response.headers["access-token"])
                Cookies.set('client', response.headers["client"])
                Cookies.set('uid', response.headers["uid"])

                this.$router.push('/goalManager');
            } catch (error) {
                console.log({ error })
            }
        },
    
        async checkValidate() {
            await this.login()
        }
    }
}
</script>

<template>
    <MainHeader/>
    <h1 class="signUpTitle">ログイン</h1>
    <div class="singUpInput">
        <form class="form" @submit.prevent="checkValidate">
            <div class="item">
                <label class="itemLabel">メールアドレス</label>
                <input id="email" type="email" v-model="email">
            </div>
            <div class="item">
                <label class="itemLabel" for="password">パスワード</label>
                <input id="password" type="password" v-model="password">
            </div>
            <div class="error-message" v-show="isPasswordValidationShow">
                <p class="error-message-text">{{ validation.passwordMatchResult }}</p>
            </div>
            <div class="signUpTitle">
                <button class="loginButton">ログイン</button>
            </div>
        </form>
    </div>
</template>

<style>
.form{
   width: 100%;
   margin:0 auto;
   padding: 50px;
   box-sizing: border-box;
}

.signUpTitle {
    padding-top: 40px;
    text-align: center;
}
 
.item{
    padding-top: 40px;
    width: 50%;
    margin: 0 auto;
}

.itemLabel{
    display: block;
    text-align: left;
}

.error-message{
    width: 50%;
    margin: 0 auto;
}
 
.error-message-text{
    color: red;
    font-size: 15px;
}

.form input[type="email"],
.form input[type="password"] {
     padding: 10px;
     width: 100%;
 }
 
.form textarea{
   padding: 10px;
   height: 100px;
   font-size: 14px;
   width: 50%;
 }
 
.loginButton{
    background: #ffa500;
    color: white;
    font-size:16px;
    font-weight:bold;
    padding: 10px 50px;
}
</style>