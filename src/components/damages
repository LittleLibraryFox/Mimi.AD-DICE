# Add as policy variable the adaptation costs
@defcomp damages begin
    DAMAGES = Variable(index=[time])    #Damages (trillions 2010 USD per year)
    GROSSDAM = Variable(index=[time])  #Gross damages (divided by YGROSS)
    RESDAM = Variable(index=[time])    #Damages (residual damages)
    PROTCOST = Variable(index=[time])   #Damages (protection costs)

    TATM    = Parameter(index=[time])   #Increase temperature of atmosphere (degrees C from 1900)
    YGROSS  = Parameter(index=[time])   #Gross world product GROSS of abatement and damages (trillions 2010 USD per year)
    a1      = Parameter()               #Damage coefficient (set later)
    a2      = Parameter()               #Damage quadratic term (set later)
    a3      = Parameter()               #Damage exponent (set later)
    
    g1      = Parameter()               #gamma1 parameter in protection costs
    g2      = Parameter()               #gamma2 parameter in protection costs
    PROT    = Parameter(index=[time])   #Protection level between 0 and 1: Maybe add here PROT = Variable(index=[time])

    function run_timestep(p, v, d, t)
        #Define gross damages
            v.GROSSDAM[t] = ( p.a1 * p.TATM[t] + p.a2 * p.TATM[t] ^ p.a3 ) * p.YGROSS[t]
            
        #Define protection cost
            v.PROTCOST[t] =  p.YGROSS[t] * ( p.g1 * p.PROT[t] ^ p.g2 )

        #Define function for RESDAM
            v.RESDAM[t] = v.GROSSDAM[t] * (1 - p.PROT[t])
    
        #Define function for DAMAGES
            v.DAMAGES[t] = v.RESDAM[t] + v.PROTCOST[t]
        end
    end
