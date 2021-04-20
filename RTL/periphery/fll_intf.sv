// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

/// Interface for FLL controll
interface FLL_BUS (
    input logic clk_i
);
    logic        req;
    logic        wrn;
    logic [1:0]  addr;
    logic [31:0] wdata;
    logic        ack;
    logic [31:0] rdata;
    logic        lock;

    modport out (
        output req, wrn, addr, wdata,
        input ack, rdata, lock
    );

    modport in (
        input req, wrn, addr, wdata,
        output ack, rdata, lock
    );

endinterface