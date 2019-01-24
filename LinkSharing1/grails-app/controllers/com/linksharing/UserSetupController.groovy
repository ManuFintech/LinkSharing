package com.linksharing

import CO.UserCo
import grails.plugin.springsecurity.annotation.Secured

@Secured("permitAll")
class UserSetupController {

    def userSetupService



    def index() {
        render "This is login controller."
    }

    def loginUser(){
        render(view: '/userSetupController/Login.gsp')
    }

    @Secured("permitAll")
    def registerUser(UserCo userCo) {
        println(":::::::::::::::::::::::"+userCo.firstName+" "+userCo.lastName+" "+userCo.username+" "+userCo.email+" "
        +userCo.password+" "+userCo.confirmPassword+" "+userCo.phoneNumber+" "+userCo.photo)
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

        render(view: "/userSetupController/homePage")
    }

    @Secured(['permitAll'])
    def resetPassword(){
        println("{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{"+params.email)
       String s= userSetupService.resetuserPasword(params.OldPassword,params.NewPassword,params.email)
        render(view:"/userSetupController/passwordSuccesfull" , params:[status:s])

    }

    @Secured('permitAll')
    def resetPasswordPage(){
        render (view: '/userSetupController/resetPasswordPage')
    }

    @Secured('permitAll')
    def sendMail(){
        println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + params.email)
        userSetupService.sendMail(params.email)
    }


    @Secured('permitAll')
    def passwordGeneratorView(){
        render(view: '/userSetupController/resetPassword')
    }



}
