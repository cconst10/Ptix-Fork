# Social Network Deployment Guide - Christodoulos Constantinou (cconst10)

## Overview

This document provides a step-by-step guide to deploying and running the social network application on single or multiple nodes. It covers the setup process, initialization, running experiments, and handling data.

## Prerequisites

- Ensure that you have the necessary permissions and access to the machines where you intend to deploy the application.
- Make sure the machines have the required dependencies installed and are properly configured.

## Deployment Steps

1. **Baseline Configuration:**
   - Execute `./baseline.sh` script to configure the machine(s). This script should be executed on the client node always(e.g for 1 Node on Node1 and for 2 Nodes on Node2) 
   - This script accepts the number of nodes as a parameter. For a single node, run `./baseline.sh 1`.
   - Modify the last command of the script based on the number of nodes by changing the script being called to ./scr.sh for 1 Node deployment and ./scr_2_nodes.sh for 2 Nodes deployment.
   
2. **Initialize Graph:**
   - Run the initialization script from `node0` to initialize the social network graph and create the users.

3. **Initialize Posts:**
   - Run `./run_post.sh` script to initialize the application with posts.
   - Update `localhost` to `node0` in the script if necessary for the wrk command.
   - This script accepts 1 input parameter which has to be the value of '1''.
   
4. **Profiler Setup:**
   - Configure the profiler by updating the host file on the client with `node0` for single node or `node*` for multi-node setup.
   - Install dependencies and start the profiler using `./profiler.sh install` and `./profiler.sh run_profiler`.

5. **Run Experiments:**
   - Execute `./run_user.sh QPS NODES` to run experiments.
   - Update `localhost` to `node0` in the script before running if necessary, for the wrk command.
   - Remove profiler start/stop for nodes not in use.
   - Example: `./run_user.sh 10 1` for 100 queries per second on a single node setup.

6. **Kill Profiler:**
   - Before running another experiment, ensure to stop the profiler using `profiler.sh kill_profiler`.

7. **Data Management:**
   - Move the output data to a directory describing the experiment (e.g., `singlenode_c1_enabled`).

## Conclusion

Following these steps will enable you to deploy and run the social network application efficiently , whether on a single node or across multiple nodes.

