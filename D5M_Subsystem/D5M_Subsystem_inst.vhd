	component D5M_Subsystem is
		port (
			avalon_d5m_config_slave_address       : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			avalon_d5m_config_slave_byteenable    : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			avalon_d5m_config_slave_read          : in    std_logic                     := 'X';             -- read
			avalon_d5m_config_slave_write         : in    std_logic                     := 'X';             -- write
			avalon_d5m_config_slave_writedata     : in    std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			avalon_d5m_config_slave_readdata      : out   std_logic_vector(31 downto 0);                    -- readdata
			avalon_d5m_config_slave_waitrequest   : out   std_logic;                                        -- waitrequest
			d5m_config_I2C_SDAT                   : inout std_logic                     := 'X';             -- I2C_SDAT
			d5m_config_I2C_SCLK                   : out   std_logic;                                        -- I2C_SCLK
			d5m_config_exposure                   : in    std_logic_vector(15 downto 0) := (others => 'X'); -- exposure
			sys_clk_clk                           : in    std_logic                     := 'X';             -- clk
			sys_reset_reset_n                     : in    std_logic                     := 'X';             -- reset_n
			video_in_PIXEL_CLK                    : in    std_logic                     := 'X';             -- PIXEL_CLK
			video_in_LINE_VALID                   : in    std_logic                     := 'X';             -- LINE_VALID
			video_in_FRAME_VALID                  : in    std_logic                     := 'X';             -- FRAME_VALID
			video_in_pixel_clk_reset              : in    std_logic                     := 'X';             -- pixel_clk_reset
			video_in_PIXEL_DATA                   : in    std_logic_vector(11 downto 0) := (others => 'X'); -- PIXEL_DATA
			video_in_dma_control_slave_address    : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			video_in_dma_control_slave_byteenable : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- byteenable
			video_in_dma_control_slave_read       : in    std_logic                     := 'X';             -- read
			video_in_dma_control_slave_write      : in    std_logic                     := 'X';             -- write
			video_in_dma_control_slave_writedata  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			video_in_dma_control_slave_readdata   : out   std_logic_vector(31 downto 0);                    -- readdata
			video_in_dma_master_address           : out   std_logic_vector(31 downto 0);                    -- address
			video_in_dma_master_waitrequest       : in    std_logic                     := 'X';             -- waitrequest
			video_in_dma_master_write             : out   std_logic;                                        -- write
			video_in_dma_master_writedata         : out   std_logic_vector(15 downto 0)                     -- writedata
		);
	end component D5M_Subsystem;

	u0 : component D5M_Subsystem
		port map (
			avalon_d5m_config_slave_address       => CONNECTED_TO_avalon_d5m_config_slave_address,       --    avalon_d5m_config_slave.address
			avalon_d5m_config_slave_byteenable    => CONNECTED_TO_avalon_d5m_config_slave_byteenable,    --                           .byteenable
			avalon_d5m_config_slave_read          => CONNECTED_TO_avalon_d5m_config_slave_read,          --                           .read
			avalon_d5m_config_slave_write         => CONNECTED_TO_avalon_d5m_config_slave_write,         --                           .write
			avalon_d5m_config_slave_writedata     => CONNECTED_TO_avalon_d5m_config_slave_writedata,     --                           .writedata
			avalon_d5m_config_slave_readdata      => CONNECTED_TO_avalon_d5m_config_slave_readdata,      --                           .readdata
			avalon_d5m_config_slave_waitrequest   => CONNECTED_TO_avalon_d5m_config_slave_waitrequest,   --                           .waitrequest
			d5m_config_I2C_SDAT                   => CONNECTED_TO_d5m_config_I2C_SDAT,                   --                 d5m_config.I2C_SDAT
			d5m_config_I2C_SCLK                   => CONNECTED_TO_d5m_config_I2C_SCLK,                   --                           .I2C_SCLK
			d5m_config_exposure                   => CONNECTED_TO_d5m_config_exposure,                   --                           .exposure
			sys_clk_clk                           => CONNECTED_TO_sys_clk_clk,                           --                    sys_clk.clk
			sys_reset_reset_n                     => CONNECTED_TO_sys_reset_reset_n,                     --                  sys_reset.reset_n
			video_in_PIXEL_CLK                    => CONNECTED_TO_video_in_PIXEL_CLK,                    --                   video_in.PIXEL_CLK
			video_in_LINE_VALID                   => CONNECTED_TO_video_in_LINE_VALID,                   --                           .LINE_VALID
			video_in_FRAME_VALID                  => CONNECTED_TO_video_in_FRAME_VALID,                  --                           .FRAME_VALID
			video_in_pixel_clk_reset              => CONNECTED_TO_video_in_pixel_clk_reset,              --                           .pixel_clk_reset
			video_in_PIXEL_DATA                   => CONNECTED_TO_video_in_PIXEL_DATA,                   --                           .PIXEL_DATA
			video_in_dma_control_slave_address    => CONNECTED_TO_video_in_dma_control_slave_address,    -- video_in_dma_control_slave.address
			video_in_dma_control_slave_byteenable => CONNECTED_TO_video_in_dma_control_slave_byteenable, --                           .byteenable
			video_in_dma_control_slave_read       => CONNECTED_TO_video_in_dma_control_slave_read,       --                           .read
			video_in_dma_control_slave_write      => CONNECTED_TO_video_in_dma_control_slave_write,      --                           .write
			video_in_dma_control_slave_writedata  => CONNECTED_TO_video_in_dma_control_slave_writedata,  --                           .writedata
			video_in_dma_control_slave_readdata   => CONNECTED_TO_video_in_dma_control_slave_readdata,   --                           .readdata
			video_in_dma_master_address           => CONNECTED_TO_video_in_dma_master_address,           --        video_in_dma_master.address
			video_in_dma_master_waitrequest       => CONNECTED_TO_video_in_dma_master_waitrequest,       --                           .waitrequest
			video_in_dma_master_write             => CONNECTED_TO_video_in_dma_master_write,             --                           .write
			video_in_dma_master_writedata         => CONNECTED_TO_video_in_dma_master_writedata          --                           .writedata
		);

