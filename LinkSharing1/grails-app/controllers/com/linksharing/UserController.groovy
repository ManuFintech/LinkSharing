package com.linksharing

import CO.UserCo
import grails.plugin.springsecurity.annotation.Secured

class UserController {

    def userService
    def springSecurityService

    @Secured("permitAll")
    def index() {
        render (view: '/userController/Login.gsp')
    }


    def readUser(Integer id){
        def u=userService.read(id)
        if(u instanceof User){
            respond u
        }else
            render u
    }

    def updateUser(UserCo userCo){
        String s=userService.update(userCo)
        render s
    }

    def deleteUser(Integer id){
        String s=userService.delete(id)
        render s
    }
}
