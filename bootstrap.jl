(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using JuliaMVC
const UserApp = JuliaMVC
JuliaMVC.main()
