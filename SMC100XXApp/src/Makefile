TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Install dbd into <top>/dbd
DBD += SMC100XXSupport.dbd

SMC100XXSupport_DBD += base.dbd
SMC100XXSupport_DBD += stream.dbd
SMC100XXSupport_DBD += asyn.dbd
SMC100XXSupport_DBD += SMC100XXSNC.dbd

# Build an IOC support library
LIBRARY_IOC += SMC100XXSupport

SMC100XXSupport_SRCS += statusDecoder.st

SMC100XXSupport_LIBS += stream
SMC100XXSupport_LIBS += asyn
SMC100XXSupport_LIBS += seq pv
SMC100XXSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

# Build the IOC application
PROD_IOC = SMC100XX

# SMC100XX.dbd will be created and installed
DBD += SMC100XX.dbd

# SMC100XX.dbd will include these files:
SMC100XX_DBD += base.dbd
SMC100XX_DBD += SMC100XXSupport.dbd

# SMC100XX_registerRecordDeviceDriver.cpp derives from SMC100XX.dbd
SMC100XX_SRCS += SMC100XX_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
SMC100XX_SRCS_DEFAULT += SMC100XXMain.cpp
SMC100XX_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#SMC100XX_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Link in the code from our support library
SMC100XX_LIBS += SMC100XXSupport
SMC100XX_LIBS += stream
SMC100XX_LIBS += asyn
SMC100XX_LIBS += seq pv
SMC100XX_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

