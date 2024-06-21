# Model commentary for DICE

While the DICE model is quite simple in terms of its equations, the embedded assumptions and its historical context are not necessarily easy to understand. 
On this page, we are therefore providing accessible information on the DICE model's history, structure, ethical aspects, policy implications, uncertainties, and possible expectations in the form of a written model commentary — a concept going back to [Maeki2009](@citet).

### What is a model commentary?

A model commentary is the sum of all model-related communication by the modeller. It can, and should, take different forms for different audiences—both in terms of the level of detail and in terms of the choice of medium: "Model commentaries are contextual" [Maeki2009](@citep).

Here, we illustrate one possible model commentary for DICE in written form, addressing an audience that doesn't necessarily have an economics background.

Despite being fundamentally contextual, we think that an informative and comprehensive model commentary for IAMs should always include the following aspects:

- In which context did the model emerge?
- What are the crucial assumptions of the model?
- How does the structure of the model shape its proper domain of application?
- Which questions can be answered with the model?
- Which uncertainties should be taken into account when interpreting model results?
- Which ethical aspects are embodied or touched by the model?
- What are possible policy implications of the model results?

## History of DICE

The DICE model was developed by William Nordhaus. The underlying idea of developing a model that combines economic growth modelling with simple models of the climate system emerged from Nordhaus's research stay at the IIASA research center in Austria in the early 1970s [Nobel2018c](@citep).
It then took almost two decades until the first fully coupled cost-benefit version of the DICE model was published in _Science_ [Nordhaus1992](@citep).
Since then, DICE has been updated several times, but the basic model structure stayed the same (for the latest version, see [Barrage2023](@citet)). Because the model has been openly available since its beginnings, many modifications and extensions of DICE have been proposed (for a selection, see [Extensions](@ref)).

For a general history of IAMs, see [vanBeek2020](@citet). For a more specific tracing of the influence of the emergence cost-benefit thinking on climate change and the resulting policy impact, see [Randalls2011](@citet). A more methodological history of the different model versions that preceded DICE, and how it has been put to use since, can be found in [Nobel2018b](@citet).

## Modelling approach

The DICE model is based on a neoclassical economic growth model, combined with a carbon cycle and climate module [Nordhaus2012](@cite). This means that the world economic output (GDP) is calculated as a function of accumulated capital and the labour force, in combination with technological progress. In every time step (every 5 years), GDP is calculated and both climate damages and mitigation costs are subtracted. Climate damages depend on the amount of global atmospheric warming, which is calculated within the climate module based on previous CO$_2$ emissions. Mitigation costs, on the other hand, depend on technological progress and on the level of mitigation that is chosen at every time step.

Importantly, the DICE model is not purely descriptive, as there are two decisions to be taken at every time step. First, the decision-maker—which is generally referred to as the _social planner_—, chooses how much of current output should be spent on investments and how much should be consumed. Invested output will increase the global capital stock and hence lead to higher GDP, whereas consumed output will increase current global welfare. Second, the social planner chooses how much of the CO$_2$ emissions associated with the given level of economic production will be mitigated, with mitigation costs acting at the expense of current consumption of investment.

But how are these two decisions taken by the model? The DICE model is an optimisation IAM, which means that both the savings rate (amount of economic output being invested rather than consumed) and the mitigation rate (amount of CO$_2$ emissions reduction) are chosen based on a welfare optimisation. In welfare economics, this means that there is a _social welfare function_ which indicates the preferences of the social planer. This social welfare function is mathematically optimised. It is the discounted sum of utilities throughout the whole time horizon of the model. Utilities, on the other hand, are a function of each period's consumption. Discounted means that future consumption contributes less to welfare, for two reasons: first, future consumption is valued less than current consumption because the future is assumed to be richer in general; and second, future utility is valued less than current utility purely because it is further away (see [Criticism](@ref)).

## System boundaries

The DICE model is a single-region model. That means that the whole world produces and consumes a single good. As a consequence, the DICE model is not able to represent distributive aspects, e.g. income inequalities or inequalities in CO$_2$ emissions.

