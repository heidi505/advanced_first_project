package com.tenco.team_two_flight_ticket._core.config;
import static org.quartz.JobBuilder.newJob;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.Scheduler;

import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import com.tenco.team_two_flight_ticket.quartz.TripTypeChange;

@Configuration
public class QuartzConfig {
	
	@Autowired
	private Scheduler scheduler; // 쿼츠 스케줄 객체
	
	@PostConstruct
	public void run(){
		JobDetail tripTypeChange = runJobDetail(TripTypeChange.class, new HashMap<>());
		try {
            // 크론형식 지정 후 스케줄 시작
			//scheduler.scheduleJob(tripTypeChange, runJobTrigger("0/10 * * * * ?")); // 10초 마다 한번
			scheduler.scheduleJob(tripTypeChange, runJobTrigger("0 0 12 * * ?")); // 매일 12시마다
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
		
	}
	
	public Trigger runJobTrigger(String scheduleExp){
        	// 크론 스케줄 사용
		return TriggerBuilder.newTrigger()
				.withSchedule(CronScheduleBuilder.cronSchedule(scheduleExp)).build();
	}
	
	public JobDetail runJobDetail(Class job, Map params){
		JobDataMap jobDataMap = new JobDataMap();
		jobDataMap.putAll(params);
	    // 스케줄 생성
		return newJob(job).usingJobData(jobDataMap).build();
	}
	
}