module reciever #(parameter BAUD_COUNT = 14'd10417 , parameter IDLE = 1'b0, //baudrate = 9600
parameter receiving = 1'b1)(input rx , clk,rst, output reg [7:0] data_out,output reg data_ready);
reg  state;
reg [15:0] counter;
reg [3:0] bit_index; 
reg [7:0] shift_reg; 
reg data_ready_next;
always @(posedge clk) begin
    if (rst) begin
        state <= IDLE;
        data_out <= 8'b0;
        data_ready <= 1'b0;
        data_ready_next <= 1'b0; 
        counter <= 0;
        bit_index <= 0;
        shift_reg <= 8'b0;
    end
    else begin
        case(state)
            IDLE : begin 
                counter <= 0;
                bit_index <= 0;
                if (rx == 1'b0) begin
                    state <= receiving;
                    counter <= 1; 
                end
                else begin
                    state <= IDLE; 
                end
            end
            receiving : begin
                counter <= counter + 1;
                if (counter == BAUD_COUNT/2) begin
                        if (bit_index < 4'd8) begin
                            shift_reg <= {rx, shift_reg[7:1]};
                        end 
                end
                else if (counter >= BAUD_COUNT) begin
                    counter <= 1;  
                    bit_index <= bit_index + 1;
                    if (bit_index == 4'd8) begin
                        data_out <= shift_reg;
                        data_ready <= 1'b1;
                        data_ready_next <= 1'b1;
                        state <= IDLE;
                    end
                    else begin
                        state <= receiving;
                    end
                end
            end
            default: begin
                state <= IDLE;
                counter <= 0;
                bit_index <= 0;
            end
        endcase
        data_ready <= data_ready_next;
    end
end
endmodule