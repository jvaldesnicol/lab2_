	D5M_Subsystem u0 (
		.avalon_d5m_config_slave_address       (<connected-to-avalon_d5m_config_slave_address>),       //    avalon_d5m_config_slave.address
		.avalon_d5m_config_slave_byteenable    (<connected-to-avalon_d5m_config_slave_byteenable>),    //                           .byteenable
		.avalon_d5m_config_slave_read          (<connected-to-avalon_d5m_config_slave_read>),          //                           .read
		.avalon_d5m_config_slave_write         (<connected-to-avalon_d5m_config_slave_write>),         //                           .write
		.avalon_d5m_config_slave_writedata     (<connected-to-avalon_d5m_config_slave_writedata>),     //                           .writedata
		.avalon_d5m_config_slave_readdata      (<connected-to-avalon_d5m_config_slave_readdata>),      //                           .readdata
		.avalon_d5m_config_slave_waitrequest   (<connected-to-avalon_d5m_config_slave_waitrequest>),   //                           .waitrequest
		.d5m_config_I2C_SDAT                   (<connected-to-d5m_config_I2C_SDAT>),                   //                 d5m_config.I2C_SDAT
		.d5m_config_I2C_SCLK                   (<connected-to-d5m_config_I2C_SCLK>),                   //                           .I2C_SCLK
		.d5m_config_exposure                   (<connected-to-d5m_config_exposure>),                   //                           .exposure
		.sys_clk_clk                           (<connected-to-sys_clk_clk>),                           //                    sys_clk.clk
		.sys_reset_reset_n                     (<connected-to-sys_reset_reset_n>),                     //                  sys_reset.reset_n
		.video_in_PIXEL_CLK                    (<connected-to-video_in_PIXEL_CLK>),                    //                   video_in.PIXEL_CLK
		.video_in_LINE_VALID                   (<connected-to-video_in_LINE_VALID>),                   //                           .LINE_VALID
		.video_in_FRAME_VALID                  (<connected-to-video_in_FRAME_VALID>),                  //                           .FRAME_VALID
		.video_in_pixel_clk_reset              (<connected-to-video_in_pixel_clk_reset>),              //                           .pixel_clk_reset
		.video_in_PIXEL_DATA                   (<connected-to-video_in_PIXEL_DATA>),                   //                           .PIXEL_DATA
		.video_in_dma_control_slave_address    (<connected-to-video_in_dma_control_slave_address>),    // video_in_dma_control_slave.address
		.video_in_dma_control_slave_byteenable (<connected-to-video_in_dma_control_slave_byteenable>), //                           .byteenable
		.video_in_dma_control_slave_read       (<connected-to-video_in_dma_control_slave_read>),       //                           .read
		.video_in_dma_control_slave_write      (<connected-to-video_in_dma_control_slave_write>),      //                           .write
		.video_in_dma_control_slave_writedata  (<connected-to-video_in_dma_control_slave_writedata>),  //                           .writedata
		.video_in_dma_control_slave_readdata   (<connected-to-video_in_dma_control_slave_readdata>),   //                           .readdata
		.video_in_dma_master_address           (<connected-to-video_in_dma_master_address>),           //        video_in_dma_master.address
		.video_in_dma_master_waitrequest       (<connected-to-video_in_dma_master_waitrequest>),       //                           .waitrequest
		.video_in_dma_master_write             (<connected-to-video_in_dma_master_write>),             //                           .write
		.video_in_dma_master_writedata         (<connected-to-video_in_dma_master_writedata>)          //                           .writedata
	);

