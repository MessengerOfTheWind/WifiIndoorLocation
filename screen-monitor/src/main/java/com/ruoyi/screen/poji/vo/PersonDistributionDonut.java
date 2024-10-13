package com.ruoyi.screen.poji.vo;

import java.util.List;
import java.util.Map;

public class PersonDistributionDonut {
    private String name;

    private Integer value;

    public PersonDistributionDonut(String name, Integer value) {
        this.name = name;
        this.value = value;
    }

    public PersonDistributionDonut() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "PersonDistributionDonut{" +
                "name='" + name + '\'' +
                ", value=" + value +
                '}';
    }
}