Temporally, it extends from the present (in the current model version taken to be 2015) to the far-away future of 2500. Importantly, the long time horizon is not chosen because of some underlying assumption that centennial projections of socioeconomic variables are accurate or reliable. Rather, the optimised results of numerical models like the DICE are sensitive to the cut-off time. For instance, if the model ends in 2500, the hypothetical social planner will stop investing some time before 2500 and see to consuming everything before the end of the model world. By pushing this inevitable but unplausible behaviour far into the future, modellers make sure that these effects don't distort results within the time frame that we are actually interested in.

As the DICE model only features a single good, it also has no concept of different economic sectors. Thereby, the model is blind to whether a certain mitigation effort happens within, say, the energy or the transport sector. The reduction of CO$_2$ emissions is governed by a single marginal abatement curve (MAC), relating a certain emissions cut to a mitigation cost value.

Similarly, the DICE model does not explicitly resolve non-market goods. That is, the capital stock only consists of "manufactured capital", which can be used to produce goods and services that are sold on markets. There is no concept of "natural capital", which would be needed to produce non-market goods like clean air or biodiversity. Also the role of natural capital in producing market goods is not represented in the DICE model (see [Extensions](@ref)).

## Ethical issues

Being a welfare-optimising economic growth model, the DICE model is based on a range of normative choices. 

First of all, the assumed social welfare function is based on the consequentialist ethical framework of discounted utilitarianism. This framework requires explicit parameters choices of the _rate of pure time preference_ and the _elasticity of intertemporal substitution_ (also called intertemporal inequality aversion), which have to be ethically justified. Implicitly, this welfare framework also assumes that the social planner is indifferent to _risks and uncertainty_, as the model runs entirely deterministically. Further, any inequalities within a certain time period do not influence the welfare assessment, as they are all aggregated into a single consumption value. This means that the DICE model is not able to represent _distributive aspects_ at all (see [System boundaries](@ref)) — in fact, it deliberately ignores both inequalities between and within countries.

Second, there are more implicitly normative aspects in the setting of [System boundaries](@ref). For example, which kinds of climate-change-induced damages are included into the welfare assessment? Non-market goods are excluded in the DICE model, such that biodiversity loss is not considered. The same goes for many other climate change damages. Despite this being a consequence of the difficulty of quantifying these damage channels, and not necessarily a deliberate normative choice to exclude them, it still amounts to a normatively relevant modelling choice.

Third, the DICE model is based on a range of assumptions and projections about the future development of important socioeconomic variables. These include economic productivity, global population, technological progress in low-carbon technologies, among others. Again, these projections are not explicitly normative and based on best-guess evidence from other sources. However, they can still implicitly contain normative assumptions. For example, the required future levels of GDP are politically debated and this political debate is sidelined by the DICE model's reliance on GDP projections. Similarly, the choice of modelling technological progress in low-carbon technologies as exogenous, i.e. developing with a fixed rate independent of climate policy, is normative in that it restricts the range of possible mitigation pathways at the social planner's disposal (see [Extensions](@ref)).

## Policy implications

William Nordhaus describes the most important policy implications of the DICE model as follows (see [Nordhaus2012](@citet), p. 1095):

>- Making consistent projections, i.e. ones that have consistent inputs and outputs of the different components of the system (so that the GDP projections are consistent with the emissions projections).
>- Calculating the impacts of alternative assumptions on important variables such as output, emissions, temperature change and impacts.
>- Tracing through the effects of alternative policies on all variables in a consistent manner, as well as estimating the costs and benefits of alternative strategies.
>- Estimating the uncertainties associated with alternative variables and strategies.
>- Calculating the effects of reducing uncertainties about key parameters or variables, as well as estimating the value of research and new technologies.

In a paper that discusses the policy impact of William Nordhaus, [Aldy2020](@citet) differentiate between (1) "direct participation in the policy world", (2) "directly influencing public policies", and (3) "indirectly informing public policy". According to the authors, the main impact on climate policy was through (3), by subtly influencing the discourse around policy stringency and options.

The DICE model shaped the climate debate by framing climate policy as a trade-off between economic growth and climate change mitigation. Every dollar spent on emissions reduction is modelled as being at the expense of consumption or investment in the capital stock. Given that investment in the capital stock leads to higher economic output and hence more economic means both for consumption and emissions reductions, the basic structure of DICE frames the climate problem as a question of "how much mitigation to do when?". 
Nordhaus himself the question about the timing of emissions reduction with the concept of a _climate-policy ramp_ — where mitigation efforts start with only moderately stringent climate policy, but get more stringent over time [Nordhaus2007](@citep). In fact, Nordhaus concluded in his early work that little changes to the energy system are required, because the climate change problem can more efficiently be tackled by richer future generations [Aldy2020](@citep).

