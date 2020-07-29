from netCDF4 import Dataset
import numpy as np
#sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/GDFL_dif_cmip5.nc'
#sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/MPI_dif_cmip5.nc'
#sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/NCAR_dif_cmip5.nc'
#sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/GDFL_dif_cmip6.nc'
#sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/MPI_dif_cmip6.nc'
#sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/NCAR_dif_cmip6.nc'
sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/BESM_dif_cmip5.nc'
fh = Dataset(sic, mode='r')
#-----------------------------------------
lons = fh.variables['lon'][:]
lats = fh.variables['lat'][:]
sic = fh.variables['sic'][2,:,:]
#sic = fh.variables['icec'][9,:,:]
#sic = fh.variables['siconc'][2,:,:]
sic_units = fh.variables['sic'].units
fh.close()
#-----------------------------------------
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap
#-----------------------------------------
lon_0 = lons.mean()
lat_0 = lats.mean()
#-----------------------------------------
fig=plt.figure(figsize=(12, 10) )
m= Basemap(projection='spstere',resolution='f',boundinglat=-50, round=True,lon_0=180)
#-----------------------------------------
lon, lat = np.meshgrid(lons, lats)
xi, yi = m(lon, lat)
levels = np.linspace(-100,100,14, endpoint=True, dtype=int)
#levels=np.array(-100,-75,-50,-25,15,0,15,25,50,75,100)
sic = m.contourf(xi,yi,sic,shading='interp', cmap=plt.cm.seismic, levels=levels)
#----------------------------------------
#plt.title(' GDFL / CM3.0')
#plt.title(' GDFL / CM4.0 ')
#plt.title(' MPI / ESM - LR ')
#plt.title(' MPI / ESM1.2 - LR ')
#plt.title(' NCAR / CCSM4.0 ' )
#plt.title(' NCAR / CESM2.0 ')
#m.bluemarble()
m.drawlsmask()
m.drawcoastlines()
m.drawparallels(np.arange(-80.,81.,20.))
m.drawmeridians(np.arange(-180.,181.,20.))
ticks=[-100,-50,-15,0,15,50,100]
m.colorbar(sic, ticks=ticks,location='bottom',shrink=0.5)
plt.show()