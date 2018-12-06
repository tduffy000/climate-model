## Climate-Model

### Overview
Using sea surface temperature measurements over the four month period of January-April 2018, the aim is to use automated model selection techniques that provide strong predictive power; i.e. forward & backward selection along with information-based methods.

### Explanation:

##Background. 
Polar-orbiting satellites have been carrying variety of radiometer
instruments with infrared (IR) channels suitable for estimating sea surface temperature
(SST) since 1981. The instruments designed for SST estimations have channels that are
located at selected wavelengths where the atmosphere is relatively transparent. At these
IR wavelengths the ocean surface emits radiation almost as a blackbody. In principle,
without an absorbing and emitting atmosphere between the sea surface and the satellite, it
would be possible to estimate SST using a single-channel measurement. In reality,
surface-leaving IR radiance is partially attenuated by the atmosphere before it reaches a
satellite sensor. Therefore it is necessary to make corrections for atmospheric effects
[Minnett, 1990]. Several techniques have been proposed over the years to account for the
atmospheric absorption of surface IR radiance to improve the accuracy of satellite
retrievals of SST. Anding and Kauth [1970] found that the difference in measurement at
two properly selected IR channels is proportional to the amount of atmospheric correction
required. Using differences in brightness temperatures (BT) measured by an early
satellite radiometer, [Prabhakra et. al. 1974] estimated SST to reasonable accuracy.
Barton [1995] showed that this differential absorption between channels is exploited in
all IR SST algorithms and demonstrated that there is a basic form to most algorithms:

$$T_S = aT_{\lambda_i}+\gamma(T_{\lambda_i}-T_{\lambda_j})+c ( 1 ) $$
where 푇! is retrieved (estimated from satellite measurements) SST, 푇!! and 푇!! are

brightness temperature measurements in channels 휆! and 휆! and 푎 and 푐 are constants.

The term 훾 is defined as

훾=
1 −휏!!
휏!!−휏!!
,
where 휏 is the transmittance through the atmosphere from the surface to the satellite.

All statistical retrieval algorithms share this generalized form, although various
modifications have been introduced through the years to improve performance. One of
the commonly used modifications is based on the non-linear SST algorithm (NLSST)
originally developed by Walton et al. [1988]:

푇!=푏!+푏!푇!!+푏! 푇!!−푇!! 푇!"#+푏! 푇!!−푇!! (sec휃− 1 ), ( 2 )
where 푇!"# is a first-guess SST value and 휃 is the satellite zenith angle. More examples
can be found in [Petrenko et. al. 2014].

The data sets “matchups_NPP_2018-01.nc”, “matchups_NPP_2018- 02 .nc” and
“matchups_NPP_2018- 03 .nc” contain the variables from VIIRS instrument onboard
Suomi NPP satellite, which has correspondent in time/space in situ observations, needed
for the estimating coefficients of (linear) regression. Most of the variable names (such as
latitude, longitude, day, hour, minute etc) are self-explanatory. The others are listed in the
Table below:

Use subset selection methods to find the best 휆! and 휆! in equation (1). Since there
are only 2 variables, 푇!! and 푇!!, exhaustive search is an appropriate method.
Use a selection method to find the best 휆! and 휆! in the equation (2). This is a
three variable (linear) regression with variables 푋!=푇!!, 푋!= 푇!!−푇!! 푇!"#,
and 푋!= 푇!!−푇!! (sec휃− 1 ), but only 2 unknown wavelengths, 휆! and 휆!.
Compare the performance with (1) and with operational 푇! (‘sst_reg’ of netcdf).
Use independent data set for evaluation.
Repeat for another variant of equation (2):
푇!=푏!+푏!푇!!+푏! 푇!!−푇!! +푏! 푇!!−푇!! sec휃− 1 +푏!푇!"#, ( 2 푎)
which has 푇!"# as a separate term (NRL algorithm, c.f. Petrenko et. al. [2014]).
Heavier regression equation is also used:
푇!=푏!+푏!푇!!+푏!푇!!−푇!.! + 푏! 푇!!−푇!.! + 푏! 푇!!−푇!"
푏!+푏!푇!!+푏!푇!!−푇!.!+ 푏!푇!!−푇!.! + 푏!푇!!−푇!" sec휃− 1
푏!!푇!!+푏!!푇!!−푇!.!+ 푏!"푇!!−푇!.!+ 푏!"푇!!−푇!" 푇!"#; ( 3 푛)
Name
in netcdf file
Physical meaning Notation
BT_M12 brightness temperatures at 3.7 휇푚 푇!.!
BT_M13 (^) brightness temperatures at 4.05 휇푚 푇!
BT_M14 brightness temperatures at 8. 55 휇푚 푇!.!
BT_M1 5 brightness temperatures at 10.7 휇푚 푇!!
BT_M1 6 brightness temperatures at 12.01 휇푚 푇!"
sst_ref estimated from previous day(s) “first guess”
sea surface temperature

푇!"#
sza Solar zenith angle
day time: 0 ≤Sza≤ 85
night time: 95 ≤Sza≤ 180
dusk: 85 ≤Sza≤ 95
휃!
vza Satellite view angle 휃
푆!=sec휃− 1
sst_insitu measurements form various “in the water”
instruments (buoys, ships, drifters)
푇!
sst_reg Retrieved SST using current operational
algorithm

for night (3n) and day (3d) respectively. Estimate the coefficients using shrinkage
methods (Lasso and ridge regression). Evaluate and compare with operational 푇!
(‘sst_reg’ of netcdf). Use independent data set for evaluation.
Starting from the form (3n) and (3d), use backward selection method to reduce
number of terms without significant loss of performance. Compare with Lasso and
shrinkage results.

##References

Anding, D. and R. Kauth. 1970. Estimation of sea surface temperature from space,
Remote Sens. Environ., 1, 217-220.

Barton, I.J., 1995. Satellite-derived sea surface temperatures: Current status. Journal of
Geophysical Research 100: 8777–8790.

Minnett, P.J. 1990. The regional optimization of infrared measurements of sea surface
temperature from space. J. Geophys Res., 95

Petrenko, B.; Ignatov, A.; Kihai, Y.; Stroup, J.; Dash, P. 2014. Evaluation and selection
of SST regression algorithms for JPSS VIIRS. J. Geophys. Res. , 119 , 4580– 4599
https://agupubs.onlinelibrary.wiley.com/doi/epdf/10.1002/2013JD

Prabhakara, C., G. Dalau, and V.G. Kunde. 1974. Estimation of sea surface temperature
from remote sensing in the 11 to 13mm window region, J. Geophys. Res., 79, 5039-5044.

Walton, C. C., W. G. Pichel, F. J. Sapper, and D. A. May, 1988. The development and
operational application of nonlinear algorithms for the measurement of sea surface
temperatures with NOAA polar-orbiting environmental satellites. Journal of Geophysical
Research 103: 27999–28012.