A related policy-relevant concept stemming from the DICE model is the so-called "optimal level" of global warming. The output of DICE is a path of optimised emission reduction rates, which translates into a path of global mean temperatures. The peak of this temperature curve is often interpreted as the "optimal level of warming" and compared to levels of warming embodied in climate targets, such as the 1.5 and 2˚C targets embodied in the Paris Agreement. This contrast between international climate targets and DICE-based "optimal warming levels" of more than 3˚C [Nordhaus2019](@citep), has been the source of much [Criticism](@ref) and ensuing works (see [Haensel2020](@citet) or [Kikstra2023](@citet)).

Because the DICE model conceptualises CO$_2$ emissions as a global externality which is quantified in dollars, internalising the externality through a price on CO$_2$ emissions is a natural consequence. Nordhaus pioneered the externality view of climate change [Yang2020](@citep) and was an early proponent of putting a price on carbon dioxide emissions, e.g. through a carbon tax [Nobel2018b](@citep). Thereby, the DICE model helped to popularise market-based policies for addressing climate change.

As part of the direct influence on climate policy (2 in the classification of [Aldy2020](@citet)), the DICE model has been used to estimate social cost of carbon (SCC) figures to be used for assessing the climate impact of policy proposals. Most prominently, it was used as one of three models for setting the SCC numbers to be used by all US government agencies [Metcalf2017](@citep).
The DICE model was instrumental of establishing the concept of the SCC as a key concept of climate economics. Because of its accessible interpretation of "the damages caused by the additional emission of a ton of CO$_2$", it has also served as yardstick for carbon prices, embraced by policy makers and activists.

Thus, there are many ways in which the modelling results of DICE have influenced climate policy.
Conversely, there are aspects of climate policy that the model is not able to address — and which have consequently received less attention by the climate policy discourse that the DICE model has helped to shape. 
Among the issues that are more hidden than illuminated by the DICE model are distributional aspects of any kind — be they between or within countries, in terms of emissions, consumption or damages. Similarly, the choice of a discounted utilitarian welfare function whose sole input is consumption measures all policies in terms of their consumption output — at the expense of other policy goals that could plausibly form part of the social planner's welfare function.

## Uncertainties

As a simple, aggregated model, DICE is full of uncertain parameters.

The reaction of the Earth system to CO$_2$ emissions is modelled as a diffusion of carbon into the ocean and global warming resulting from the residual carbon dioxide in the atmosphere. Both the first aspect—the carbon cycle—and the second—climate sensitivity—are full of uncertainties. For an evaluation of the DICE carbon cycle and climate module, see [Dietz2021](@citet). For background on climate sensitivity, see [Sherwood2020](@citet).
Related, there is uncertainty about potential catastrophic events. Part of this debate is framed in terms of tipping points (e.g., [Lemoine2016](@citet) or [Dietz2021a](@citet)), part of it in terms of "fat tails" [Weitzman2009](@citep).

Climate damages in DICE are a consequence of global mean temperature increase. The damage function itself is highly uncertain [Piontek2021](@citep), such that different damage modelling choices lead to widely different policy recommendations [Wijst2021](@citep).

In DICE, climate damages are subtracted from economic production in a given year. First, there is uncertainty about whether this assumption of economic damages occurring only in a single time period is justified, or whether damages are persist in the economy (see [Moore2015](@citet)). Second, there is substantial uncertainty about the amount of future economic production that is affected by climate damages [@Christensen2018]. These uncertainties about future economic growth are even more pronounced when considering different world regions separately [Dellink2017](@citep).

The cost of reducing CO$_2$ emissions is similarly subtracted from economic production, and these cost developments are also uncertain [Gillingham2018a](@citep). There is additional uncertainty about how to model the effect of undertaken emissions reduction on the cost of future emissions reduction, e.g. by directed technological change [Acemoglu2016](@citep).

Lastly, there are substantial uncertainties about how to calibrate the objective function of the model. Irrespective of whether one takes a descriptive or normative approach, discounting parameters [Drupp2018](@citep) and substitutabilities [Neumayer1999](@citep) between human-made and natural capital are inherently uncertain.

## Expectations

