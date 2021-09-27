package com.zyc.crud.test;

import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zyc
 * @create 2021--09--26 21:15
 */
public class HelloGit {
    public static void main(String[] args) {
        int num = 15;
        ArrayList<Integer> result = new ArrayList<>();
        int[] nums = new int[num + 1];
        for (int i = 0; i <= num; i++) {
            nums[i] = i;
        }

        for (int j = 0; j < nums.length; j++) {
            int count = 0;
            ArrayList<Integer> list = int2String(nums[j]);
            for (int i:list) {
                if (i == 1) {
                    count++;
                }
            }
            result.add(count);
        }

        System.out.println(result);

    }

    public static ArrayList<Integer> int2String(int num) {
        ArrayList<Integer> list = new ArrayList<>();
        while (true) {
            int shang = num / 2;
            int yu = num % 2;

            list.add(yu);
            num = shang;

            if (shang == 0) {
                break;
            }
        }
        return list;
    }


}
