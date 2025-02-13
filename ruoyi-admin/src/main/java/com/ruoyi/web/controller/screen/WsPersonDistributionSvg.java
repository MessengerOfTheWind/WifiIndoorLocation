package com.ruoyi.web.controller.screen;


import com.ruoyi.web.controller.tool.Encoder.TableDataInfoEncoder;
import org.springframework.stereotype.Component;

import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/WsPersonDistributionSvg",encoders = {TableDataInfoEncoder.class})
@Component
public class WsPersonDistributionSvg {

}