Potentially, there is an infinite amount of expectations that users could have for a model such as DICE. Here, we pick three illustrative expectations in order to give a sense of what can or cannot be expected of DICE.

#### 1) Representation of the world economy in the context of climate change

A popular view on modelling defines a model as a representation of a "target system", which for DICE would be the world economy in the context of climate change.
Based on this idea, users could expect the DICE model to be an good representation of this target system and judge the model's performance against that.
But the DICE model is not a good representation of the world economy at all — it has only one world region, one economic sector, a single produced good. It has no representation of low-carbon technologies, no climate policy instrument beyond a carbon price and it assumes perfectly competitive markets that behave as if they had perfect foresight.
Clearly, the economic elements of the DICE model are not built with the aim of being a realistic representation of their target system. The other expectations elaborate on this point further.
Nevertheless, there are some elements of the DICE model that can be judged by the realisticness of representation they achieve — under existing contraints of simplicity and tractability. Take the climate module, which for this DICE2016R2 has been shown to be a poor representation of how the real-world climate system is known to behave [Dietz2021](@citep). Subsequent updates of DICE like [Haensel2020](@citet) or [Barrage2023](@citet) have improved on these dynamics, making this part of the model a better representation of its target system.


#### 2) Quantitative guidance on costs and benefits of climate policy

A more instrumental expectation might be based on seeing DICE as a tool for a certain climate policy purpose. Concretely, many policymakers are looking for quantitative guidance on the costs and benefits of reducing CO$_2$ emissions in a certain manner.
Implicitly, [Pindyck2017](@citet) voices this expectation when claiming that IAMs “have no empirical (or even theoretical) grounding and thus [...] cannot be used to provide any kind of reliable quantitative policy guidance” (p. 103). Pindyck concludes that “economists should not claim that IAMs can forecast climate change and its impact or that IAMs can tell us the magnitude of the SCC” (p. 112). These quotes reveal the expectation that an IAM should provide quantitative guidance on the SCC and accurate forecasts to an audience of policymakers, while being empirically (and theoretically) grounded. 
To fulfil this expectation, DICE need not necessarily be a perfectly realistic representation of its target; instead, it would have to cover all decision-relevant aspects and embody the best available evidence on all processes that could affect cost and benefit calculations.
For several reasons, DICE can not fully live up to this. First of all, forecasting and quantitative accuracy do not form part of its stated goals [Nordhaus2012](@citep). Consequently, DICE prioritises tractability and transparency over detail [Nordhaus2011](@citep). Secondly, the target system encompasses the world economy, the climate system and climate decision-making – all of it on a centennial timescale. Due to the complex nature of the target and associated uncertainties, accurate forecasting seems hardly achievable in principle.
Estimate of the policy-relevant SCC can illustrate this point. The SCC is the sum of the economic damage of an additionally emitted ton of CO$_2$ — seemingly an empirical quantity.
But on the one hand, this empirical estimation is highly sensitive to modelling choices, such as whether to include natural capital [BastienOlvera2021a](@citep) or whether to assume that economic damages persist for more than a single time period [Moore2015](@citep).
On the other hand, the SCC is also highly dependent on normative choices, for example on the discount rate [Rennert2022](@citep) or the valuation of damages occurring in an economically unequal world [Anthoff2019](@citep).

#### 3) Learning about the behaviour of the model and its target system

A third expectation is linked to the purpose of learning about the behaviour of the model and its target system, for example by calculating impacts of alternative assumptions. This expectation could be raised by model users who want to understand qualitative dynamics around climate policy or investigate the importance of different mechanisms or issues. Users could for example be academics with an epistemic interest in the model behaviour. However, they could also be political institutions or think tanks who use the model to highlight the relevance of a certain issue linked to their political agenda.
DICE does indeed provide a modelling framework that works well as a tool for comparing the effect of different assumptions, through its tractability and open-source code. It is able to tell a range of different stories about the world, but the interpretation of them is often ambiguous.
Over time, many studies have made use of this strength of DICE by building modified model versions (see [Extensions](@ref)) and comparing how these modifications affect policy-relevant outcomes such as the SCC. While these model versions do not necessarily aim to make the model a better representation of reality and should not be interpreted as such, they can facilitate learning about the importance of different processes and mechanisms for climate policy evaluation.

## References

```@bibliography
Pages = ["commentary.md"]
Canonical = false
```