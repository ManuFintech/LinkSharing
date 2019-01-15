package com.linksharing

import CO.UserCo
import grails.plugin.springsecurity.annotation.Secured

class UserSetupController {

    def userSetupService


    def index() {
        render "This is login controller."
    }

//    def loginUser(String username,String password){
//        render(view: '/userSetupController/Login')
//
////        boolean b=userSetupService.login(username,password)
////        if(b){
////            render(view:"/loginController/homePage.gsp")
////        }else{
////            render(view: "/notFound.gsp")
////
////        }
//
//    }

    @Secured("permitAll")
    def registerUser(UserCo userCo) {

        User user = User.findByUsername(userCo.username)
        if (user != null) {
            render "User already present.Plz login."

        } else {
            if (userCo.password.equals(userCo.confirmPassword)) {
                String s = userSetupService.register(userCo)
                render (view: "/userSetupController/Login.gsp")
            } else {
                render "password does not match"
            }

        }
    }



    @Secured("permitAll")
    def userLogout(){
        userSetupService.logout()

    }

    @Secured("permitAll")
    def homePage(){

        render(view: "/UserSetupController/homePage")
    }
}
