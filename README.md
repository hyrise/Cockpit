# Hyrise Cockpit

![Backend Lint and Test](https://github.com/hyrise/Cockpit/workflows/Backend%20Lint%20and%20Test/badge.svg)
![Frontend Lint](https://github.com/hyrise/Cockpit/workflows/Frontend%20Lint/badge.svg)
![Docker Image CI](https://github.com/hyrise/Cockpit/workflows/Docker%20Image%20CI/badge.svg)
<a href="https://github.com/psf/black"><img alt="Code style: black" src="https://img.shields.io/badge/code%20style-black-000000.svg"></a>

This is the repository for the Hyrise Cockpit. The goal of the Cockpit is to visualise the runtime behaviour of multiple Hyrise instances. For that the Cockpit can generate a mix of workloads to set the Hyrise instances under pressure. It is also possible to activate different plugins on different Hyrise instances and compare the impact of them.  
For more information related to the Hyrise database, please refer to https://github.com/hyrise/hyrise. 

## Supported Systems 

The Hyrise Cockpit is mainly developed for Linux (preferrably Ubuntu 20.04 LTS version). It also supports Mac to facilitate the local development of the Cockpit.

## Supported Benchmarks 

The Cockpit supports a number of benchmarks (the benchmarks are meant to facilitate research, not for TPC-compliant benchmarking; e.g., the TPC-H benchmark does not include the refresh stream). 

| Benchmark  | Scale factors|
| ------------- | ------------- |
| TPC-C  | 1, 5 *(warehouses)*  |
| TPC-DS  | 1  |
| TPC-H  | 0.1, 1  |
| JoinOrder  | 1  |

It is possible to combine different benchmarks. A benchmark/workload is defined via a driver. If you want to implement your own benchmark/workload please have a look at https://github.com/hyrise/Cockpit/wiki/Implementing-a-Driver .

## Supported Plugins 

The current plugins are supported at the moment: 

* Compression
* Clustering
* IndexSelection

# Getting started 

There are three different set ups available: 

* Native installation
* Docker set up
* Developer set up

## Install Cockpit 

To install the Cockpit natively, please have a look at:  

https://github.com/hyrise/Cockpit/wiki/Installation-(Native-Setup) 

## Using Docker

It is possible to run the Cockpit completely in docker. The docker setup also includes two Hyrise instances for the Cockpit with all necessary dependencies (benchmark tables, plugins). This setup is at the moment the easiest to setup. Please checkout the following guide for the setup: 

https://github.com/hyrise/Cockpit/wiki/Docker-Setup

## Setting up native Hyrise Database

To use a native Hyrise database (not in docker) it is very important that you set it up correctly to work with the Cockpit. You find a detailed guide under: 

https://github.com/hyrise/Cockpit/wiki/Hyrise-Things

You can also use a native Hyrise with a running Cockpit in docker. 

## Setting up development environment 

If you want to contribute to this project you can setup the development environment described like in the following guide: 

https://github.com/hyrise/Cockpit/wiki/Development-Environment-Setup

# Using the Cockpit 

You can find a detailed guide on how to use the Cockpit under https://github.com/hyrise/Cockpit/wiki/User-guide. 

# Maintainers

* @Alexander-Dubrawski
* @Bensk1
* @Bouncner 

# Contributors

* @Alexander-Dubrawski
* @Bensk1
* @Bouncner 
* @caterinamandel98
* @cH3n7i
* @fabianhe
* @kathwill
* @MaxSchneider1337
* @monasobh 
* @PeterTsayun
* @schTi

