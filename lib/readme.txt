providing an instance of bloc /cubit to a single screen is called Local access
**providing an instance of a bloc/cubit to multiple screens is calles Route access

flutter provide three differnt routing macanisams 
----------------------------------------------------

01 - Anonymous routing  -> routing without route name 
-> only screens are used to navigating 
->suitable for small applications 

02 - Named routing   -> navigating with a route name 
->Route names and their associated screens are setup inside the route parameters of meterial widget
-> suitable for small medium application 
->it provide the existing instance of bloc / cubit of multiple screens 

03- Genereted routning  -> same structure as named routing 
-> navigating with route name 
->route names and their associted screens are setup inside the separated onGeneratedRoute function
-> suiable for laarge appliation 

** home scrren aekn apita second screen eka access kranna puluwan
block walin
    BlocProvider.value{
        value  : existingBloc
    }

**How bloc/cubit listen to another cubit/bloc
--------------------------------------------------
01- Stream subscription
02- Bloc listner

**BlocListner manages it's streamSubscription internally


**********************************************************
01 - Bloc BlocProvider
02 - BlocListner
03-BlocBuilder
04- RepositoryProvider

The translations of................
**********************************************************
01 - Navigator.of(context)
02- BlocProvider.of(context)
03-Theme.of(context)
04-Scaffold.of(context)
05- RandomWidget.of(context)

**************************************************************

BlocProvider eke instance eka dannna ona widjet ekak asssta
chnages 