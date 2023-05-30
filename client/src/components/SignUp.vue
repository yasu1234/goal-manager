<script>
import axios from 'axios'
export default {
    data () {
        return {
            email: '',
            password: '',
            passwordConfirm: '',
            name: '',
            isPasswordValidationShow: false,

            validation: {
                passwordMatchResult: ''
            }
        }
    },
    methods: {
        async signUp () {
            try {
                const res = await axios.post(process.env.VUE_APP_API_BASE + '/auth', {
                    email: this.email,
                    password: this.password,
                    password_confirmation: this.passwordConfirmation,
                    name: this.name
                })
                console.log({ res })
                return res
            } catch (error) {
                console.log({ error })
            }
        },
    
        async checkValidate() {
            if (this.password == this.passwordConfirm) {
                this.isPasswordValidationShow = false
                this.validation.passwordMatchResult = ''
                await this.signUp()
            } else {
                this.isPasswordValidationShow = true
                this.validation.passwordMatchResult = 'パスワードとパスワード(確認)が一致しません'
            }
        }
    }
}
</script>

<template>
    <h1 class="signUpTitle">会員登録</h1>
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
            <div class="item">
                <label class="itemLabel" for="passwordConfirm">パスワード(確認)</label>
                <input id="passwordConfirm" type="password" v-model="passwordConfirm">
            </div>
            <div class="item">
                <label class="itemLabel" for="name">名前</label>
                <input id="name" v-model="name">
            </div>
            <div class="signUpTitle">
                <button class="registerButton">登録</button>
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

 /* 入力欄にpadding追加 */
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
 
.registerButton{
    background: #ffa500;
    color: white;
    font-size:16px;
    font-weight:bold;
    padding: 10px 50px;
}
</style>