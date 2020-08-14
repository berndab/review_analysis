# Amazon Vine Review Bias Analysis

## Analysis of Vine Verses Non-Vine Reviews

### Sample: All Reviews

To determine if Vine reviews are biased, the Amazon reviews for electronic products was analyzed using SQL
queries. The review data was analyzed to determine the percentage of reviews for each review type that were 1, 2, 3, 4,
5-star, the percentage of ratings that were 3 star or above, the average review star ratings, and the percentage of votes the catigorized the review as helpful. The data generated from this analysis is displayed in the following table:

<table>
	<thead>
		<tr>
			<th>Review Type</th>
			<th>1 Star %</th>
			<th>2 Star %</th>
			<th>3 Star %</th>
			<th>4 Star %</th>
			<th>5 Star %</th>
			<th>3 Star & Above %</th>
			<th>Avg Star Rating</th>
			<th>Helpful %</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Non-Vine</td>
			<td>11.63%</td>
			<td>5.80%</td>
			<td>7.67%</td>
			<td>17.24%</td>
			<td>57.66%</td>
			<td>82.57%</td>
			<td>4.03</td>
			<td>78.39%</td>
		</tr>
		<tr>
			<td>Vine</td>
			<td>1.85%</td>
			<td>5.03%</td>
			<td>14.35%</td>
			<td>35.32%</td>
			<td>43.45%</td>
			<td>93.12%</td>
			<td>4.14</td>
			<td>80.76%</td>
		</tr>
	</tbody>
</table>

From the data we can see that Vine reviewers only give a 1-star review 1.85% of the time while non-Vine reviewers give a 1-star review 11.63% of the time. In addition, Vine reviewer give almost twice as many 3 and 4-star reviews. Vine reviews give a 3-star review or above 93.12% of the time while non-Vine reviewers did this only 82.57% of the time.The average star score given by vine reviewerss is 0.11% higher the average start score given by Non-Vine reviewers. This statistical data shows that Vine review have higher star scores for multiple ratings measures over Non-Vine reivew which can only be explained if Vine reviewer are bias towards giving more positive reviews.

### Sample: Products with 15+ Vine and 15+ Non-Vine Reviews

 * **379 electronic products had 15 or more Vine and Non-Vine reviews**

<table>
	<thead>
		<tr>
			<th>Review Type</th>
			<th>1 Star %</th>
			<th>2 Star %</th>
			<th>3 Star %</th>
			<th>4 Star %</th>
			<th>5 Star %</th>
			<th>3 Star & Above %</th>
			<th>Avg Star Rating</th>
			<th>Helpful %</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>Non-Vine</td>
			<td>7.55%</td>
			<td>5.34%</td>
			<td>6.89%</td>
			<td>16.72%</td>
			<td>63.49%</td>
			<td>87.11%</td>
			<td>4.23</td>
			<td>73.33%</td>
		</tr>
		<tr>
			<td>Vine</td>
			<td>1.55%</td>
			<td>4.53%</td>
			<td>14.27%</td>
			<td>35.11%</td>
			<td>44.54%</td>
			<td>93.92%</td>
			<td>4.16</td>
			<td>82.19%</td>
		</tr>
	</tbody>
</table>

If sample is narrowed to only products that have 15 or more Vine and non-Vine reviews, all percent star ratings values for Vine reviews change less than a 1.5%. For Non-Vine review, the 1-star rating percentage decrease by 4% with most of that decrease being shifted to the 5-star review which increases by 6%. The average star ratings for both types of reviews are almost equal with only a 0.07% difference. However, the percentage of Vine reviews that are 3-star and above is still significantly greater by 7% over the percentage of Vine reviews that are 3-star and above. The data from this review sample confirms the hypothosis that Vine reviews are significantly biased towards higher star rating.

### Conclusion:
Since the Vine reviews have significantly higher percentage of 3-star and above ratings than non-Vine reviews for both data samples, the data conclusively demonstrates that Vine reviews are biased towards higher star scored as compared to Non-Vine reviews.
