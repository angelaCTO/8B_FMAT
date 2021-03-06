library verilog;
use verilog.vl_types.all;
entity single_port_ram_with_init is
    generic(
        ADDR_WIDTH      : integer := 8
    );
    port(
        data            : in     vl_logic_vector(7 downto 0);
        addr            : in     vl_logic_vector;
        writemem        : in     vl_logic;
        readmem         : in     vl_logic;
        clk             : in     vl_logic;
        q               : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
end single_port_ram_with_init;
