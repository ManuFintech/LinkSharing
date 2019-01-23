package linksharing1

import com.linksharing.Role
import com.linksharing.User
import com.linksharing.UserRole

class BootStrap {

    def init = { servletContext ->
        def role=new Role('ROLE_ADMIN')
        def role1=new Role("ROLE_USER")
        role.save()
        role1.save()
        def testUser=new User('manu@fintechlabs.in','ManuMishra','Manu@1234','Manu','Mihsra','1234567890')
        testUser.save()
        UserRole.create(testUser,role)
        UserRole.withSession {
            it.flush()
            it.clear()
        }




        println("Initializing Data.........................................")
    }
    def destroy = {
    }
}
