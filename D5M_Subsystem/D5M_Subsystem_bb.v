
module D5M_Subsystem (
	avalon_d5m_config_slave_address,
	avalon_d5m_config_slave_byteenable,
	avalon_d5m_config_slave_read,
	avalon_d5m_config_slave_write,
	avalon_d5m_config_slave_writedata,
	avalon_d5m_config_slave_readdata,
	avalon_d5m_config_slave_waitrequest,
	d5m_config_I2C_SDAT,
	d5m_config_I2C_SCLK,
	d5m_config_exposure,
	sys_clk_clk,
	sys_reset_reset_n,
	video_in_PIXEL_CLK,
	video_in_LINE_VALID,
	video_in_FRAME_VALID,
	video_in_pixel_clk_reset,
	video_in_PIXEL_DATA,
	video_in_dma_control_slave_address,
	video_in_dma_control_slave_byteenable,
	video_in_dma_control_slave_read,
	video_in_dma_control_slave_write,
	video_in_dma_control_slave_writedata,
	video_in_dma_control_slave_readdata,
	video_in_dma_master_address,
	video_in_dma_master_waitrequest,
	video_in_dma_master_write,
	video_in_dma_master_writedata);	

	input	[1:0]	avalon_d5m_config_slave_address;
	input	[3:0]	avalon_d5m_config_slave_byteenable;
	input		avalon_d5m_config_slave_read;
	input		avalon_d5m_config_slave_write;
	input	[31:0]	avalon_d5m_config_slave_writedata;
	output	[31:0]	avalon_d5m_config_slave_readdata;
	output		avalon_d5m_config_slave_waitrequest;
	inout		d5m_config_I2C_SDAT;
	output		d5m_config_I2C_SCLK;
	input	[15:0]	d5m_config_exposure;
	input		sys_clk_clk;
	input		sys_reset_reset_n;
	input		video_in_PIXEL_CLK;
	input		video_in_LINE_VALID;
	input		video_in_FRAME_VALID;
	input		video_in_pixel_clk_reset;
	input	[11:0]	video_in_PIXEL_DATA;
	input	[1:0]	video_in_dma_control_slave_address;
	input	[3:0]	video_in_dma_control_slave_byteenable;
	input		video_in_dma_control_slave_read;
	input		video_in_dma_control_slave_write;
	input	[31:0]	video_in_dma_control_slave_writedata;
	output	[31:0]	video_in_dma_control_slave_readdata;
	output	[31:0]	video_in_dma_master_address;
	input		video_in_dma_master_waitrequest;
	output		video_in_dma_master_write;
	output	[15:0]	video_in_dma_master_writedata;
endmodule
