#-----------------------------------------
from netCDF4 import Dataset
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap
#-----------------------------------------
fig=plt.figure(figsize=(18, 30), dpi=600)
#-----------------------------------------
sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/GDFL_dif_cmip5.nc'
fh = Dataset(sic, mode='r')
lons = fh.variables['lon'][:]
lats = fh.variables['lat'][:]
sic = fh.variables['sic'][9,:,:]
#sic = fh.variables['icec'][9,:,:]
#sic = fh.variables['siconc'][2,:,:]
sic_units = fh.variables['sic'].units
fh.close()                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
lon_0 = lons.mean()
lat_0 = lats.mean()
#-----------------------------------------
m= Basemap(projection='spstere',resolution='f',boundinglat=-50, round=True,lon_0=180)
#-----------------------------------------
lon, lat = np.meshgrid(lons, lats)
xi, yi = m(lon, lat)
levels = np.linspace(-100,100,14, endpoint=True, dtype=int)
ax = fig.add_subplot(421)
ax.set_title('a) GDFL-CM3', fontsize=18)
sic = m.contourf(xi,yi,sic,shading='interp', cmap=plt.cm.seismic, levels=levels)
m.drawlsmask()
m.drawcoastlines()
m.drawparallels(np.arange(-80.,81.,20.))
m.drawmeridians(np.arange(-180.,181.,20.))
#-----------------------------------------
sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/GDFL_dif_cmip6.nc'
fh = Dataset(sic, mode='r')
lons = fh.variables['lon'][:]
lats = fh.variables['lat'][:]
#sic = fh.variables['sic'][2,:,:]
#sic = fh.variables['icec'][9,:,:]
sic = fh.variables['siconc'][9,:,:]
sic_units = fh.variables['siconc'].units
fh.close()
lon_0 = lons.mean()
lat_0 = lats.mean()
#-----------------------------------------
m= Basemap(projection='spstere',resolution='f',boundinglat=-50, round=True,lon_0=180)
#-----------------------------------------
lon, lat = np.meshgrid(lons, lats)
xi, yi = m(lon, lat)
levels = np.linspace(-100,100,14, endpoint=True, dtype=int)
ax = fig.add_subplot(422)
ax.set_title('b) GDFL-CM4', fontsize=18)
sic = m.contourf(xi,yi,sic,shading='interp', cmap=plt.cm.seismic, levels=levels)
m.drawlsmask()
m.drawcoastlines()
m.drawparallels(np.arange(-80.,81.,20.))
m.drawmeridians(np.arange(-180.,181.,20.))
#-----------------------------------------
sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/MPI_dif_cmip5.nc'
fh = Dataset(sic, mode='r')
lons = fh.variables['lon'][:]
lats = fh.variables['lat'][:]
sic = fh.variables['sic'][9,:,:]
#sic = fh.variables['icec'][9,:,:]
#sic = fh.variables['siconc'][2,:,:]
sic_units = fh.variables['sic'].units
fh.close()
lon_0 = lons.mean()
lat_0 = lats.mean()
#-----------------------------------------
m= Basemap(projection='spstere',resolution='f',boundinglat=-50, round=True,lon_0=180)
#-----------------------------------------
lon, lat = np.meshgrid(lons, lats)
xi, yi = m(lon, lat)
levels = np.linspace(-100,100,14, endpoint=True, dtype=int)
ax = fig.add_subplot(423)
ax.set_title('c) MPI-ESM-LR', fontsize=18)
sic = m.contourf(xi,yi,sic,shading='interp', cmap=plt.cm.seismic, levels=levels)
m.drawlsmask()
m.drawcoastlines()
m.drawparallels(np.arange(-80.,81.,20.))
m.drawmeridians(np.arange(-180.,181.,20.))
#-----------------------------------------
sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/MPI_dif_cmip6.nc'
fh = Dataset(sic, mode='r')
lons = fh.variables['lon'][:]
lats = fh.variables['lat'][:]
#sic = fh.variables['sic'][2,:,:]
#sic = fh.variables['icec'][9,:,:]
sic = fh.variables['siconc'][9,:,:]
sic_units = fh.variables['siconc'].units
fh.close()
lon_0 = lons.mean()
lat_0 = lats.mean()
#-----------------------------------------
m= Basemap(projection='spstere',resolution='f',boundinglat=-50, round=True,lon_0=180)
#-----------------------------------------
lon, lat = np.meshgrid(lons, lats)
xi, yi = m(lon, lat)
levels = np.linspace(-100,100,14, endpoint=True, dtype=int)
ax = fig.add_subplot(424)
ax.set_title('d) MPI-ESM1.2-LR', fontsize=18)
sic = m.contourf(xi,yi,sic,shading='interp', cmap=plt.cm.seismic, levels=levels)
m.drawlsmask()
m.drawcoastlines()
m.drawparallels(np.arange(-80.,81.,20.))
m.drawmeridians(np.arange(-180.,181.,20.))
#-----------------------------------------
sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/NCAR_dif_cmip5.nc'
fh = Dataset(sic, mode='r')
lons = fh.variables['lon'][:]
lats = fh.variables['lat'][:]
sic = fh.variables['sic'][9,:,:]
#sic = fh.variables['icec'][9,:,:]
#sic = fh.variables['siconc'][2,:,:]
sic_units = fh.variables['sic'].units
fh.close()
lon_0 = lons.mean()
lat_0 = lats.mean()
#-----------------------------------------
m= Basemap(projection='spstere',resolution='f',boundinglat=-50, round=True,lon_0=180)
#-----------------------------------------
lon, lat = np.meshgrid(lons, lats)
xi, yi = m(lon, lat)
levels = np.linspace(-100,100,14, endpoint=True, dtype=int)
ax = fig.add_subplot(425)
ax.set_title('e) NCAR-CCSM4.0', fontsize=18)
sic = m.contourf(xi,yi,sic,shading='interp', cmap=plt.cm.seismic, levels=levels)
m.drawlsmask()
m.drawcoastlines()
m.drawparallels(np.arange(-80.,81.,20.))
m.drawmeridians(np.arange(-180.,181.,20.))
#-----------------------------------------
sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/NCAR_dif_cmip6.nc'
fh = Dataset(sic, mode='r')
lons = fh.variables['lon'][:]
lats = fh.variables['lat'][:]
#sic = fh.variables['sic'][2,:,:]
#sic = fh.variables['icec'][9,:,:]
sic = fh.variables['siconc'][9,:,:]
sic_units = fh.variables['siconc'].units
fh.close()
lon_0 = lons.mean()
lat_0 = lats.mean()
#-----------------------------------------
m= Basemap(projection='spstere',resolution='f',boundinglat=-50, round=True,lon_0=180)
#-----------------------------------------
lon, lat = np.meshgrid(lons, lats)
xi, yi = m(lon, lat)
levels = np.linspace(-100,100,14, endpoint=True, dtype=int)
ax = fig.add_subplot(426)
ax.set_title('f) NCAR-CESM2', fontsize=18)
sic = m.contourf(xi,yi,sic,shading='interp', cmap=plt.cm.seismic, levels=levels)
m.drawlsmask()
m.drawcoastlines()
m.drawparallels(np.arange(-80.,81.,20.))
m.drawmeridians(np.arange(-180.,181.,20.))
#-----------------------------------------
sic = '/home/leticia/Documentos/2020.1/leticia_dados_CMIP/dados_subtraidos/BESM_dif_cmip5.nc'
fh = Dataset(sic, mode='r')
lons = fh.variables['lon'][:]
lats = fh.variables['lat'][:]
sic = fh.variables['sic'][9,:,:]
sic_units = fh.variables['sic'].units
fh.close()
lon_0 = lons.mean()
lat_0 = lats.mean()
#-----------------------------------------
m= Basemap(projection='spstere',resolution='f',boundinglat=-50, round=True,lon_0=180)
#-----------------------------------------
lon, lat = np.meshgrid(lons, lats)
xi, yi = m(lon, lat)
levels = np.linspace(-100,100,14, endpoint=True, dtype=int)
ax = fig.add_subplot(427)
ax.set_title('g) BESM-OAV2.5', fontsize=18)
sic = m.contourf(xi,yi,sic,shading='interp', cmap=plt.cm.seismic, levels=levels)
m.drawlsmask()
m.drawcoastlines()
m.drawparallels(np.arange(-80.,81.,20.))
m.drawmeridians(np.arange(-180.,181.,20.))
#-----------------------------------------
fig.subplots_adjust(right=0.8)
ax = fig.add_subplot(1,1,1)
ax.axis('off')
cbar_ax = fig.add_axes([0.85, 0.15, 0.05, 0.7])
ticks=[-100,-50,-15,0,15,50,100]
fig.colorbar(sic,cax=cbar_ax, ticks=ticks, shrink=1.25)
#-----------------------------------------
plt.show