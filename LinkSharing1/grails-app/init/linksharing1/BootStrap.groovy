package linksharing1

class BootStrap {

    def init = { servletContext ->
        def role=new Role('ROLE_ADMIN')
        def role1=new Role("ROLE_USER")
        role.save()
        role1.save()
        def testUser=new User('manu@fintechlabs.in','ManuMishra','Manu@1234','Manu','Mihsra','xyz')
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
