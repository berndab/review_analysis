# Amazon Vine Review Bias Analysis

3093660

## Analysis of Vine Verses Non-Vine Reviews
### Sample: All Reviews
To determine if Vine reviews are biased, the Amazon review data for electronics was analyzed using SQL
queries. First, the review data was analyzed to determine the percentage of reviews that were 1, 2, 3, 4,
5-star for all Vine and non-Vine reviews. Then the average review star rating was determined for all Vine

and non-Vine reviews. Finally, the percentage of votes that were helpful votes for both Vine and non-
Vine reviews were determined. The data generated is in the following table:

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
			<td>5.03</td>
			<td>14.35%</td>
			<td>35.32%</td>
			<td>43.45%</td>
			<td>93.12%</td>
			<td>4.14%</td>
			<td>80.76%</td>
		</tr>
	</tbody>
</table>

From the data we can see that Vine reviewers only give a 1-star review 1.85% of the time while non-Vine
reviewers give a 1-star review 11.63% of the time. In addition, Vine reviewer give almost twice as many
3 and 4-star reviews. Vine reviews give a 3-star review or above 93.12% of the time while non-Vine
reviewers do this only 82.57% of the time. Overall average star score give by vine reviews is 0.11 %
higher the average for non-Vine reviews. This data conclusively shows that in the aggregate, Vine
reviewer are bias towards giving more positive reviews.

### Sample: Products with 15+ Vine and 15+ Non-Vine Reviews

If the products in the sample are narrowed to only product that have 15 or more Vine and non-Vine
reviews, the statistics for the Vine reviews all change less than a 1.5%. For the non-Vine statistics, the
percent of 1-star ratings decrease by 4% with most of that decrease shifting to the 5-star rating
percentage increase of 6%. The average star ratings on both types of reviews are almost equal with just
a 0.07% difference. However, the percentage of review that are 3-star is still significantly higher at
nearly 7% which confirms that Vine reviews are significantly biased towards higher star rating.

### Conclusion:
Since the Vine reviews have significantly higher percentage of 3-star and above review then non-Vine
review for both the total sample of reviews and the same of review for products that have 15 or more
Vine and non-Vine reviews, this conclusively demonstrates that Vine reviews are positively biased as
compared to non-Vine reviews.
